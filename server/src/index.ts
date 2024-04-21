import express from "express";
import cors from "cors";
import "dotenv/config";
import { connectDB, sql } from "./configs/db.config";

const app = express();

const allowedOrigins = ["http://localhost:3000"];

app.use(
  cors({
    origin: allowedOrigins,
    credentials: true
  })
);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/employees", async (req, res) => {
  try {
    const result = await sql.query`SELECT * FROM tNhanVien`;
    res.json(result.recordset);
  } catch (error) {
    res.status(500).json({ error: (error as Error).message });
  }
});

const startServer = async () => {
  await connectDB();
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
};
startServer();
