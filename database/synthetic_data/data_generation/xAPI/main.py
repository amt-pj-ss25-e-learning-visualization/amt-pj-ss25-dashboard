from xAPI.generate_dataset import generate_multi_duration_dataset
from xAPI.statistics import print_statistics

if __name__ == "__main__":
    statements = generate_multi_duration_dataset()
    print_statistics(statements)