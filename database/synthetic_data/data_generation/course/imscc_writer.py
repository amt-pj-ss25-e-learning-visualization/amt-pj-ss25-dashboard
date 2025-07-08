
import string
import random
import xml.etree.ElementTree as ET

NAMESPACE = {
    "ims": "http://www.imsglobal.org/xsd/imsccv1p1/imscp_v1p1",
    "lomimscc": "http://ltsc.ieee.org/xsd/imsccv1p1/LOM/manifest",
    "lom": "http://ltsc.ieee.org/xsd/imsccv1p1/LOM/resource",
    "xsi": "http://www.w3.org/2001/XMLSchema-instance"
}

def generate_manifest(
    course_title,
    course_desc,
    modules,
    resources,
    out_path,
    catalog,
    occ
):
    """
    Generate a IMS Common Cartridge manifest.xml file based on the given course structure and resources.
    """

    # Namespaces
    ET.register_namespace('', NAMESPACE["ims"])
    ET.register_namespace('lomimscc', NAMESPACE["lomimscc"])
    ET.register_namespace('lom', NAMESPACE["lom"])
    ET.register_namespace('xsi', NAMESPACE["xsi"])

    # Create root element
    root_id = "R_" + ''.join(random.choices(string.ascii_uppercase + string.digits, k=8))
    manifest = ET.Element("manifest", {
        "xmlns": NAMESPACE["ims"],
        "xmlns:lom": NAMESPACE["lom"],
        "xmlns:xsi": NAMESPACE["xsi"],
        "identifier": root_id,
        "xsi:schemaLocation": (
            f'{NAMESPACE["ims"]} http://www.imsglobal.org/profile/cc/ccv1p1/ccv1p1_imscp_v1p2_v1p0.xsd '
            f'{NAMESPACE["lomimscc"]} http://www.imsglobal.org/profile/cc/ccv1p1/LOM/ccv1p1_lommanifest_v1p0.xsd '
            f'{NAMESPACE["lom"]} http://www.imsglobal.org/profile/cc/ccv1p1/LOM/ccv1p1_lomresource_v1p0.xsd'
        )
    })

    # Metadata
    metadata = ET.SubElement(manifest, "metadata")
    ET.SubElement(metadata, "schema").text = "IMS Common Cartridge"
    ET.SubElement(metadata, "schemaversion").text = "1.1.0"
    lomimscc_lom = ET.SubElement(metadata, "{%s}lom" % NAMESPACE["lomimscc"])
    lomimscc_general = ET.SubElement(lomimscc_lom, "{%s}general" % NAMESPACE["lomimscc"])
    
    # Course Title
    lomimscc_title = ET.SubElement(lomimscc_general, "{%s}title" % NAMESPACE["lomimscc"])
    lomimscc_title_str = ET.SubElement(lomimscc_title, "{%s}string" % NAMESPACE["lomimscc"], language="en")
    lomimscc_title_str.text = lomimscc_title_str.text = course_title.split("/")[0].strip()
    ET.SubElement(lomimscc_general, "{%s}language" % NAMESPACE["lomimscc"]).text = "en"
    
    # Course Description
    lomimscc_desc = ET.SubElement(lomimscc_general, "{%s}description" % NAMESPACE["lomimscc"])
    lomimscc_desc_str = ET.SubElement(lomimscc_desc, "{%s}string" % NAMESPACE["lomimscc"], language="en")
    lomimscc_desc_str.text = course_desc
    
    # Identifier (Entry code & Catalog)
    lomimscc_identifier = ET.SubElement(lomimscc_general, "{%s}identifier" % NAMESPACE["lomimscc"])
    ET.SubElement(lomimscc_identifier, "{%s}catalog" % NAMESPACE["lomimscc"]).text = catalog
    entry_value = None
    if "codes" in occ and occ["codes"]:
        entry_value = occ["codes"][0].get("value")
    if not entry_value:
        entry_value = occ.get("code", "")
    ET.SubElement(lomimscc_identifier, "{%s}entry" % NAMESPACE["lomimscc"]).text = entry_value

    # Organizations (Modules and Submodules)
    orgs = ET.SubElement(manifest, "organizations")
    org_id = "O_" + ''.join(random.choices(string.ascii_uppercase + string.digits, k=8))
    org = ET.SubElement(orgs, "organization", identifier=org_id, structure="rooted-hierarchy")
    root_item = ET.SubElement(org, "item", identifier="root")
    for mod in modules:
        mod_item = ET.SubElement(root_item, "item", identifier=mod["id"])
        ET.SubElement(mod_item, "title").text = mod["title"]
        for sub in mod["submodules"]:
            sub_item = ET.SubElement(mod_item, "item", identifier=sub["id"], identifierref=sub["resource_ref"])
            ET.SubElement(sub_item, "title").text = sub["title"]

    # Resources (LOM files)
    res_elem = ET.SubElement(manifest, "resources")
    for res in resources:
        r = ET.SubElement(res_elem, "resource", identifier=res["identifier"], type="imswl_xmlv1p1")
        ET.SubElement(r, "file", href=res["lom_file"])

    # Write manifest.xml
    tree = ET.ElementTree(manifest)
    ET.indent(tree, space="\t", level=0)
    tree.write(out_path, encoding="utf-8", xml_declaration=True)

