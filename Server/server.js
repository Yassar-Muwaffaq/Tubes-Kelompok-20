import express from "express";
import cors from "cors";
import route from "./routes/route.js";
import path from "path";
import dotenv from "dotenv";
import { fileURLToPath } from "url";

dotenv.config();
const app = express();

app.use(cors());

// Untuk menerima JSON biasa
app.use(express.json());

// Untuk menerima form-data + foto, kita tambahkan folder upload
app.use("/uploads", express.static("uploads"));

// Daftar route utama
app.use("/api", route);

app.listen(5000, () => {
  console.log("Server running on http://localhost:5000");
});