from collections import defaultdict

def print_statistics(statements):
    """
    Prints summary statistics based on the generated xAPI statements:
    - Unique number of learning resources used
    - Verb distribution
    - Range of self-evaluation values for each student, grouped by material
    """
    stats = {
        'verbs': defaultdict(int),
        'materials': set()
    }

    # Id to material name ht
    id_to_material = {}

    # Self-evaluation values: student - material
    self_eval_per_user_material = defaultdict(lambda: defaultdict(list))

    # Build id_to_material mapping
    for stmt in statements:
        if "object" in stmt and "definition" in stmt["object"] and "name" in stmt["object"]["definition"]:
            material = stmt['object']['definition']['name']['de-DE']
            id_to_material[stmt["id"]] = material
            stats['materials'].add(material)

    # Collect self-evaluations
    for stmt in statements:
        verb = stmt.get('verb', {}).get('display', {}).get('de-DE')
        stats['verbs'][verb] += 1

        # Get material name directly if possible
        material = None
        if "object" in stmt and "definition" in stmt["object"] and "name" in stmt["object"]["definition"]:
            material = stmt['object']['definition']['name']['de-DE']
        
        # Look up referenced statement material (via StatementRef)
        elif "object" in stmt and "id" in stmt["object"]:
            material = id_to_material.get(stmt["object"]["id"])

        # Track self-evaluation values
        if verb == "evaluated" and "result" in stmt and "score" in stmt["result"]:
            score = stmt["result"]["score"]
            user = stmt["actor"].get("name") or stmt["actor"].get("mbox")
            if "raw" in score and material:
                self_eval_per_user_material[user][material].append(score["raw"])

    print(f"\nLearning Ressources: {len(stats['materials'])}")
    print("\nVerb Distribution:")
    for verb, count in stats['verbs'].items():
        print(f"  {verb}: {count}")

    print("\nSelf-Evaluation Ranges per Student (grouped by material):")
    for user, materials in self_eval_per_user_material.items():
        print(f"  {user}:")
        for material, evals in materials.items():
            if evals:
                print(f"\t{material}: min={min(evals)}, max={max(evals)}")