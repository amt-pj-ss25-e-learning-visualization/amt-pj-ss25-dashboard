# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import random
from xAPI.course_structure import COURSE_STRUCTURE
from xAPI.session_generators import generate_material_sessions
from xAPI.utils import get_next_study_date

def generate_user_journey_consistent(user_id, start_date, profile, skip_probability):
    """
    Generate a consistent learning journey for a user who follows a structured approach.
    Some submodules may be skipped based on the skip_probability.
    """
    statements = []
    current_date = start_date

    # Get materials grouped by subcourse for semi-random ordering
    materials_by_module = {
        module["title"]: [sub["title"] for sub in module["submodules"]]
        for module in COURSE_STRUCTURE["modules"]
    }

    # Process materials with some randomness but maintaining some course structure
    while materials_by_module:
        available_modules = [module_title for module_title, materials in materials_by_module.items() if materials]
        if not available_modules:
            break

        module = random.choice(available_modules)
        num_materials = min(random.randint(1, 3), len(materials_by_module[module]))
        for _ in range(num_materials):
            material = random.choice(materials_by_module[module])
            materials_by_module[module].remove(material)

            if random.random() < skip_probability:
                continue

            if random.random() < profile["completion_rate"]:
                material_statements, new_date = generate_material_sessions(
                    user_id, material, current_date, profile
                )
                statements.extend(material_statements)
                current_date = new_date

            current_date = get_next_study_date(current_date, profile, diminished_factor=0.5)

        if not materials_by_module[module]:
            del materials_by_module[module]

    return statements