import random
from datetime import timedelta

from xAPI.statement_generator import generate_statement_with_context, generate_statement, add_instructor_context
from xAPI.utils import calculate_test_probability, get_difficulty_decimal, get_next_study_date
from xAPI.config import TEST_PASS_THRESHOLD

def generate_material_sessions(user_id, material, current_date, profile):
    """Generate multiple learning sessions for a material until test is passed or max attempts reached"""
    statements = []
    session_count = 0
    test_passed = False
    MAX_SESSIONS = 10

    while not test_passed and session_count < MAX_SESSIONS:
        session_count += 1

        if random.random() < 0.4:
            statements.append(generate_statement_with_context(
                user_id, "searched", material, current_date
            ))
        current_date += timedelta(minutes=random.randint(2, 5))

        duration = random.randint(
            int(profile["study_duration"] * 0.8),
            int(profile["study_duration"] * 1.2)
        )

        s_init = generate_statement_with_context(
            user_id, "initialized", material, current_date
        )
        statements.append(s_init)

        exit_time = current_date + timedelta(minutes=duration)
        s_exit = generate_statement_with_context(
            user_id, "exited", material, exit_time,
            duration=duration
        )
        statements.append(s_exit)

        eval_time = exit_time + timedelta(minutes=1)
        eval_score = random.randint(0, 100)
        s_eval = generate_statement_with_context(
            user_id, "evaluated", material, eval_time,
            evaluation=eval_score,
            statement_ref_id=s_exit["id"]
        )
        statements.append(s_eval)

        if random.random() < 0.3:
            rate_time = eval_time + timedelta(minutes=random.randint(1, 5))
            statements.append(generate_statement_with_context(
                user_id, "rated", material, rate_time,
                rating=random.randint(1, 5)
            ))
            exit_time = rate_time

        test_probability = calculate_test_probability(session_count, profile)

        if random.random() < test_probability:
            test_time = exit_time + timedelta(minutes=random.randint(60, 240))
            session_bonus = min(0.2, 0.05 * session_count)
            difficulty_decimal = get_difficulty_decimal(material)
            base_score = random.uniform(
                profile["test_performance"] * 0.8,
                profile["test_performance"] * 1.1
            )
            test_score = min(1.0, base_score - difficulty_decimal + session_bonus)

            # Generate test statements
            test_statements = generate_test_session(
                user_id, material, test_time, test_score
            )
            statements.extend(test_statements)

            if test_score >= TEST_PASS_THRESHOLD:
                test_passed = True
                current_date = get_next_study_date(test_time, profile)
            else:
                current_date = get_next_study_date(test_time, profile, diminished_factor=1.0)
        else:
            current_date = get_next_study_date(exit_time, profile)

        if session_count == MAX_SESSIONS and not test_passed:
            final_test_time = current_date + timedelta(minutes=random.randint(60, 240))
            final_score = TEST_PASS_THRESHOLD
            test_statements = generate_test_session(
                user_id, material, final_test_time, final_score
            )
            statements.extend(test_statements)
            test_passed = True

    return statements, current_date

def generate_learning_session(user_id, material, timestamp, duration):
    """Generate statements for a complete learning material session"""
    statements = []
    s_init = generate_statement_with_context(
        user_id, "initialized", material, timestamp
    )
    statements.append(s_init)

    exit_time = timestamp + timedelta(minutes=duration)
    s_exit = generate_statement_with_context(
        user_id, "exited", material, exit_time,
        duration=duration
    )
    statements.append(s_exit)

    eval_time = exit_time + timedelta(minutes=1)
    eval_score = random.randint(0, 100)
    s_eval = generate_statement_with_context(
        user_id, "evaluated", material, eval_time,
        evaluation=eval_score,
        statement_ref_id=s_exit["id"]
    )
    statements.append(s_eval)

    return statements, exit_time

def generate_test_session(user_id, material, timestamp, score):
    """Generate statements for a complete test session"""
    test_name = f"{material}"
    s_scored = add_instructor_context(
        generate_statement(user_id, "scored", test_name, timestamp, score=score), material
    )
    verb = "completed" if score >= TEST_PASS_THRESHOLD else "failed"
    s_comp = add_instructor_context(
        generate_statement(
            user_id,
            verb,
            test_name,
            timestamp + timedelta(minutes=1),
            score=score
        ),
        material
    )
    statements = [s_scored, s_comp]

    eval_time = timestamp + timedelta(minutes=2)
    eval_score = random.randint(0, 100)
    s_eval = add_instructor_context(
        generate_statement(
            user_id, "evaluated", test_name, eval_time,
            evaluation=eval_score,
            statement_ref_id=s_comp["id"]
        ),
        material
    )
    statements.append(s_eval)

    return statements