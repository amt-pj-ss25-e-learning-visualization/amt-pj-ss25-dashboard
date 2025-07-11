import { ModuleDto } from "@/types/dto";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import {
  BookOpen,
  Flag,
  Folder,
  LanguagesIcon,
  Mail,
  User,
} from "lucide-react";
import { useModuleMetrics } from "@/hooks/use-metrics";
import { useActor } from "@/context/actor-context";
import { languageLabel } from "@/utils/language";

export default function ModuleDetails({ module }: { module: ModuleDto }) {
  const { currentActor } = useActor();
  const { data: metrics } = useModuleMetrics(module.id, currentActor?.id);

  console.log(module, metrics);

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle className="text-blue-700 flex items-center gap-2 capitalize">
          <Folder className="w-5 h-5" />
          {module.title}
        </CardTitle>
      </CardHeader>

      <CardContent className="space-y-4 text-gray-700">
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <p>
            <strong>Module ID:</strong> {module.id}
          </p>
          {module.parent_id && (
            <p>
              <strong>Parent Module ID:</strong> {module.parent_id}
            </p>
          )}
        </div>

        {module.course && (
          <div className="flex space-x-3 p-4 bg-blue-50 rounded-lg">
            <BookOpen className="w-6 h-6 text-blue-600 mt-0.5" />
            <div className="flex-1 space-y-1">
              <p className="font-semibold text-blue-700 capitalize">
                Main course: {module.course.title}
              </p>
              <p className="text-md">Subject: {module.course.subject}</p>
              <div className="flex items-center text-md space-x-1">
                <LanguagesIcon color="blue" className="w-4 h-4" />
                <span>{languageLabel(module.course.language)}</span>
              </div>
            </div>
          </div>
        )}

        {module.instructor ? (
          <div className="flex items-start gap-2">
            <User className="w-5 h-5 text-blue-600 mt-1" />
            <span className="font-medium">{module.instructor.name}</span>

            <Mail className="w-5 h-5 text-blue-600 mt-1" />
            <span>{module.instructor.mail}</span>
          </div>
        ) : (
          <p className="italic text-sm text-gray-400">No instructor assigned</p>
        )}
      </CardContent>
    </Card>
  );
}
