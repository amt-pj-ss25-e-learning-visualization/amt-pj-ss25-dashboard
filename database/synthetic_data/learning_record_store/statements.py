import json

def find_module_for_statement(stmt, modules):
    """
    Try to find the module whose title matches the statement's object definition name.
    """
    object_name = stmt.get('object', {}).get('definition', {}).get('name', {}).get('de-DE')
    for mod in modules:
        if mod['title'] == object_name:
            return mod['id']
    return None

def build_statement_id_to_module_id_map(data, modules, resources):
    """
    Build a mapping from statement ID to module ID for all non-evaluated statements.
    """
    statement_id_to_module_id = {}
    for stmt in data:
        verb = stmt['verb']['id']
        if verb != 'http://adlnet.gov/expapi/verbs/evaluated':
            module_id = find_module_for_statement(stmt, modules)
            statement_id_to_module_id[stmt['id']] = module_id
    return statement_id_to_module_id

def insert_statements(cur, data, modules, resources, statement_id_to_module_id, get_or_create_actor, link_instructor_to_module):
    """
    Insert all statements into the database.
    """
    for stmt in data:
        actor_id = get_or_create_actor(cur, stmt['actor'])
        verb = stmt['verb']['id'].split('/')[-1]

        if verb != 'evaluated':
            module_id = find_module_for_statement(stmt, modules)
        else:
            statement_ref_id = stmt.get('object', {}).get('id')
            module_id = statement_id_to_module_id.get(statement_ref_id)

        instructor_id = get_or_create_actor(cur, stmt['context']['instructor'])
        link_instructor_to_module(cur, instructor_id, module_id, modules)

        if module_id is None:
            print(f"Warning: Could not map statement {stmt['id']} to a module.")
            continue

        cur.execute("""
            INSERT INTO statements (id, actor_id, module_id, verb, result, timestamp)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON CONFLICT (id) DO NOTHING
        """, (
            stmt['id'],
            actor_id,
            module_id,
            verb,
            json.dumps(stmt.get('result')) if stmt.get('result') is not None else None,
            stmt['timestamp']
        ))