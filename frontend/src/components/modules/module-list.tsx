import { ModuleDto } from "@/types/dto";
import {
  Card,
  CardHeader,
  CardTitle,
  CardContent,
  CardFooter,
} from "@/components/ui/card";
import { Folder, User, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";

interface Props {
  modules: ModuleDto[];
}

export default function ModuleList({ modules }: Props) {
  if (!modules.length) return <p>No modules found.</p>;

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {modules.map((m) => (
        <Card key={m.id} className="hover:shadow-md transition">
          <CardHeader>
            <CardTitle className="flex gap-2 items-center text-blue-700">
              <Folder className="w-5 h-5" />
              {m.title}
            </CardTitle>
          </CardHeader>

          <CardContent className="text-sm text-gray-700">
            <p>
              Course ID: <span className="font-mono">{m.course_id}</span>
            </p>
            {m.parent_id && (
              <p>
                Parent Module: <span className="font-mono">{m.parent_id}</span>
              </p>
            )}
          </CardContent>

          <CardFooter className="flex justify-between items-center">
            {m.instructor_id ? (
              <div className="text-sm flex gap-1 items-center text-gray-600">
                <User className="w-4 h-4" />
                {m.instructor_id}
              </div>
            ) : (
              <span className="text-xs text-gray-400 italic">
                No instructor
              </span>
            )}

            <Link
              to={`/modules/${m.id}`}
              className="text-blue-700 font-medium flex items-center gap-1"
            >
              View <ArrowRight className="w-4 h-4" />
            </Link>
          </CardFooter>
        </Card>
      ))}
    </div>
  );
}
