import { ActorDto } from "@/types/dto";
import { useModulesByInstructor } from "@/hooks/use-modules";
import {
  Table,
  TableHeader,
  TableBody,
  TableRow,
  TableHead,
  TableCell,
} from "@/components/ui/table";
import { Card } from "../ui/card";
import StudentRank from "./student-rank";
import { useNavigate } from "react-router-dom";
import { Button } from "../ui/button";
import { BookOpenText } from "lucide-react";

function InstructorActivity({ currentActor }: { currentActor: ActorDto }) {
  const {
    data: modules = [],
    loading: loadingModules,
    error: errorModules,
  } = useModulesByInstructor(currentActor?.id);
  const navigate = useNavigate();

  if (loadingModules) return <p>Loading ranking…</p>;
  if (errorModules)
    return (
      <p className="text-red-500">
        Something wrong happened! Please try again...
      </p>
    );

  return (
    <div className="space-y-8 p-4">
      <Card className="p-4">
        <StudentRank />
      </Card>

      <Card className="p-6 space-y-4">
        <h3 className="text-2xl">Your modules</h3>
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>#</TableHead>
              <TableHead>Module Title</TableHead>
              <TableHead>Module ID</TableHead>
              <TableHead></TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {modules?.map((module, id) => {
              return (
                <TableRow key={module.id}>
                  <TableCell>{id + 1}</TableCell>
                  <TableCell className="capitalize">{module.title}</TableCell>
                  <TableCell>{module.id}</TableCell>
                  <TableCell className="text-right">
                    <Button
                      size="sm"
                      variant="outline"
                      className="cursor-pointer"
                      onClick={() => navigate(`/modules/${module.id}`)}
                    >
                      <span>View</span>
                      <span>
                        <BookOpenText />
                      </span>
                    </Button>
                  </TableCell>
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </Card>
    </div>
  );
}

export default InstructorActivity;
