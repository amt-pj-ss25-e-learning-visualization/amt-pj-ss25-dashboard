import { StatementDto } from "@/types/dto";



const mockStatementById: StatementDto = {
  "id": "5a1520d4-52f2-453a-81f3-448f4afa5522",
  "actor": {
    "id": "03a4ccad-b8bf-4fea-a0eb-6c5f56eb963e",
    "mail": "actor@example.com",
    "name": "actor-name",
    "role": "actor-role"
  },
  "module": {
    "id": "898be885-cbcf-40fb-a8a6-79f2a4849475",
    "course_id": "cc172b33-65de-4c41-bcfa-347aa9056f80",
    "parent_id": null,
    "title": "Grundlagen des Kletterns",
    "instructor_id": "a3b4c5d6-7890-3456-1cde-345678901bcd"
  },
  "verb": "searched",
  "result": {},
  "timestamp": "2025-02-22T12:34:33.756Z"
}

export default mockStatementById;