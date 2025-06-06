import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/app-sidebar";

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <SidebarProvider>
      <AppSidebar />
      <main className="flex-1 relative">
        <SidebarTrigger className="sticky top-0" />
        {children}
      </main>
    </SidebarProvider>
  );
}
