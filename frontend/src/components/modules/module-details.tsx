import { ModuleDto } from "@/types/dto";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Folder, User } from "lucide-react";

interface Props {
  module: ModuleDto;
}

export default function ModuleDetails({ module }: Props) {
  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle className="text-blue-700 flex items-center gap-2">
          <Folder className="w-5 h-5" />
          {module.title}
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-2 text-gray-700">
        <p>
          <strong>Module ID:</strong> {module.id}
        </p>
        <p>
          <strong>Course ID:</strong> {module.course_id}
        </p>
        {module.parent_id && (
          <p>
            <strong>Parent Module ID:</strong> {module.parent_id}
          </p>
        )}
        {module.instructor_id ? (
          <p className="flex items-center gap-1">
            <User className="w-4 h-4" />
            <span>Instructor ID: {module.instructor_id}</span>
          </p>
        ) : (
          <p className="italic text-sm text-gray-400">No instructor assigned</p>
        )}
      </CardContent>
    </Card>
  );
}
