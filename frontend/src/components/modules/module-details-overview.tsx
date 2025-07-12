import { useParams, useNavigate } from "react-router-dom";
import { useModuleById } from "@/hooks/use-modules";
import { Button } from "@/components/ui/button";
import { ArrowLeft } from "lucide-react";
import ModuleDetails from "./module-details";

export default function ModuleDetailsOverview() {
  const { id } = useParams();
  const { data: module, loading, error } = useModuleById(id);
  const navigate = useNavigate();

  if (loading) return <p>Loading module...</p>;
  if (error || !module) return <p>Error loading module.</p>;

  return (
    <div className="p-4 space-y-4">
      <Button
        variant="ghost"
        className="cursor-pointer"
        onClick={() => navigate("/modules")}
      >
        <ArrowLeft className="w-4 h-4 mr-2" /> Back to all modules
      </Button>
      <ModuleDetails module={module} />
    </div>
  );
}
