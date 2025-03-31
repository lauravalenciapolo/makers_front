import { useState, useEffect } from "react";

function App() {
  const [data, setData] = useState<string | null>(null);

  useEffect(() => {
    fetch("https://cloudflare-worker-makers.lauravalenciapolo.workers.dev") // URL de tu Worker
      .then((res) => res.json())
      .then((data: { message: string }) => setData(data.message))
      .catch((error) => console.error("Error fetching data:", error));
  }, []);

  return (
    <div>
      <h1>React + Cloudflare Workers</h1>
      <p>{data || "Cargando..."}</p>
    </div>
  );
}

export default App;
