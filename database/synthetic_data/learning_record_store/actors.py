import uuid

def get_or_create_actor(cur, actor):
    """
    Get or create an actor in the database based on the provided actor dictionary.
    The actor_id is a bijective mapping of the actor's email address.
    """
    mbox = actor['mbox']
    mbox_clean = mbox[len('mailto:'):] if mbox.startswith('mailto:') else mbox
    if mbox_clean.startswith('instructor'):
        role = 'instructor'
    elif mbox_clean.startswith('user_test'):
        role = 'student'
    else:
        role = None
    actor_id = str(uuid.uuid5(uuid.NAMESPACE_DNS, mbox_clean))
    cur.execute(
        "INSERT INTO actors (id, mail, name, role) VALUES (%s, %s, %s, %s) ON CONFLICT (id) DO NOTHING",
        (actor_id, mbox_clean, actor['name'], role)
    )
    return actor_id

def link_instructor_to_module(cur, instructor_id, module_id, modules):
    """
    Link an instructor to the top-level module in the course hierarchy.
    If the module is a submodule, it finds the top-level module and updates its instructor_id.
    """
    module_lookup = {mod['id']: mod for mod in modules}
    current_id = module_id
    top_level_id = None

    while current_id:
        mod = module_lookup.get(current_id)
        if mod is None:
            break
        if mod['parent_id'] is None:
            top_level_id = mod['id']
            break
        current_id = mod['parent_id']

    if top_level_id:
        cur.execute(
            "UPDATE modules SET instructor_id = %s WHERE id = %s",
            (instructor_id, top_level_id)
        )