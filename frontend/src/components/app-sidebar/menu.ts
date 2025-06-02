import { MenuItems } from "@/types/menu";
import { Home, BookCopy, BookUser, LandPlot, Telescope } from "lucide-react";

export const menuItems: MenuItems[] = [
  {
    id: 'dashboard',
    title: "Dashboard",
    url: "/",
    icon: Home,
  },
  {
    id: 'courses',
    title: 'Courses',
    url: '/courses',
    icon: BookCopy,
  },
  {
    id: 'modules',
    title: 'Modules',
    url: '/modules',
    icon: BookUser,
  },
  {
    id: 'metrics',
    title: 'Metrics',
    url: '/metrics',
    icon: LandPlot,
  },
  {
    id: 'explorer',
    title: 'Explorer',
    url: '/explorer',
    icon: Telescope,
  }
];