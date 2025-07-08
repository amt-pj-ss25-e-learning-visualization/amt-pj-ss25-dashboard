import requests

ESCO_API_BASE = "https://ec.europa.eu/esco/api/resource"

def fetch_occupation(uri, language="en"):
    """
    Fetch occupation data from ESCO API.
    See: https://ec.europa.eu/esco/api/doc/esco_api_doc.html#api-BulkOperation-getOccupationByUri
    """
    resp = requests.get(
        f"{ESCO_API_BASE}/occupation",
        params={"uris": uri, "language": language},
        headers={"Accept": "application/json"}
    )

    resp.raise_for_status()
    data = resp.json()
    embedded = data.get("_embedded", {})
    occ = embedded.get(uri)
    
    if not occ:
        raise ValueError(f"Occupation {uri} not found in API response.")
    
    # Get title and description
    title = occ.get("title", "Course")
    if isinstance(title, dict):
        title = title.get("label", "Course")
    desc = occ.get("description", {}).get(language, {}).get("literal")
    
    return title, desc, occ

def fetch_skills_from_embedded(occ):
    """
    Extract skills from the fetched occupation's data.
    """
    skills = []
    for skill in occ.get("_links", {}).get("hasEssentialSkill", []):
        skills.append({
            "uri": skill["uri"],
            "title": skill["title"]
        })
    return skills

def fetch_skill(skill_uri, language="en"):
    """
    Fetch the data for a specific skill from ESCO API.
    See: https://ec.europa.eu/esco/api/doc/esco_api_doc.html#api-BulkOperation-getSkillByUri
    """
    resp = requests.get(
        f"{ESCO_API_BASE}/skill",
        params={"uris": skill_uri, "language": language},
        headers={"Accept": "application/json"}
    )
    resp.raise_for_status()

    data = resp.json()
    embedded = data.get("_embedded", {})
    return embedded.get(skill_uri)

def fetch_skill_description(skill_uri, language="en"):
    """
    Fetch a skill's description from ESCO API (prefer German, Fallback to English).
    """

    skill = fetch_skill(skill_uri, language)
    
    if not skill:
        return ""
    desc = skill.get("description", {}).get(language, {}).get("literal") or ""
    
    return desc

def fetch_subskills(skill):
    """
    Extract subskills from a skill's data.
    """
    
    subskills = []
    for field in ["broaderSkill", "hasEssentialSkill", "hasOptionalSkill"]:
        for sub in skill.get("_links", {}).get(field, []):
            subskills.append({
                "uri": sub["uri"],
                "title": sub["title"]
            })
    return subskills

def fetch_broader_hierarchy(skill, language="en"):
    """
    If a related concept exists for a given skill, fetch that concept via API and return its data.
    """
    broader = skill.get("_links", {}).get("broaderHierarchyConcept", [])
    if broader:
        broader_uri = broader[0]["uri"]
        broader_skill = fetch_skill(broader_uri, language)
        return broader_skill