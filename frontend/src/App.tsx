import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { ActorProvider } from "./context/actor-context";
import Layout from "./components/app-sidebar/layout";
//Routes
import Dashboard from "./components/dashboard";
import Explorer from "./components/explorer";
import CourseDetailsOverview from "./components/courses/course-details-overview";
import ModuleDetailsOverview from "./components/modules/module-details-overview";
import AllCourses from "./components/courses/all-courses";
import AllModules from "./components/modules/all-modules";

export default function App() {
  return (
    <ActorProvider>
      <Layout>
        <Router>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/courses" element={<AllCourses />} />
            <Route path="/courses/:id" element={<CourseDetailsOverview />} />
            <Route path="/modules" element={<AllModules />} />
            <Route path="/modules/:id" element={<ModuleDetailsOverview />} />
            <Route path="/explorer" element={<Explorer />} />
          </Routes>
        </Router>
      </Layout>
    </ActorProvider>
  );
}
