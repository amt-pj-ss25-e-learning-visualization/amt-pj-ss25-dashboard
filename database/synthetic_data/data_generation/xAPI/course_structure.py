from xAPI.config import COURSE_STRUCTURE_MANIFEST_PATH
import xml.etree.ElementTree as ET

def load_course_structure(manifest_path=None):
    """
    Load the course structure from a manifest.xml file and return it as a Python dictionary.
    """
    if manifest_path is None:
        manifest_path = COURSE_STRUCTURE_MANIFEST_PATH

    ns = {
        'ims': 'http://www.imsglobal.org/xsd/imsccv1p1/imscp_v1p1',
        'lomimscc': 'http://ltsc.ieee.org/xsd/imsccv1p1/LOM/manifest'
    }
    tree = ET.parse(manifest_path)
    root = tree.getroot()

    # Get course title
    title_elem = root.find('.//lomimscc:general/lomimscc:title/lomimscc:string', ns)
    course_title = title_elem.text if title_elem is not None else "Unknown Course"

    # Get course hierarchy
    course_hierarchy = {"title": course_title, "modules": []}
    root_item = root.find('.//ims:organizations/ims:organization/ims:item', ns)  # Updated XPath
    if root_item is not None:
        for index, mod_item in enumerate(root_item.findall('ims:item', ns)):  # Updated XPath
            instructor_name = f"instructor{index + 1}"
            module = {
                "id": mod_item.attrib.get("identifier"),
                "title": mod_item.findtext('ims:title', default="Unknown Module", namespaces=ns),  # Updated XPath
                "submodules": [],
                "instructor": {
                    "name": instructor_name,
                    "mbox": f"{instructor_name}@example.com"
                }
            }
            for sub_item in mod_item.findall('ims:item', ns):  # Updated XPath
                submodule = {
                    "id": sub_item.attrib.get("identifier"),
                    "title": sub_item.findtext('ims:title', default="Unknown Submodule", namespaces=ns),  # Updated XPath
                    "resource_ref": sub_item.attrib.get("identifierref")
                }
                module["submodules"].append(submodule)
            course_hierarchy["modules"].append(module)
    return course_hierarchy

COURSE_STRUCTURE = load_course_structure()