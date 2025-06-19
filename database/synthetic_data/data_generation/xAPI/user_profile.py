# ------------------------------------------------------------------------------------------------- #
# This script contains modified parts of a script originally developed by a previous project group. #
# Original source: https://github.com/josiegerer/awt-pj-ws2425-analytics-dashboard-1                #
# ------------------------------------------------------------------------------------------------- #

import random

def generate_user_profile():
    """
    Generate a random user profile with learning preferences.
    """
    return {
        "study_frequency": random.randint(2, 4),  # days per week (reduced for more spacing)
        "study_duration": random.randint(30, 180),  # minutes per session
        "completion_rate": random.uniform(0.7, 1.0),  # probability of completing an activity
        "test_performance": random.uniform(0.6, 1.0),  # base test performance

        "min_sessions_before_test": random.randint(2, 3),
        "max_sessions_before_test": random.randint(4, 6),
        "preferred_study_time": {  # Time window when user typically studies
            "start_hour": random.randint(8, 14),
            "end_hour": random.randint(15, 20)
        }
    }