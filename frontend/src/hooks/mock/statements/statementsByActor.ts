import { StatementDto } from "@/types/dto";


const mockStatementsByActors: StatementDto[] = [
  {
    "id": "5a1520d4-52f2-453a-81f3-448f4afa5522",
    "actor_id": "b7e23ec2-05c8-4e8b-8b8c-9b8c8b8c8b8c",
    "module_id": "898be885-cbcf-40fb-a8a6-79f2a4849475",
    "verb": "searched",
    "result": null,
    "timestamp": "2025-02-22T12:34:33.756Z"
  },
  {
    "id": "612092d5-4400-491c-8f90-67e5746f4eac",
    "actor_id": "b7e23ec2-05c8-4e8b-8b8c-9b8c8b8c8b8c",
    "module_id": "b2c3d4e5-6789-2345-0bcd-234567890abc",
    "verb": "rated",
    "result": {
      "score": {
        "max": 5,
        "min": 1,
        "raw": 2
      }
    },
    "timestamp": "2025-02-23T13:52:33.756Z"
  }
]
export default mockStatementsByActors;