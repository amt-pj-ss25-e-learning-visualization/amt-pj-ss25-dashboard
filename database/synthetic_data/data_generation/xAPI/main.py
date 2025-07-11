from xAPI.generate_dataset import generate_multi_duration_dataset
from xAPI.statistics import print_statistics
from xAPI.config import SKIP_PROBABILITY

if __name__ == "__main__":
    statements = generate_multi_duration_dataset(SKIP_PROBABILITY)
    print_statistics(statements)