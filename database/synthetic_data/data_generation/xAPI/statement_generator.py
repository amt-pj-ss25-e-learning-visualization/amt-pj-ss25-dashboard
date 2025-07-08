# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import uuid
import random
from xAPI.config import TEST_PASS_THRESHOLD
from xAPI.course_structure import COURSE_STRUCTURE

# HT for self-evaluation per student-material
SELF_EVAL_TRACKER = {}

def get_next_self_evaluation(user_id, material):
    """
    Get the next self-evaluation value for a user and material.
    If the user has not evaluated this material before, assign a random initial value.
    Else, vary the previous value by ±10–20.
    This function prevents using random values in order to a more realistic simulation of self-evaluation behavior.
    """
    key = (user_id, material)
    
    # Assign initial value between 30 and 80
    if key not in SELF_EVAL_TRACKER:
        SELF_EVAL_TRACKER[key] = random.randint(30, 80)
    
    # Vary previous value by ±10–20
    else:
        prev = SELF_EVAL_TRACKER[key]
        delta = random.randint(10, 20) * random.choice([-1, 1])
        SELF_EVAL_TRACKER[key] = max(0, min(100, prev + delta))
        
    return SELF_EVAL_TRACKER[key]

def deep_merge(json1, json2):
    """
    Recursively merge two dictionaries.
    """
    for key, value in json2.items():
        if key in json1 and isinstance(json1[key], dict) and isinstance(value, dict):
            json1[key] = deep_merge(json1[key], value)
        else:
            json1[key] = value
    return json1

def create_context(
    instructor_name: str,
    instructor_email: str,
    team_name: str = None,
    team_member_names: list = None,
    activity_name: str = None,
    activity_id: str = None,
    parent_activity_name: str = None,
    parent_activity_id: str = None,
    revision: str = None,
    platform: str = None,
    language: str = None
) -> dict:
    """
    Create a context JSON object for a learning record with customizable attributes.
    """
    context = {
        "instructor": {
            "name": instructor_name,
            "mbox": f"mailto:{instructor_email}"
        }
    }

    # Add team details if provided
    if team_name or team_member_names:
        context["team"] = {
            "name": team_name or "Default Team",
            "member": [
                {"name": name, "objectType": "Agent"} for name in (team_member_names or [])
            ],
            "objectType": "Group"
        }

    # Add context activities if provided
    context_activities = {}
    if activity_name or activity_id:
        context_activities["grouping"] = [
            {
                "definition": {"name": {"en-US": activity_name or "Default Activity"}},
                "id": activity_id or "http://example.com/default-activity",
                "objectType": "Activity"
            }
        ]
    if parent_activity_name or parent_activity_id:
        context_activities["parent"] = [
            {
                "id": parent_activity_id or "http://example.com/default-parent-activity",
                "definition": {
                    "name": {"de-DE": parent_activity_name or "Default Parent Activity"}
                }
            },
            {
                "id": "http://example.com/activities/Baumchirurgie",
                "definition": {
                    "name": {"de-DE": "Baumchirurgie"}
                }
            }
        ]
    if context_activities:
        context["contextActivities"] = context_activities

    # Add optional attributes if provided
    if revision:
        context["revision"] = revision
    if platform:
        context["platform"] = platform
    if language:
        context["language"] = language

    return {"context": context}

def generate_statement(
    user_id, verb, activity, timestamp, score=None, duration=None, rating=None, evaluation=None, statement_ref_id=None
):
    """Generate a single xAPI statement"""
    statement = {
        "id": str(uuid.uuid4()),
        "actor": {
            "objectType": "Agent",
            "name": f"User_{user_id}",
            "mbox": f"mailto:user_{user_id}@example.com"
        },
        "verb": {
            "id": f"http://adlnet.gov/expapi/verbs/{verb}",
            "display": {"de-DE": verb}
        }
    }

    if verb == "evaluated" and statement_ref_id:
        statement["object"] = {
            "objectType": "StatementRef",
            "id": statement_ref_id
        }
    else:
        statement["object"] = {
            "id": f"http://example.com/activities/{activity.replace(' ', '_')}",
            "definition": {
                "name": {"de-DE": activity}
            }
        }

    if verb in ["scored", "completed", "failed"]:
        statement["context"] = {
            "extensions": {
                "https://example.com/extensions/threshold": TEST_PASS_THRESHOLD
            }
        }
    else:
        statement["context"] = {}

    statement["timestamp"] = timestamp.strftime("%Y-%m-%dT%H:%M:%S.%f")[:-3] + "Z"

    if score is not None:
        statement["result"] = {
            "score": {
                "scaled": score,
                "raw": int(score * 100),
                "min": 0,
                "max": 100,
            }
        }
    if rating is not None:
        statement["result"] = {
            "score": {
                "raw": int(rating),
                "min": 1,
                "max": 5
            }
        }
    if evaluation is not None:
        if verb == "evaluated":
            eval_value = get_next_self_evaluation(user_id, activity)
        else:
            eval_value = int(evaluation)
        statement["result"] = {
            "score": {
                "raw": eval_value,
                "min": 0,
                "max": 100,
                "scaled": eval_value / 100
            }
        }

    if duration is not None:
        statement["result"] = statement.get("result", {})
        statement["result"]["duration"] = f"PT{duration}M"

    return statement

def add_instructor_context(statement, material):
    """Add instructor context to a statement based on the material."""
    for module in COURSE_STRUCTURE["modules"]:
        module_title = module["title"]
        for submodule in module["submodules"]:
            if material == submodule["title"]:
                instructor_info = module["instructor"]
                instructor_context = create_context(
                    instructor_name=instructor_info["name"],
                    instructor_email=instructor_info["mbox"],
                    parent_activity_name=module_title,
                    parent_activity_id=f"http://example.com/activities/{module_title.replace(' ', '_')}"
                )
                deep_merge(statement, instructor_context)
                break
    return statement

def generate_statement_with_context(
    user_id, verb, activity, timestamp, score=None, duration=None, rating=None, evaluation=None, statement_ref_id=None
):
    return add_instructor_context(
        generate_statement(user_id, verb, activity, timestamp, score, duration, rating, evaluation, statement_ref_id),
        activity
    )