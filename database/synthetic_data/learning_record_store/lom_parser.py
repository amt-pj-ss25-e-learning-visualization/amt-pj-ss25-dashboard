from pathlib import Path
import xml.etree.ElementTree as ET

def get_resource_xml(path):
    """
    Read the referenced LOM file from the local filesystem.
    """
    fname = Path(path)
    if not fname.exists():
        raise FileNotFoundError(f"LOM file not found: {path}")
    return fname.read_bytes()

def parse_learning_resource_xml(xml_content):
    """
    Parse the LOM XML content and extract relevant metadata that will be stored in the LRS.
    Returns dict with:
        - title
        - description
        - language
        - interactivity_type
        - interactivity_level
        - learning_resource_type
        - semantic_density
        - difficulty
        - typical_learning_time
    """
    ns = {'lom': 'http://ltsc.ieee.org/xsd/LOM'}
    tree = ET.fromstring(xml_content)
    lom = tree
    def get_text(path):
        elem = lom.find(path, ns)
        return elem.text if elem is not None else None

    title = get_text('.//lom:general/lom:title/lom:string')
    description = get_text('.//lom:general/lom:description/lom:string')
    language = get_text('.//lom:general/lom:language')
    interactivity_type = get_text('.//lom:educational/lom:interactivityType/lom:value')
    interactivity_level = get_text('.//lom:educational/lom:interactivityLevel/lom:value')
    learning_resource_type = get_text('.//lom:educational/lom:learningResourceType/lom:value')
    semantic_density = get_text('.//lom:educational/lom:semanticDensity/lom:value')
    difficulty = get_text('.//lom:educational/lom:difficulty/lom:value')
    typical_learning_time = get_text('.//lom:educational/lom:typicalLearningTime/lom:duration')
    return {
        "title": title,
        "description": description,
        "language": language,
        "interactivity_type": interactivity_type,
        "interactivity_level": interactivity_level,
        "learning_resource_type": learning_resource_type,
        "semantic_density": semantic_density,
        "difficulty": difficulty,
        "typical_learning_time": typical_learning_time
    }