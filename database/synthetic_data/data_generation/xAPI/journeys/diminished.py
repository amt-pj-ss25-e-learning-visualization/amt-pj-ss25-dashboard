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

def generate_user_journey_of_diminished_drive_easy_quitter(user_id, start_date, profile):
    """
    Generates a learning journey for a user who starts highly motivated but whose engagement diminishes over time.
    """
    statements = []
    current_date = start_date
    completed_materials = set()
    learning_sessions = {}

    uncompleted_materials = {
        material for subcourse in COURSE_STRUCTURE.values() for material in subcourse["materials"]
    }

    diminishing_factor = 1.0  # User starts with full motivation
    diminishing_rate = 0.9  # Motivation diminishes by 10% each cycle

    while current_date < start_date + timedelta(days=90):
        if not uncompleted_materials:
            break

        material = random.choice(list(uncompleted_materials))
        difficulty_decimal = get_difficulty_decimal(material)
        if random.random() < profile["completion_rate"] * diminishing_factor:
            duration = random.randint(
                int(profile["study_duration"] * 0.5),
                int(profile["study_duration"] * 1.5)
            )

            material_statements, end_time = generate_learning_session(
                user_id, material, current_date, duration
            )
            if material not in learning_sessions:
                learning_sessions[material] = 0
            learning_sessions[material] += 1

            statements.extend(material_statements)

            if random.random() > 0.4 * diminishing_factor:
                current_date += timedelta(minutes=random.randint(3, 10))
                statements.append(generate_statement_with_context(
                    user_id, "rated", material, current_date, rating=random.randint(1, 5)
                ))

            if random.random() > 0.4 * diminishing_factor:
                current_date += timedelta(minutes=random.randint(3, 10))
                statements.append(generate_statement_with_context(
                    user_id, "searched", material, current_date
                ))

            if random.random() < calculate_test_probability(learning_sessions[material], profile):
                session_bonus = min(0.2, 0.05 * learning_sessions[material])
                difficulty_decimal = get_difficulty_decimal(material)
                test_score = random.uniform(
                    (profile["test_performance"] * 0.5 * diminishing_factor) - difficulty_decimal,
                    (profile["test_performance"] * 1.5 * diminishing_factor) - difficulty_decimal
                ) + session_bonus
                test_score = min(1.0, test_score)

                test_statements = generate_test_session(
                    user_id, material, end_time, test_score
                )
                statements.extend(test_statements)

                if random.random() > 0.4 * diminishing_factor:
                    current_date += timedelta(minutes=random.randint(3, 10))
                    statements.append(generate_statement_with_context(
                        user_id, "rated", material, current_date, rating=random.randint(1, 5)
                    ))

                if test_score >= TEST_PASS_THRESHOLD:
                    uncompleted_materials.remove(material)
                    completed_materials.add(material)

        current_date = get_next_study_date(current_date, profile, diminished_factor=diminishing_factor)
        diminishing_factor *= diminishing_rate

    return statements