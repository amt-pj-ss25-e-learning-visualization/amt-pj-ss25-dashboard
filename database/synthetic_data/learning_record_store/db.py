import psycopg

def get_db_connection(db_config):
    """
    Return a database connection using the provided configuration (see config.py).
    """
    return psycopg.connect(**db_config)

def truncate_tables(cur):
    """
    Clear all data from the database tables.
    """
    cur.execute("""
        TRUNCATE TABLE statements, actors, courses, modules, learning_resources, module_resources RESTART IDENTITY CASCADE;
    """)