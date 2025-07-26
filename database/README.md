# Database
This directory includes everything related to the learning record store database, including synthetic learner data, data generators and data import scripts. Please follow this guideline to generate and insert additional synthetic data for the learning record store.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Course Data Generator](#course-data-generator)
- [xAPI Generator](#xapi-generator)
- [Insert Generated Data into LRS](#insert-generated-data-into-lrs)

---

## Prerequisites
Tested with the following environment:
- **Ubuntu 24.04.2 LTS**
- **PostgreSQL 16.9**
- **Python 3.12.3+**

---

## Course Data Generator
The [`Courses`](./synthetic_data/data_generation/course) module enables the generation of synthetic course manifests and corresponding learning resources by querying the [ESCO database](https://esco.ec.europa.eu/en/classification/occupation_main) for a specified occupation.

1. **Change working directory**:
   ```bash
   cd PATH/TO/REPO/database/synthetic_data_data_generation
   ```

2. **Run the python module**:
   ```bash
   python -m course.main <ESCO_CONCEPT_URI> <COURSE_SUBJECT> (optional: -o <OUTPUT_DIR>)
   ```

---

## xAPI Generator
The [`xAPI`](./synthetic_data/data_generation/xAPI) module generates synthetic xAPI statements in JSON format, based on the course data produced in the [previous section](#course-data-generator).

1. **Setup Module Config**:
   Set the paths for `COURSE_STRUCTURE_MANIFEST_PATH` & `OUTPUT_FILE_PATH`.
   ```bash
   nano PATH/TO/REPO/database/synthetic_data/data_generation/xAPI/config.py
   ```

2. **Run the python module**:
   ```bash
   python -m xAPI.main
   ```

---

### Insert Generated Data into LRS
The [`learning_record_store`](./synthetic_data/learning_record_store) module imports the generated course data and xAPI statements into the existing LRS.

1. **Setup Module Config**:
   Set the paths for `IMS_MANIFEST`, `XAPI_STATEMENTS_JSON`, and DB credentials for `DB_CONFIG`.
   ```bash
   nano PATH/TO/REPO/database/synthetic_data/learning_record_store/xAPI/config.py
   ```

2. **Run the python module**:
   ```bash
   python -m learning_record_store.main (optional: --truncate, removes previous data from tables)
   ```
