const CustomTooltip: React.FC<any> = ({
  active,
  payload,
  label,
  coordinate,
}) => {
  if (!active || !payload) return null;

  return (
    <div
      style={{ left: coordinate?.x, top: coordinate?.y }}
      className="absolute bg-white border-gray-200 rounded-md shadow-md p-4"
    >
      <div className="font-medium mb-1">{label}</div>
      {payload.map((entry: any) => (
        <div
          key={entry.dataKey}
          className="flex items-center gap-2 text-md capitalize"
        >
          <span
            className="w-4 h-4 rounded-md inline-block"
            style={{ backgroundColor: entry.fill || entry.color }}
          />
          <span className="flex-1">{entry.dataKey}</span>
          <span className="font-semibold">{entry.value}%</span>
        </div>
      ))}
    </div>
  );
};

export default CustomTooltip;
