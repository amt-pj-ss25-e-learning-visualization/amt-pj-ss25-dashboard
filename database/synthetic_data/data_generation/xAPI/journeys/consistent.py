# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import random
from xAPI.course_structure import COURSE_STRUCTURE
from xAPI.session_generators import generate_material_sessions
from xAPI.utils import get_next_study_date

def generate_user_journey_consistent(user_id, start_date, profile):
    """
    Generate a consistent learning journey for a user who follows a structured approach.
    """
    statements = []
    current_date = start_date

    # Get materials grouped by subcourse for semi-random ordering
    materials_by_subcourse = {}
    for subcourse, content in COURSE_STRUCTURE.items():
        materials_by_subcourse[subcourse] = content["materials"].copy()

    # Process materials with some randomness but maintaining some course structure
    while materials_by_subcourse:
        available_subcourses = [s for s, m in materials_by_subcourse.items() if m]
        if not available_subcourses:
            break

        subcourse = random.choice(available_subcourses)
        num_materials = min(random.randint(1, 3), len(materials_by_subcourse[subcourse]))
        for _ in range(num_materials):
            material = random.choice(materials_by_subcourse[subcourse])
            materials_by_subcourse[subcourse].remove(material)

            if random.random() < profile["completion_rate"]:
                material_statements, new_date = generate_material_sessions(
                    user_id, material, current_date, profile
                )
                statements.extend(material_statements)
                current_date = new_date

            current_date = get_next_study_date(current_date, profile, diminished_factor=0.5)

        if not materials_by_subcourse[subcourse]:
            del materials_by_subcourse[subcourse]

    return statements