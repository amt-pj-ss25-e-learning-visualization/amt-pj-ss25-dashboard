import {
  BookOpen,
  Languages,
  User,
  Clock,
  FileText,
  Folder,
  Layers,
  Puzzle,
  GaugeCircle,
  ListOrdered,
  Flame,
} from "lucide-react";
import { CourseDetailsDto } from "@/types/dto";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { languageLabel } from "@/utils/language";

interface CourseDetailsProps {
  course: CourseDetailsDto;
}

export default function CourseDetails({ course }: CourseDetailsProps) {
  return (
    <Card className="w-full max-w-screen-xl mx-auto">
      <CardHeader>
        <CardTitle className="text-2xl flex gap-2 items-center text-blue-700">
          <BookOpen className="w-6 h-6" />
          {course.title}
        </CardTitle>
        <p className="text-gray-700 mt-1">{course.description}</p>
        <div className="mt-3 flex items-center gap-2 text-sm text-gray-500">
          <Languages className="w-4 h-4" />
          <span className="font-medium">
            Language: {course.language.toUpperCase()}
          </span>
        </div>
      </CardHeader>

      <CardContent className="space-y-8">
        {course.modules.map((module) => (
          <div
            key={module.id}
            className="bg-slate-50 p-6 rounded-md shadow border border-slate-200"
          >
            <div className="flex items-center gap-2 text-lg font-semibold text-blue-800 mb-1">
              <Folder className="w-5 h-5" />
              {module.title}
            </div>

            {module.instructor && (
              <p className="text-sm text-gray-600 flex items-center gap-2 mb-4">
                <User className="w-4 h-4" />
                Instructor: {module.instructor.name}
              </p>
            )}

            {module.submodules.map((sub) => (
              <div
                key={sub.id}
                className="pl-5 ml-2 border-l-2 border-blue-100 mt-6 space-y-2"
              >
                <div className="flex items-center gap-2 text-base font-medium text-blue-600">
                  <Layers className="w-4 h-4" />
                  {sub.title}
                </div>

                {sub.resources.length && sub.resources[0] && (
                  <div className="ml-4 mt-2 space-y-2 bg-white p-4 rounded-md border shadow-sm">
                    <div className="flex items-center gap-2 text-gray-800 font-medium">
                      <FileText className="w-4 h-4" />
                      {sub.resources[0].title}
                    </div>

                    <div className="ml-6 text-gray-600 italic">
                      {sub.resources[0].description}
                    </div>

                    <div className="ml-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-2 mt-3 text-sm text-gray-700">
                      <div className="flex items-center gap-2">
                        <Languages className="w-4 h-4 text-blue-500" />
                        <span>
                          Language: {languageLabel(sub.resources[0].language)}
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        <Puzzle className="w-4 h-4 text-green-500" />
                        <span>
                          Type: {sub.resources[0].learning_resource_type}
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        <GaugeCircle className="w-4 h-4 text-purple-500" />
                        <span>
                          Interactivity: {sub.resources[0].interactivity_type} (
                          {sub.resources[0].interactivity_level})
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        <ListOrdered className="w-4 h-4 text-orange-500" />
                        <span>
                          Density: {sub.resources[0].semantic_density}
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        <Flame className="w-4 h-4 text-red-500" />
                        <span>Difficulty: {sub.resources[0].difficulty}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        <Clock className="w-4 h-4 text-yellow-600" />
                        <span>
                          Duration: {sub.resources[0].typical_learning_time}
                        </span>
                      </div>
                    </div>
                  </div>
                )}
              </div>
            ))}

            <Separator className="my-6" />
          </div>
        ))}
      </CardContent>
    </Card>
  );
}
