import { LucideProps } from "lucide-react";

export interface MenuItems {
  id: string;
  title: string;
  url: string;
  icon: React.ForwardRefExoticComponent<Omit<LucideProps, "ref"> & React.RefAttributes<SVGSVGElement>>;
  roles?: string[]
}