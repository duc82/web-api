import sql from "mssql";

const dbUrl = process.env.DATABASE_URL;

if (!dbUrl) {
  throw new Error("No database URL provided");
}

const connectDB = async () => {
  try {
    const pool = await sql.connect(dbUrl);
    console.log("Database connected");
    return pool;
  } catch (error) {
    throw error;
  }
};

export { sql, connectDB };
