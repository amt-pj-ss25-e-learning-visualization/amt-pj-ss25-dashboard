import { MenuItems } from "@/types/menu";
import { Home, BookCopy, Telescope, Newspaper } from "lucide-react";

export const menuItems: MenuItems[] = [
  {
    id: "dashboard",
    title: "Dashboard",
    url: "/",
    icon: Home,
  },
  {
    id: "courses",
    title: "Courses",
    url: "/courses",
    icon: BookCopy,
  },
  {
    id: "explorer",
    title: "Explorer",
    url: "/explorer",
    icon: Telescope,
  }
];
