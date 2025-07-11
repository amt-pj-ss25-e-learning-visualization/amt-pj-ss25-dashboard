# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import json
import uuid
from datetime import datetime, timedelta

from xAPI.config import OUTPUT_FILE_PATH
from xAPI.user_profile import generate_user_profile
from xAPI.journeys.consistent import generate_user_journey_consistent
from xAPI.journeys.inconsistent import generate_user_journey_of_inconsistent_learner
from xAPI.journeys.u_shaped import generate_user_journey_of_ushaped_learner
from xAPI.journeys.diminished import generate_user_journey_of_diminished_drive_easy_quitter

def generate_multi_duration_dataset(skip_probability=0.35):
    """
    Generate dataset with multiple instances of each user type at different durations.
    Some students will not participate in certain modules or submodules based on the skip_probability.
    """
    all_statements = []

    user_types = ["consistent", "inconsistent", "u_shaped", "diminished"]
    durations = [4, 8, 12]

    for user_type in user_types:
        for duration in durations:
            user_id = f"test_{user_type}_{duration}w_{str(uuid.uuid4())[:8]}"
            start_date = datetime.now() - timedelta(weeks=duration)
            profile = generate_user_profile()

            if user_type == "consistent":
                statements = generate_user_journey_consistent(user_id, start_date, profile, skip_probability)
            elif user_type == "inconsistent":
                statements = generate_user_journey_of_inconsistent_learner(user_id, start_date, profile, skip_probability)
            elif user_type == "u_shaped":
                statements = generate_user_journey_of_ushaped_learner(user_id, start_date, profile, skip_probability)
            elif user_type == "diminished":
                statements = generate_user_journey_of_diminished_drive_easy_quitter(user_id, start_date, profile, skip_probability)
            else:
                raise ValueError(f"Unknown user type: {user_type}")

            all_statements.extend(statements)
            print(f"Generated {len(statements)} statements for {user_type} learner ({duration} weeks)")

    all_statements.sort(key=lambda x: x["timestamp"])

    with open(OUTPUT_FILE_PATH, 'w', encoding='utf-8') as f:
        json.dump(all_statements, f, ensure_ascii=False, indent=2)

    print(f"\nTotal statements generated: {len(all_statements)}")
    print(f"Saved to: {OUTPUT_FILE_PATH}")

    return all_statements