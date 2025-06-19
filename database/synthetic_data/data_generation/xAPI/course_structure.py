import json
from xAPI.config import COURSE_STRUCTURE_JSON_PATH

def load_course_structure(json_path=None):
    """
    Load the course structure from a JSON file and makes it available package-wide.
    """
    if json_path is None:
        json_path = COURSE_STRUCTURE_JSON_PATH
    try:
        with open(json_path, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        raise RuntimeError(f"Couldn't load course structure from '{json_path}': {e}")

COURSE_STRUCTURE = load_course_structure()