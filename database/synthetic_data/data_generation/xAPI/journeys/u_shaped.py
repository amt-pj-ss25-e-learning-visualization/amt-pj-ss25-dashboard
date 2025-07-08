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

def generate_user_journey_of_ushaped_learner(user_id, start_date, profile):
    """
    Generate a learning journey for a U-shaped learner (starts strong, declines, recovers)
    """
    statements = []
    current_date = start_date
    # Get only the learning materials without subcourse structure
    uncompleted_materials = {
        submodule["title"]
        for module in COURSE_STRUCTURE["modules"]
        for submodule in module["submodules"]
    }
    completed_materials = set()
    learning_sessions = {}

    # Calculate phase boundaries (3 phases over 90 days)
    phase_duration = timedelta(days=30)
    phase1_end = start_date + phase_duration
    phase2_end = phase1_end + phase_duration
    end_date = start_date + timedelta(days=90)

    while current_date < end_date and uncompleted_materials:
        # Determine current phase and adjust engagement
        if current_date < phase1_end:  # High engagement phase
            engagement_multiplier = 2
            study_frequency_modifier = 2
        elif current_date < phase2_end:  # Low engagement phase
            engagement_multiplier = 0.8
            study_frequency_modifier = 0.8
        else:  # Recovery phase
            engagement_multiplier = 2.5
            study_frequency_modifier = 2

        # Randomly search for any material (including completed ones)
        if random.random() < (0.4 * engagement_multiplier) and (uncompleted_materials or completed_materials):
            search_material = random.choice(list(uncompleted_materials | completed_materials))
            current_date += timedelta(minutes=random.randint(1, 10))
            statements.append(generate_statement_with_context(
                user_id, "searched", search_material, current_date
            ))
        current_date += timedelta(minutes=random.randint(2, 5))

        # Select material
        if uncompleted_materials:
            material = random.choice(list(uncompleted_materials))
        else:
            break

        # Initialize learning sessions counter if needed
        if material not in learning_sessions:
            learning_sessions[material] = 0

        # Adjust engagement probability based on phase
        phase_engagement_rate = min(1.0, profile["completion_rate"] * engagement_multiplier)

        if random.random() < phase_engagement_rate:
            # Adjust study duration based on phase
            base_duration = profile["study_duration"]
            duration = random.randint(
                int(base_duration * 0.5 * engagement_multiplier),
                int(base_duration * 1.5 * engagement_multiplier)
            )

            # Learning session
            if random.random() < engagement_multiplier:
                material_statements, end_time = generate_learning_session(
                    user_id, material, current_date, duration
                )
                learning_sessions[material] += 1
                statements.extend(material_statements)
                current_date = end_time

                if random.random() < (0.4 * engagement_multiplier):
                    current_date += timedelta(minutes=random.randint(3, 10))
                    statements.append(generate_statement_with_context(
                        user_id, "searched", material, current_date
                    ))

                # Test taking probability increases with sessions and engagement
                test_probability = calculate_test_probability(learning_sessions[material],
                                                              profile) * engagement_multiplier * 1.5

                if random.random() < test_probability:
                    # Calculate test score based on sessions and phase
                    session_bonus = min(0.2, 0.05 * learning_sessions[material])
                    difficulty_decimal = get_difficulty_decimal(material)
                    base_performance = profile["test_performance"] * engagement_multiplier

                    test_score = random.uniform(
                        base_performance * 0.5 - difficulty_decimal,
                        base_performance * 1.2 - difficulty_decimal
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

                    if random.random() < (0.4 * engagement_multiplier):
                        current_date += timedelta(minutes=random.randint(3, 10))
                        statements.append(generate_statement_with_context(
                            user_id, "rated", material, current_date, rating=random.randint(1, 5)
                        ))

        base_advance = 3 / profile["study_frequency"]
        phase_advance = base_advance / study_frequency_modifier
        current_date = get_next_study_date(
            current_date + timedelta(days=random.uniform(0.5 * phase_advance, 1.5 * phase_advance)),
            profile
        )

    return statements