import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { ActorProvider } from "./context/actor-context";
import Layout from "./components/app-sidebar/layout";
//Routes
import Dashboard from "./components/dashboard";
import CourseDetailsView from "./components/courses/course-view";
import CourseList from "./components/courses/course-list";
import ModuleListView from "./components/modules/module-list-view";
import ModuleDetailsView from "./components/modules/module-details-view";
import MetricsView from "./components/metrics/metrics-view";
import ExplorerView from "./components/explorer/explorer-view";

export default function App() {
  return (
    <ActorProvider>
      <Layout>
        <Router>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/courses" element={<CourseList />} />
            <Route path="/courses/:id" element={<CourseDetailsView />} />
            <Route path="/modules" element={<ModuleListView />} />
            <Route path="/modules/:id" element={<ModuleDetailsView />} />
            <Route path="/metrics" element={<MetricsView />} />
            <Route path="/explorer" element={<ExplorerView />} />
          </Routes>
        </Router>
      </Layout>
    </ActorProvider>
  );
}
