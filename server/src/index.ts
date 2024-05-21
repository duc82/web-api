import express from "express";
import cors from "cors";
import "dotenv/config";
import { connectDB, sql } from "./configs/db.config";

const app = express();

let pool: sql.ConnectionPool;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
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
    const { search } = req.query;

    const result = await sql.query`EXECUTE GetAllNhanVien`;

    if (result.recordset.length < 1) {
      return res.json([]);
    }

    const firstRecordset: Record<string, string> = result.recordset[0];

    const json = Object.values(firstRecordset)[0];

    res.json(JSON.parse(json));
  } catch (error) {
    res.status(500).json({
      message: error instanceof Error ? error.message : "Something went wrong!"
    });
  }
});

app.post("/api/employees", async (req, res) => {
  try {
    const body = req.body;

    const command =
      "INSERT INTO tNhanVien(TenNV, GioiTinh, Luong, MaPB) VALUES(@TenNV, @GioiTinh, @Luong, @MaPB)";

    await pool
      .request()
      .input("TenNV", sql.VarChar, body.TenNV)
      .input("GioiTinh", sql.Bit, body.GioiTinh)
      .input("Luong", sql.Int, body.Luong)
      .input("MaPB", sql.Int, body.MaPB)
      .query(command);

    res.status(201).json({
      message: "Add successfully employee"
    });
  } catch (error) {
    res.status(500).json({
      message: error instanceof Error ? error.message : "Something went wrong!"
    });
  }
});

app.get("/api/departments", async (req, res) => {
  try {
    const maPB = req.query.maPB;
    const maPBInt: number = maPB ? +maPB : -1;

    const command = maPB
      ? "SELECT * FROM tPhongBan WHERE MPB = @maPB"
      : "SELECT * FROM tPhongBan";

    const result = await pool
      .request()
      .input("maPB", sql.Int, maPBInt)
      .query(command);

    if (result.recordset.length === 1) {
      return res.json(result.recordset[0]);
    }

    res.json(result.recordset);
  } catch (error) {
    res.status(500).json({
      message: error instanceof Error ? error.message : "Something went wrong!"
    });
  }
});

const startServer = async () => {
  pool = await connectDB();
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
};
startServer();
