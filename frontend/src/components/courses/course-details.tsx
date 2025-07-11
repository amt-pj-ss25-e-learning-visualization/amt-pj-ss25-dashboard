import { BookOpen, Languages } from "lucide-react";
import { CourseDetailsDto } from "@/types/dto";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Accordion } from "../ui/accordion";
import { Module } from "../modules";
import { CourseProgress } from "./course-progress";
import { languageLabel } from "@/utils/language";

interface CourseDetailsProps {
  course: CourseDetailsDto;
}

export default function CourseDetails({ course }: CourseDetailsProps) {
  return (
    <Card className="w-full max-w-screen-xl mx-auto border-0 shadow-none">
      <CardHeader>
        <CardTitle className="text-3xl flex gap-2 items-center text-blue-700">
          <BookOpen className="w-6 h-6" />
          {course.title}
        </CardTitle>
        <p className="text-gray-700 mt-8">{course.description}</p>
        <div className="mt-4 flex items-center gap-2 text-sm text-gray-500 ">
          <Languages className="w-4 h-4" />
          <span className="font-medium">
            Language: {languageLabel(course.language)}
          </span>
        </div>
      </CardHeader>

      {/* Chart for course progress */}
      <CardContent>
        <CourseProgress course={course} />
      </CardContent>

      {/* Course modules view */}
      <CardContent className="space-y-8">
        <Accordion type="multiple" className="w-full flex flex-col gap-4">
          {course.modules.map((module) => (
            <Module key={module.id} module={module} />
          ))}
        </Accordion>
      </CardContent>
    </Card>
  );
}
