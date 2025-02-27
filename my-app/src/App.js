import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import TestCard from "./pages/TestCard";
import ForumPage from "./pages/ForumPage";

function App() {
    return (
        <Router>
            <div className="p-4 flex gap-4">
                <Link to="/" className="text-blue-500 underline">Home (Cards)</Link>
                <Link to="/forum" className="text-blue-500 underline">Go to Forum</Link>
            </div>

            <Routes>
                <Route path="/" element={<TestCard />} />
                <Route path="/forum" element={<ForumPage />} />
            </Routes>
        </Router>
    );
}

export default App;
