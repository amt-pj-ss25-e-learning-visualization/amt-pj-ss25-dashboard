import { Folder, User } from "lucide-react";
import {
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "../ui/accordion";
import { Submodule } from "../submodule";
import { ModuleType } from "@/types/dto";

export const Module = ({ module }: { module: ModuleType }) => {
  return (
    <AccordionItem
      value={module.id}
      key={module.id}
      className="bg-slate-50 p-6 rounded-md shadow border border-slate-200"
    >
      <AccordionTrigger className="hover:no-underline p-0">
        <div className="flex flex-col">
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
        </div>
      </AccordionTrigger>
      <AccordionContent>
        {module.submodules.map((sub) => (
          <Submodule key={sub.id} module={sub} />
        ))}
      </AccordionContent>
    </AccordionItem>
  );
};
