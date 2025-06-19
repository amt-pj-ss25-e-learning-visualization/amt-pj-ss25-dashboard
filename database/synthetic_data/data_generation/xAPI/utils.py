import random
from datetime import timedelta

def get_difficulty_decimal(activity):
    # Define the difficulty ranges based on the alphabet
    difficulty_ranges = {
        1: "ABCDEF",
        2: "GHIJKL",
        3: "MNOPQR",
        4: "STUVWXYZ"
    }
    # Difficulty percentages in decimal form
    difficulty_decimals = {
        1: 0.15,
        2: 0.40,
        3: 0.30,
        4: 0.05,
        0: 0.00  # Default for short names or non-alphabetic characters
    }
    # Strip leading/trailing spaces from the activity
    activity = activity.strip()

    # Get the 7th letter (if the activity is shorter than 7 letters, assign a default difficulty)
    if len(activity) < 7:
        return difficulty_decimals[0]  # Default difficulty for short names

    seventh_letter = activity[6].upper()  # 6 because indexing starts at 0

    # Determine difficulty based on the 7th letter
    for difficulty, letters in difficulty_ranges.items():
        if seventh_letter in letters:
            return difficulty_decimals[difficulty]

    # Default difficulty if the 7th letter is not alphabetic
    return difficulty_decimals[0]

def calculate_test_probability(session_count, profile):
    """Calculate probability of taking a test based on number of learning sessions"""
    min_sessions = profile["min_sessions_before_test"]
    max_sessions = profile["max_sessions_before_test"]

    if session_count < min_sessions:
        return 0.0
    elif session_count >= max_sessions:
        return 1.0
    else:
        # Linear increase in probability
        progress = (session_count - min_sessions) / (max_sessions - min_sessions)
        return progress * 0.8

def get_next_study_date(current_date, profile, diminished_factor=1.0):
    """Calculate the next study date based on user's frequency and preferences"""
    # Convert to integer using floor division
    days_until_next = random.randint(1, int(7 // profile["study_frequency"] * diminished_factor) or 1)
    try:
        next_date = current_date + timedelta(days=days_until_next)
    except OverflowError:
        next_date = current_date  # fallback

    # Set time within user's preferred study window
    hour = random.randint(
        profile["preferred_study_time"]["start_hour"],
        profile["preferred_study_time"]["end_hour"]
    )
    minute = random.randint(0, 59)

    return next_date.replace(hour=hour, minute=minute)