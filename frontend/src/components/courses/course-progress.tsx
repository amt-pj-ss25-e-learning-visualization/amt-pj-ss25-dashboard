import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip as RechartsTooltip,
  ResponsiveContainer,
} from "recharts";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { Progress } from "@/components/ui/progress";
import { CourseDetailsDto } from "@/types/dto";
import { Info } from "lucide-react";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";

const data: any = [
  {
    performance: 40,
    mastery: 30,
    completion: 10,
  },
];

const classAverages: any = {
  performance: 50,
  mastery: 45,
  completion: 60,
};

const colors: Record<string, string> = {
  performance: "#60A5FA",
  mastery: "#6366F1",
  completion: "#9CA3AF",
};

const descriptions: Record<string, string> = {
  performance:
    "Performance measures your engagement and consistency in the course.",
  mastery: "Mastery reflects how well you understand the course material.",
  completion: "Completion shows how much of the course you've finished.",
};

export function CourseProgress({ course }: { course: CourseDetailsDto }) {
  const [expanded, setExpanded] = useState(false);

  return (
    <TooltipProvider>
      <Card className="p-4 space-y-4">
        <div className="flex justify-between items-center">
          <h3 className="text-lg font-semibold text-blue-700">
            Overall learning progress for {course.title} course
          </h3>
          <Button
            variant="outline"
            size="sm"
            className="cursor-pointer"
            onClick={() => setExpanded((prev) => !prev)}
          >
            {expanded ? "Collapse" : "Expand stats"}
          </Button>
        </div>

        <ResponsiveContainer width="100%" height={60}>
          <BarChart layout="vertical" data={data}>
            <XAxis type="number" hide domain={[0, 100]} />
            <YAxis type="category" dataKey="name" hide />
            <RechartsTooltip />
            <Bar
              dataKey="performance"
              stackId="a"
              fill={colors.performance}
              radius={[8, 0, 0, 8]}
            />
            <Bar dataKey="mastery" stackId="a" fill={colors.mastery} />
            <Bar
              dataKey="completion"
              stackId="a"
              fill={colors.completion}
              radius={[0, 8, 8, 0]}
            />
          </BarChart>
        </ResponsiveContainer>

        {expanded && (
          <>
            <Separator />
            <div className="space-y-6">
              {Object.keys(data[0]).map((learningKey) => {
                const value = data[0][learningKey];
                const classAvg = classAverages[learningKey];

                return (
                  <div key={learningKey}>
                    <div className="flex justify-between items-center text-sm font-medium mb-1">
                      <div className="flex items-center gap-1 capitalize">
                        {learningKey}
                        <Tooltip>
                          <TooltipTrigger asChild>
                            <Info className="w-3 h-3 text-muted-foreground cursor-pointer" />
                          </TooltipTrigger>
                          <TooltipContent side="top" className="text-xs">
                            {descriptions[learningKey]}
                          </TooltipContent>
                        </Tooltip>
                      </div>
                      <span className="text-muted-foreground">{value}%</span>
                    </div>

                    <div className="mb-2">
                      <Progress
                        value={value}
                        className="h-2"
                        progressColor={colors[learningKey]}
                      />
                      <span className="text-xs text-muted-foreground ml-1">
                        You
                      </span>
                    </div>

                    <div className="relative mb-2">
                      <Progress
                        value={classAvg}
                        className="h-2 opacity-60"
                        progressColor={colors[learningKey]}
                      />
                      <div className="absolute top-005 right-0 text-[10px] text-muted-foreground">
                        {classAvg}%
                      </div>
                      <span className="text-xs text-muted-foreground ml-1">
                        Class Average
                      </span>
                    </div>
                  </div>
                );
              })}
            </div>
          </>
        )}
      </Card>
    </TooltipProvider>
  );
}
