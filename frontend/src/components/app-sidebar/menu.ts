import { MenuItems } from "@/types/menu";
import { Home, BookCopy, Telescope, LibraryBig } from "lucide-react";

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
    icon: LibraryBig,
    roles: ["student", "instructor"],
  },
  {
    id: "modules",
    title: "Modules",
    url: "/modules",
    icon: BookCopy,
    roles: ["instructor"],
  },
  {
    id: "explorer",
    title: "Explorer",
    url: "/explorer",
    icon: Telescope,
  },
];
