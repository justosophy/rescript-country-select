import { createRoot } from "react-dom/client";
import { make as App } from './components/App'

const container = document.getElementById("app");
const root = createRoot(container)
root.render(<App />);