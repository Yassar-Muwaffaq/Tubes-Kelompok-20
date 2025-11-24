import express from "express";
import { db } from "../db.js";
import multer from "multer";

const router = express.Router();

/* ------------------ MULTER UPLOAD CONFIG (WAJIB DI ATAS) ------------------ */
const storage = multer.diskStorage({
  destination: "uploads/",
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  }
});

const upload = multer({ storage });

/* ------------------ GET SEMUA KUCING ------------------ */
router.get("/cats", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM cats");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

/* ------------------ ADD CAT ------------------ */
router.post("/add-cat", async (req, res) => {
  const { name, age, breed } = req.body;
  try {
    await db.query(
      "INSERT INTO cats (name, age, breed) VALUES (?, ?, ?)", 
      [name, age, breed]
    );
    res.json({ message: "Cat added successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});


/* ------------------ CREATE REPORT + UPLOAD FOTO ------------------ */
router.get("/reports", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM reports ORDER BY created_at DESC");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: "Gagal mengambil data reports", detail: err });
  }
});

router.post("/reports", upload.array("photos", 10), async (req, res) => {
  try {
    const { name, age, gender, breeds, reporterContact, lastLocation, description } = req.body;

    const photoPaths = req.files ? req.files.map(f => f.filename) : [];

    await db.query(
      `INSERT INTO reports 
      (name, age, gender, breeds, reporterContact, lastLocation, description, photos)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        name,
        age,
        gender,
        breeds,
        reporterContact,
        lastLocation,
        description,
        JSON.stringify(photoPaths)
      ]
    );

    res.json({ message: "Laporan berhasil dikirim" });

  } catch (err) {
    res.status(500).json({ error: "Gagal mengirim laporan", detail: err });
  }
});

export default router;
