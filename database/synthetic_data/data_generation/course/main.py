import os
import argparse
import random
import string
from course.esco_api import (
    fetch_occupation, fetch_skills_from_embedded, fetch_skill,
    fetch_subskills, fetch_broader_hierarchy, fetch_skill_description
)
from course.imscc_writer import generate_manifest, generate_lom_xml

def main(occupation_uri, catalog, out_dir="output_course"):
    """
    Generates IMS CC manifest and LOM files from an ESCO occupation (provided as Input).
    """

    # Create output directories if they don't exist yet
    os.makedirs(out_dir, exist_ok=True)
    lom_dir = os.path.join(out_dir, "loms")
    os.makedirs(lom_dir, exist_ok=True)

    # Fetch API to get occupation data
    course_title, course_desc, occ = fetch_occupation(occupation_uri)
    
    # Extract skills (modules) from the occupation data
    skills = fetch_skills_from_embedded(occ)

    # Fetch subskills (submodules) for each skill (module)
    modules = []
    resources = []
    lo_counter = 1
    for skill in skills:

        # Fetch full skill info
        skill_full = fetch_skill(skill["uri"])
        if not skill_full:
            continue

        # Get direct subskills
        subskills = fetch_subskills(skill_full)

        # If not found, try to find nested subskills via related broader skills
        if not subskills:
            broader = fetch_broader_hierarchy(skill_full)
            if broader:
                subskills = fetch_subskills(broader)

        # If still no subskills, skip this skill
        if not subskills:
            continue

        # Create module entry in the manifest
        mod_id = "M_" + ''.join(random.choices(string.ascii_uppercase + string.digits, k=8))
        module = {
            "id": mod_id,
            "title": skill["title"],
            "submodules": []
        }

        # Create module and submodule hierarchy in the manifest
        for sub in subskills:
            sub_id = "SUB_" + ''.join(random.choices(string.ascii_uppercase + string.digits, k=8))
            res_id = f"LO_{lo_counter:02d}_R"
            lom_file = f"loms/{lo_counter:02d}.xml"
            lo_name = f"Learning Object {lo_counter:02d}"
            lo_desc = sub['title']
            try:
                desc = fetch_skill_description(sub["uri"])
                if desc:
                    lo_desc = f"{sub['title']} ({desc[:60]}...)"
            except Exception:
                pass

            # Generate LOM that will be referenced by a submodule
            generate_lom_xml(sub, lo_name, lo_desc, lo_counter, os.path.join(out_dir, lom_file))
            
            # Add submodule
            module["submodules"].append({
                "id": sub_id,
                "title": sub["title"],
                "resource_ref": res_id
            })
            
            # Add generated LOM to manifest resources
            resources.append({
                "identifier": res_id,
                "type": "imswl_xmlv1p1",
                "lom_file": lom_file
            })
            lo_counter += 1

        modules.append(module)

    # Save XML to manifest.xml
    manifest_path = os.path.join(out_dir, "imsmanifest.xml")
    generate_manifest(course_title, course_desc, modules, resources, manifest_path, catalog, occ)
    print(f"Generated {manifest_path} and {lo_counter-1} LOM files in {lom_dir}/")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate IMS CC manifest and LOM files from ESCO occupation."
    )
    parser.add_argument("occupation_uri", help="Referenced concept URI at the ESCO site")
    parser.add_argument("catalog", help="categorization/subject area for the course")
    parser.add_argument(
        "--output", "-o", default="output_course",
        help="Output directory (default: ./output_course)"
    )
    args = parser.parse_args()
    main(args.occupation_uri, args.catalog, args.output)