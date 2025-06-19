from collections import defaultdict

def print_statistics(statements):
    """
    Prints summary statistics based on the generated xAPI statements:
    - Unique number of learning resources used
    - Verb distribution
    """
    stats = {
        'verbs': defaultdict(int),
        'materials': set()
    }

    for stmt in statements:
        # Count verbs
        verb = stmt['verb']['display']['de-DE']
        stats['verbs'][verb] += 1

        # Track materials
        if "object" in stmt and "definition" in stmt["object"] and "name" in stmt["object"]["definition"]:
            material = stmt['object']['definition']['name']['de-DE']
            stats['materials'].add(material)

    print(f"Learning Ressources: {len(stats['materials'])}")
    print("\nVerb Distribution:")
    for verb, count in stats['verbs'].items():
        print(f"  {verb}: {count}")