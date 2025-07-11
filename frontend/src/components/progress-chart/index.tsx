import { useState } from "react";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip as RechartsTooltip,
  ResponsiveContainer,
} from "recharts";
import { Button } from "@/components/ui/button";
import { Separator } from "@/components/ui/separator";
import { Progress } from "@/components/ui/progress";
import { CourseDetailsDto } from "@/types/dto";
import { Info } from "lucide-react";
import {
  Tooltip,
  TooltipTrigger,
  TooltipContent,
} from "@/components/ui/tooltip";
import {
  getClassAverages,
  getStudentMetrics,
  progresDescriptions,
  progressColors,
} from "@/utils/progress";
import CustomTooltip from "../custom-tooltip";

export const ProgressChart = ({
  course,
  actorId,
  data,
}: {
  course: CourseDetailsDto;
  actorId: string | undefined;
  data: any;
}) => {
  const [expanded, setExpanded] = useState<boolean>(false);

  if (!actorId) return null;

  const studentData: any = getStudentMetrics(data, actorId);
  const classAverages: any = getClassAverages(data);

  return (
    <>
      <div className="flex justify-between items-center">
        <h3 className="text-lg font-semibold text-blue-700">
          Overall learning progress for {course.title} course
        </h3>
        <Button
          variant="outline"
          size="sm"
          className="cursor-pointer"
          onClick={() => setExpanded((prev: boolean) => !prev)}
        >
          {expanded ? "Collapse" : "Expand stats"}
        </Button>
      </div>

      <ResponsiveContainer width="100%" height={60}>
        <BarChart layout="vertical" data={[studentData]}>
          <XAxis type="number" hide domain={[0, 100]} />
          <YAxis type="category" dataKey="name" hide />

          <RechartsTooltip content={CustomTooltip} cursor={true} />

          <Bar
            dataKey="performance"
            stackId="a"
            fill={progressColors.performance}
            radius={[8, 0, 0, 8]}
          />
          <Bar
            dataKey="masteryRaw"
            stackId="a"
            fill={progressColors.masteryRaw}
          />
          <Bar
            dataKey="completion"
            stackId="a"
            fill={progressColors.completion}
            radius={[0, 8, 8, 0]}
          />
        </BarChart>
      </ResponsiveContainer>

      {expanded && (
        <>
          <Separator />
          <div className="space-y-6">
            {Object.keys(studentData).map((learningKey) => {
              const value = studentData[learningKey];
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
                          {progresDescriptions[learningKey]}
                        </TooltipContent>
                      </Tooltip>
                    </div>
                    <span className="text-muted-foreground">{value}%</span>
                  </div>

                  <div className="mb-2">
                    <Progress
                      value={value}
                      className="h-2"
                      progressColor={progressColors[learningKey]}
                    />
                    <span className="text-xs text-muted-foreground ml-1">
                      You
                    </span>
                  </div>

                  <div className="relative mb-2">
                    <Progress
                      value={classAvg}
                      className="h-2 opacity-60"
                      progressColor={progressColors[learningKey]}
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
    </>
  );
};
