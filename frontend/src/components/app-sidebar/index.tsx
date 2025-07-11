import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar";
import { menuItems } from "./menu";
import ActorSwitcher from "../actor-switcher";
import { MenuItems } from "@/types/menu";
import { useActor } from "@/context/actor-context";

const isActive = (item: MenuItems) => {
  return item.url.replace("/", "") === window.location.pathname.split("/")[1];
};

export function AppSidebar() {
  const { currentActor } = useActor();
  const role = currentActor?.role;

  const filteredMenu = menuItems.filter((item) => {
    if (!item.roles || item.roles.length === 0) return true;
    return role != null && item.roles.includes(role);
  });

  return (
    <Sidebar>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Advanced Media Technologies</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {filteredMenu.map((item) => (
                <SidebarMenuItem
                  key={item.title}
                  aria-selected={isActive(item)}
                >
                  <SidebarMenuButton
                    asChild
                    className={
                      isActive(item) ? "text-blue-600 hover:text-blue-600" : ""
                    }
                  >
                    <a href={item.url}>
                      <item.icon />
                      <span>{item.title}</span>
                    </a>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <ActorSwitcher />
      </SidebarFooter>
    </Sidebar>
  );
}
