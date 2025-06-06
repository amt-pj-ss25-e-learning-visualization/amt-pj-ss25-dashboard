import { ModuleDto } from "@/types/dto";


const mockModules: ModuleDto[] = [
  {
    "id": "898be885-cbcf-40fb-a8a6-79f2a4849475",
    "course_id": "cc172b33-65de-4c41-bcfa-347aa9056f80",
    "parent_id": null,
    "title": "Grundlagen des Kletterns",
    "instructor_id": "123e4567-e89b-12d3-a456-426614174000"
  },
  {
    "id": "b2c3d4e5-6789-2345-0bcd-234567890abc",
    "course_id": "cc172b33-65de-4c41-bcfa-347aa9056f80",
    "parent_id": "898be885-cbcf-40fb-a8a6-79f2a4849475",
    "title": "Kettensäge bedienen",
    "instructor_id": null
  }
]

export default mockModules;