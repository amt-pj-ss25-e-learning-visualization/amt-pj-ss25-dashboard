# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import random
from datetime import timedelta
from xAPI.course_structure import COURSE_STRUCTURE
from xAPI.statement_generator import generate_statement_with_context
from xAPI.utils import (
    calculate_test_probability, get_difficulty_decimal, get_next_study_date
)
from xAPI.config import TEST_PASS_THRESHOLD
from xAPI.session_generators import generate_learning_session, generate_test_session

def generate_user_journey_of_inconsistent_learner(user_id, start_date, profile, skip_probability):
    """
    Generate a learning journey for an inconsistent learner.
    Some submodules may be skipped based on the skip_probability.
    """
    statements = []
    current_date = start_date
    completed_materials = set()
    learning_sessions = {}

    uncompleted_materials = {
        submodule["title"]
        for module in COURSE_STRUCTURE["modules"]
        for submodule in module["submodules"]
    }

    while current_date < start_date + timedelta(days=90):
        if not uncompleted_materials:
            break

        material = random.choice(list(uncompleted_materials))

        if random.random() < skip_probability:
            uncompleted_materials.remove(material)
            continue

        if random.random() < profile["completion_rate"] * 1.5:
            duration = random.randint(
                int(profile["study_duration"] * 0.5),
                int(profile["study_duration"] * 1.5)
            )
            if material not in learning_sessions:
                learning_sessions[material] = 0

            if random.random() > 0.3:
                material_statements, end_time = generate_learning_session(
                    user_id, material, current_date, duration
                )
                learning_sessions[material] += 1
                current_date = end_time
                statements.extend(material_statements)

                if random.random() < 0.05:
                    current_date += timedelta(minutes=random.randint(3, 10))
                    statements.append(generate_statement_with_context(
                        user_id, "rated", material, current_date, rating=random.randint(1, 5)
                    ))

            if random.random() < 0.4:
                current_date += timedelta(minutes=random.randint(3, 10))
                statements.append(generate_statement_with_context(
                    user_id, "searched", material, current_date
                ))

            if random.random() < calculate_test_probability(learning_sessions[material], profile) * 2:
                session_bonus = min(0.2, 0.05 * learning_sessions[material])
                difficulty_decimal = get_difficulty_decimal(material)
                test_score = random.uniform(
                    profile["test_performance"] * 0.5 - difficulty_decimal,
                    profile["test_performance"] * 1.5 - difficulty_decimal
                ) + session_bonus
                test_score = min(1.0, test_score)
                current_date += timedelta(minutes=random.randint(10, 60))
                test_statements = generate_test_session(
                    user_id, material, current_date, test_score
                )
                statements.extend(test_statements)

                if test_score >= TEST_PASS_THRESHOLD:
                    uncompleted_materials.remove(material)
                    completed_materials.add(material)

                if random.random() < 0.4:
                    current_date += timedelta(minutes=random.randint(3, 10))
                    statements.append(generate_statement_with_context(
                        user_id, "rated", material, current_date, rating=random.randint(1, 5)
                    ))

        current_date = get_next_study_date(current_date, profile)

    return statements