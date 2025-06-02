import { CourseDetailsDto } from "@/types/dto";

const mockCourseById: CourseDetailsDto = {
  "id": "cc172b33-65de-4c41-bcfa-347aa9056f80",
  "title": "Baumchirurg",
  "description": "This course covers the basics of tree surgery.",
  "language": "en",
  "modules": [
    {
      "id": "c06d6b64-9b4f-4d9d-8188-2e5deff1b94b",
      "parent_id": null,
      "title": "Grundlagen des Kletterns",
      "instructor": {
        "id": "03a4ccad-b8bf-4fea-a0eb-6c5f56eb963e",
        "mail": "actor@example.com",
        "name": "actor-name",
        "role": "actor-role"
      },
      "resources": [],
      "submodules": [
        {
          "id": "b3fedad9-adfc-4df7-8017-abe841b97cf6",
          "parent_id": "c06d6b64-9b4f-4d9d-8188-2e5deff1b94b",
          "title": "Auf Bäume klettern",
          "instructor": null,
          "resources": {
            "id": "a7e2f833-d2a1-4ec4-862a-4bd1ff999532",
            "title": "Learning Object 03",
            "description": "This is a very interesting learning object",
            "language": "de-DE",
            "interactivity_type": "expositive",
            "interactivity_level": "low",
            "learning_resource_type": "narrative text",
            "semantic_density": "low",
            "difficulty": "low",
            "typical_learning_time": "PT5M30S"
          },
          "submodules": []
        }
      ]
    }
  ]
}

export default mockCourseById;