import { ResourceType } from "@/types/dto";
import { languageLabel } from "@/utils/language";
import {
  Languages,
  Clock,
  FileText,
  Puzzle,
  GaugeCircle,
  ListOrdered,
  Flame,
} from "lucide-react";

const Resource = ({ resource }: { resource: ResourceType }) => {
  return (
    <div className="ml-4 mt-2 space-y-2 bg-white p-4 rounded-md border shadow-sm">
      <div className="flex items-center gap-2 text-gray-800 font-medium">
        <FileText className="w-4 h-4" />
        {resource.title}
      </div>

      <div className="ml-6 text-gray-600 italic">{resource.description}</div>

      <div className="ml-6 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-2 mt-3 text-sm text-gray-700">
        <div className="flex items-center gap-2">
          <Languages className="w-4 h-4 text-blue-500" />
          <span>Language: {languageLabel(resource.language)}</span>
        </div>
        <div className="flex items-center gap-2">
          <Puzzle className="w-4 h-4 text-green-500" />
          <span>Type: {resource.learning_resource_type}</span>
        </div>
        <div className="flex items-center gap-2">
          <GaugeCircle className="w-4 h-4 text-purple-500" />
          <span>
            Interactivity: {resource.interactivity_type} (
            {resource.interactivity_level})
          </span>
        </div>
        <div className="flex items-center gap-2">
          <ListOrdered className="w-4 h-4 text-orange-500" />
          <span>Density: {resource.semantic_density}</span>
        </div>
        <div className="flex items-center gap-2">
          <Flame className="w-4 h-4 text-red-500" />
          <span>Difficulty: {resource.difficulty}</span>
        </div>
        <div className="flex items-center gap-2">
          <Clock className="w-4 h-4 text-yellow-600" />
          <span>Duration: {resource.typical_learning_time}</span>
        </div>
      </div>
    </div>
  );
};

export default Resource;
