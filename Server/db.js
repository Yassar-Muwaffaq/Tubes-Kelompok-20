import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config();

<<<<<<< HEAD
export const db = mysql.createPool({
=======
export const db = await mysql.createConnection({
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "cat_adoption_system",
<<<<<<< HEAD
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

try {
  const connection = await db.getConnection();
  console.log("✅ Database connected! to the breem");
  connection.release();
} catch (err) {
  console.error("❌ Database connection failed:", err.message);
}

=======
});

console.log("✅ Database connected!");
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
export default db;
