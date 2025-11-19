import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import route from "./routes/route.js";

// Import database (opsional di sini jika hanya digunakan di route, 
// tapi bagus untuk memastikan db terinisialisasi)
import db from "./db.js"; 

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

// Daftarkan route
// Semua route di route.js akan diawali dengan /api
// Contoh: /api/pets
app.use("/api", route);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));