import xml.etree.ElementTree as ET
import uuid

def parse_imsmanifest(manifest_path):
    """
    Parse the IMS manifest file and extract learning resources.
    Returns a dictionary mapping resource identifiers to their file paths.
    """
    ns = {'ims': 'http://www.imsglobal.org/xsd/imsccv1p1/imscp_v1p1'}
    tree = ET.parse(manifest_path)
    root = tree.getroot()
    resources = {}
    for res in root.findall('.//ims:resource', ns):
        identifier = res.attrib.get('identifier')
        file_elem = res.find('ims:file', ns)
        if file_elem is not None:
            href = file_elem.attrib.get('href')
            resources[identifier] = href
    return resources

def parse_course_metadata(manifest_path):
    """
    Parse the course metadata from the IMS manifest file.
    Returns the course title, description, and language.
    """
    ns = {
        'ims': 'http://www.imsglobal.org/xsd/imsccv1p1/imscp_v1p1',
        'lomimscc': 'http://ltsc.ieee.org/xsd/imsccv1p1/LOM/manifest'
    }
    tree = ET.parse(manifest_path)
    root = tree.getroot()
    title = description = language = None
    lom = root.find('.//ims:metadata/lomimscc:lom', ns)
    if lom is not None:
        title_elem = lom.find('.//lomimscc:general/lomimscc:title/lomimscc:string', ns)
        desc_elem = lom.find('.//lomimscc:general/lomimscc:description/lomimscc:string', ns)
        lang_elem = lom.find('.//lomimscc:general/lomimscc:language', ns)
        title = title_elem.text if title_elem is not None else "Imported Course"
        description = desc_elem.text if desc_elem is not None else "Imported from IMS"
        language = lang_elem.text if lang_elem is not None else "und"
    else:
        raise ValueError("No LOM metadata found in the manifest file.")
    return title, description, language

def parse_modules_from_manifest(manifest_path):
    """
    Parse the IMS manifest file to extract modules and recursively get the course hierarchy.
    Returns a list of dictionaries representing modules.
    Each dictionary contains:
        - 'id': Unique identifier for the module
        - 'title': Title of the module
        - 'parent_id': Identifier of the parent module (None for root)
        - 'resource_ref': Identifier of the resource associated with the module
    """
    ns = {
        'ims': 'http://www.imsglobal.org/xsd/imsccv1p1/imscp_v1p1'
    }
    tree = ET.parse(manifest_path)
    root = tree.getroot()
    modules = []

    org = root.find('.//ims:organizations/ims:organization', ns)
    if org is None:
        return modules

    root_item = org.find('ims:item', ns)
    if root_item is not None and root_item.attrib.get('identifier', '').lower() == 'root':
        items_to_process = root_item.findall('ims:item', ns)
    else:
        items_to_process = org.findall('ims:item', ns)

    def walk_items(parent_elem_list, parent_id=None):
        for item in parent_elem_list:
            module_title = item.findtext('ims:title', default="Untitled Module", namespaces=ns)
            identifier = item.attrib.get('identifier')
            resource_ref = item.attrib.get('identifierref')
            module_id = str(uuid.uuid5(uuid.NAMESPACE_DNS, identifier))
            modules.append({
                'id': module_id,
                'title': module_title,
                'parent_id': parent_id,
                'resource_ref': resource_ref
            })
            walk_items(item.findall('ims:item', ns), module_id)

    walk_items(items_to_process)
    return modules