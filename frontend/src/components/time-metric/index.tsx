import { Clock } from "lucide-react";

const TimeMetric = ({
  timeSpent,
  lastVisit,
  visits,
}: {
  timeSpent?: string;
  lastVisit?: string;
  visits?: number;
}) => {
  if (!timeSpent) return null;

  return (
    <div className="ml-4 px-4 flex items-center gap-2">
      <Clock height={20} width={20} />
      <div>
        <div>
          You have spent <b>{timeSpent}</b> on this module and visited it{" "}
          <b>{visits}</b> times!
        </div>
        <div>
          Your last visit was <b>{lastVisit}</b> ago.
        </div>
      </div>
    </div>
  );
};

export default TimeMetric;
