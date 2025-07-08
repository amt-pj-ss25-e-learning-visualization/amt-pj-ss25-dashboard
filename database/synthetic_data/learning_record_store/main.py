import json
import uuid
import argparse
from learning_record_store.config import IMS_MANIFEST, XAPI_STATEMENTS_JSON, DB_CONFIG
from learning_record_store.ims_parser import parse_imsmanifest, parse_course_metadata, parse_modules_from_manifest
from learning_record_store.lom_parser import get_resource_xml, parse_learning_resource_xml
from learning_record_store.db import get_db_connection, truncate_tables
from learning_record_store.actors import get_or_create_actor, link_instructor_to_module
from learning_record_store.statements import build_statement_id_to_module_id_map, insert_statements

if __name__ == "__main__":
    """
    This script reads the course structure and metadata from an 
    IMS manifest file (including referenced learning resources in LOM XML format),
    links them to the generated xAPI statements, and inserts all data into a PostgreSQL database.

    If the package is run with the `--truncate` flag, it will first clear all tables before inserting new data.
    """
    parser = argparse.ArgumentParser(description="Insert a course (IMS CC, LOM, xAPI) into the LRS")
    parser.add_argument("--truncate", action="store_true", help="Truncate all tables before inserting data")
    args = parser.parse_args()

    print(">> Parsing IMS manifest and resources...")
    resources = parse_imsmanifest(IMS_MANIFEST)
    print(f"Found {len(resources)} resources in manifest.")

    print(">> Parsing course metadata...")
    course_title, course_desc, course_lang = parse_course_metadata(IMS_MANIFEST)
    print(f"Course title: {course_title}")

    print(">> Parsing modules from manifest...")
    modules = parse_modules_from_manifest(IMS_MANIFEST)
    print(f"Found {len(modules)} modules.")

    print(">> Loading xAPI statements from Json...")
    with open(XAPI_STATEMENTS_JSON) as f:
        data = json.load(f)
    print(f"Loaded {len(data)} xAPI statements.")

    print(">> Connecting to database...")
    with get_db_connection(DB_CONFIG) as conn:
        with conn.cursor() as cur:
            if args.truncate:
                print(">> Clearing tables...")
                truncate_tables(cur)
            else:
                print(">> Skipping table truncation.")

            print(">> Inserting course into 'courses' table...")
            course_id = str(uuid.uuid4())
            cur.execute("""
                INSERT INTO courses (id, title, description, language)
                VALUES (%s, %s, %s, %s)
            """, (course_id, course_title, course_desc, course_lang))

            print(">> Inserting learning resources into 'learning_resources' table...")
            resource_id_map = {}
            lr_count = 0
            for identifier, path in resources.items():  # 'path' is now relative to the manifest location
                if not path.endswith('.xml'):
                    continue
                xml_bytes = get_resource_xml(path)  # Pass the relative path directly
                meta = parse_learning_resource_xml(xml_bytes)
                lr_id = str(uuid.uuid5(uuid.NAMESPACE_URL, path))
                resource_id_map[path] = lr_id
                cur.execute("""
                    INSERT INTO learning_resources
                    (id, title, description, language, interactivity_type, interactivity_level, learning_resource_type, semantic_density, difficulty, typical_learning_time)
                    VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
                    ON CONFLICT (id) DO NOTHING
                """, (
                    lr_id,
                    meta["title"],
                    meta["description"],
                    meta["language"],
                    meta["interactivity_type"],
                    meta["interactivity_level"],
                    meta["learning_resource_type"],
                    meta["semantic_density"],
                    meta["difficulty"],
                    meta["typical_learning_time"]
                ))
                lr_count += 1
            print(f"Inserted {lr_count} learning resources.")

            print(">> Inserting modules into 'modules' table...")
            for mod in modules:
                cur.execute("""
                    INSERT INTO modules (id, course_id, parent_id, title, instructor_id)
                    VALUES (%s, %s, %s, %s, %s)
                """, (
                    mod['id'],
                    course_id,
                    mod['parent_id'],
                    mod['title'],
                    None
                ))
            print(f"Inserted {len(modules)} modules.")

            print(">> Inserting learning resources <-> modules link into 'module_resources' join-table...")
            link_count = 0
            for mod in modules:
                if mod['resource_ref'] and mod['resource_ref'] in resources:
                    url = resources[mod['resource_ref']]
                    if url.endswith('.xml'):
                        lr_id = str(uuid.uuid5(uuid.NAMESPACE_URL, url))
                        cur.execute("""
                            INSERT INTO module_resources (module_id, resource_id)
                            VALUES (%s, %s)
                        """, (mod['id'], lr_id))
                        link_count += 1
            print(f"Linked {link_count} resources to modules.")

            print(">> Building statement-to-module map...")
            statement_id_to_module_id = build_statement_id_to_module_id_map(data, modules, resources)
            
            print(">> Inserting xAPI statements - this may take a while...")
            insert_statements(
                cur, data, modules, resources, statement_id_to_module_id,
                get_or_create_actor, link_instructor_to_module
            )
            print("All xAPI statements inserted.")

            conn.commit()