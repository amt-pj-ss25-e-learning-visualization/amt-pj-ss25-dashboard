import {
  Card,
  CardHeader,
  CardTitle,
  CardContent,
  CardFooter,
} from "@/components/ui/card";
import { useModulesByInstructor } from "@/hooks/use-modules";
import { useNavigate } from "react-router-dom";
import { Folder, User, ArrowRight, GraduationCap } from "lucide-react";
import { useActor } from "@/context/actor-context";
import { Button } from "../ui/button";

export default function AllModules() {
  const { currentActor } = useActor();
  const { data: modules } = useModulesByInstructor(currentActor?.id);
  const navigate = useNavigate();

  return (
    <div className="p-6">
      <h3 className="text-2xl mb-4">All Modules</h3>

      {modules?.length === 0 ? (
        <p className="text-sm">No modules available.</p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {modules?.map((mod) => (
            <Card key={mod.id} className="hover:shadow-md transition">
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-blue-800 capitalize">
                  <Folder className="w-4 h-4" />
                  {mod.title}
                </CardTitle>
              </CardHeader>
              <CardContent className="text-sm text-gray-600 space-y-1">
                <div className="flex items-center gap-2">
                  <GraduationCap className="w-4 h-4" />
                  Course ID: {mod.course_id}
                </div>
                <div className="flex items-center gap-2">
                  <User className="w-4 h-4" />
                  Instructor: {mod.instructor_id || "Not assigned"}
                </div>
              </CardContent>
              <CardFooter className="justify-end">
                <Button
                  variant="default"
                  onClick={() => navigate(`/modules/${mod.id}`)}
                  className="flex items-center gap-1 cursor-pointer"
                >
                  View Details
                  <ArrowRight className="w-4 h-4" />
                </Button>
              </CardFooter>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
}
