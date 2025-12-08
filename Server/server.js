import express from "express";
import cors from "cors";
<<<<<<< HEAD
import route from "./routes/route.js";
import path from "path";
import dotenv from "dotenv";
import { fileURLToPath } from "url";
import AuthRoute from "./routes/AuthRoute.js"
import newsRoute from "./routes/newsRoute.js"
import UserRoute from "./routes/User.js"
import AdoptionRoute from "./routes/adoptionRoute.js"

// Import database (opsional di sini jika hanya digunakan di route, 
// tapi bagus untuk memastikan db terinisialisasi)
import db from "./db.js";
=======
import dotenv from "dotenv";
import route from "./routes/route.js";
import { db } from "./db.js";
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332

dotenv.config();
const app = express();

app.use(cors());
<<<<<<< HEAD

// Untuk menerima JSON biasa
app.use(express.json());

app.use("/api/auth", AuthRoute)

// Daftar routes
app.use("/api", route);
app.use("/api", newsRoute);
app.use("/api", UserRoute);
app.use("/api", AdoptionRoute);

// Untuk menerima form-data + foto, kita tambahkan folder upload
app.use("/uploads", express.static("uploads"));
const IMAGE_PATH = path.join(process.cwd(), "images");
app.use("/images", express.static(IMAGE_PATH));
=======
app.use(express.json());

// Daftarin semua route utama
app.use("/api", route);
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
