import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useActor } from "@/context/actor-context";
import {
  useRecommendationsBySimilarActors,
  useRecommendationsByReview,
  useRecommendationsByTopic,
} from "@/hooks/use-recommendations";
import {
  Table,
  TableHeader,
  TableBody,
  TableRow,
  TableHead,
  TableCell,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { Card } from "../ui/card";
import { BookOpenText, LayoutList } from "lucide-react";

const allFilters = ["similar", "review", "topic"] as const;

const filterDescriptions: Record<(typeof allFilters)[number], string> = {
  similar: "Modules other students like you have found helpful.",
  review:
    "Modules you should revisit soon to reinforce your learning before it fades: based on your personal forgetting curve.",
  topic: "Modules we think you'll like based on your interests.",
};

export default function RecommenderSystem() {
  const { currentActor } = useActor();
  const actorId = currentActor?.id ?? "";
  const [mode, setMode] = useState<"similar" | "review" | "topic">("similar");
  const navigate = useNavigate();

  const {
    data: similar,
    loading: loadingSimilar,
    error: errorSimilar,
  } = useRecommendationsBySimilarActors(actorId);
  const {
    data: review,
    loading: loadingReview,
    error: errorReview,
  } = useRecommendationsByReview(actorId);
  const {
    data: topic,
    loading: loadingTopic,
    error: errorTopic,
  } = useRecommendationsByTopic(actorId);

  const loading = loadingReview || loadingSimilar || loadingTopic;
  const error = errorReview || errorSimilar || errorTopic;
  const data =
    mode === "similar" ? similar : mode === "review" ? review : topic;

  return (
    <div className="py-4">
      <Card className="p-4">
        <h2 className="text-xl font-semibold flex items-start gap-2">
          <LayoutList color="green" />
          New module recommendations
        </h2>
        <p className="text-sm text-gray-600">{filterDescriptions[mode]}</p>

        <div className="flex gap-2">
          {allFilters.map((filterType) => (
            <Button
              key={filterType}
              variant={mode === filterType ? "outline" : "ghost"}
              size="sm"
              className="cursor-pointer text-blue-600"
              onClick={() => setMode(filterType)}
            >
              {filterType === "similar"
                ? "Like other students"
                : filterType === "review"
                ? "Review soon"
                : "By topic"}
            </Button>
          ))}
        </div>

        {loading ? (
          <p>Loading recommendations…</p>
        ) : error ? (
          <p className="text-red-500">Failed to load recommendations.</p>
        ) : data.length === 0 ? (
          <p className="text-sm text-gray-500">No recommendations available.</p>
        ) : (
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Title</TableHead>
                <TableHead>Course ID</TableHead>
                <TableHead>Module ID</TableHead>
                <TableHead></TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {data.map((rec) => (
                <TableRow key={rec.id}>
                  <TableCell className="capitalize">{rec.title}</TableCell>
                  <TableCell>{rec.course_id}</TableCell>
                  <TableCell>{rec.id}</TableCell>
                  <TableCell>
                    <Button
                      size="sm"
                      variant="outline"
                      className="cursor-pointer"
                      onClick={() => navigate(`/courses/${rec.course_id}`)}
                    >
                      <span>View module</span>
                      <span>
                        <BookOpenText />
                      </span>
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </Card>
    </div>
  );
}