def generate_lom_xml(
    skill,
    lo_name,
    lo_desc,
    lo_id,
    out_path
):
    """
    Generate a LOM XML file for a learning object (submodule) with random values for specific tags.
    """

    # Allowed ranges for the different metadata fields
    interactivity_types = ["active", "expositive", "mixed"]
    learning_resource_types = [
        "Exercise", "simulation", "questionnaire", "diagram", "figure",
        "graph", "index", "slide", "table", "narrativetext"
    ]
    rating_levels = ["high", "low", "medium", "very high", "very low"]
    difficulties = ["difficult", "easy", "medium", "very difficult", "very easy"]

    # Generate typical learning time
    typical_learning_time = f"PT{random.randint(1, 30)}M{random.randint(0, 59)}S"

    # Create root element with namespace
    lom = ET.Element("lom", xmlns="http://ltsc.ieee.org/xsd/LOM")
    general = ET.SubElement(lom, "general")

    ## Set LOM metadata
    identifier = ET.SubElement(general, "identifier")
    ET.SubElement(identifier, "entry").text = f"https://example.com/objectMetadata/{lo_id:02d}"
    
    # Title & Language
    title = ET.SubElement(general, "title")
    ET.SubElement(title, "string", language="en-US").text = lo_name
    ET.SubElement(general, "language").text = "en-US"
    
    # Description
    desc = ET.SubElement(general, "description")
    ET.SubElement(desc, "string", language="en-US").text = lo_desc

    # Keywords
    keyword = ET.SubElement(general, "keyword")
    ET.SubElement(keyword, "string", language="en-US").text = "Learning"
    ET.SubElement(keyword, "string", language="en-US").text = "Object"
    ET.SubElement(keyword, "string", language="en-US").text = f"{lo_id:02d}"

    # Set the properties of the learning object
    educational = ET.SubElement(lom, "educational")
    for tag, value in [
        ("interactivityType", random.choice(interactivity_types)),
        ("learningResourceType", random.choice(learning_resource_types)),
        ("interactivityLevel", random.choice(rating_levels)),
        ("semanticDensity", random.choice(rating_levels)),
        ("difficulty", random.choice(difficulties))
    ]:
        t = ET.SubElement(educational, tag)
        ET.SubElement(t, "source").text = "LOMv1.0"
        ET.SubElement(t, "value").text = value

    typicalLearningTime = ET.SubElement(educational, "typicalLearningTime")
    ET.SubElement(typicalLearningTime, "duration").text = typical_learning_time

    classification = ET.SubElement(lom, "classification")
    purpose = ET.SubElement(classification, "purpose")
    ET.SubElement(purpose, "source").text = "LOMv1.0"
    ET.SubElement(purpose, "value").text = "competency"
    taxonPath = ET.SubElement(classification, "taxonPath")
    source = ET.SubElement(taxonPath, "source")
    ET.SubElement(source, "string", language="en-US").text = "ESCO"
    taxon = ET.SubElement(taxonPath, "taxon")
    ET.SubElement(taxon, "id").text = skill["uri"]
    entry = ET.SubElement(taxon, "entry")
    ET.SubElement(entry, "string", language="en-US").text = skill["title"]

    # Write the LOM XML to file
    tree = ET.ElementTree(lom)
    ET.indent(tree, space="\t", level=0)
    tree.write(out_path, encoding="utf-8", xml_declaration=True)