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

    const base = `${req.protocol}://${req.get("host")}`;

    const formatted = rows.map(cat => ({
      ...cat,
      image_url: cat.image
        ? `${base}/uploads/${cat.image}`
        : null
    }));

    res.json(formatted);

  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});


/* ------------------ ADD CAT + UPLOAD PHOTO ------------------ */
router.post("/add-cat", upload.single("image"), async (req, res) => {
  const { name, age, gender, breed, description } = req.body;
  const image = req.file ? req.file.filename : null;

  try {
    await db.query(
      `INSERT INTO cats (name, age, gender, breed, description, image)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [name, age, gender, breed, description, image]
    );

    res.json({ message: "Cat added successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});




/* ------------------ GET ALL REPORTS ------------------ */
router.get("/reports", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM reports ORDER BY created_at DESC");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: "Gagal mengambil data reports", detail: err });
  }
});

/* ------------------ CREATE REPORT + UPLOAD FOTO ------------------ */
router.post("/reports", upload.array("photos", 10), async (req, res) => {
  try {
    const {
      cat_name,
      age,
      gender,
      breeds,
      reporterContact,
      location,
      description,
      user_id
    } = req.body;

    const photoPaths = req.files ? req.files.map(f => f.filename) : [];

    await db.query(
      `INSERT INTO reports 
      (user_id, cat_name, age, gender, breeds, reporterContact, location, description, status, image) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        user_id || null,
        cat_name,
        age,
        gender,
        breeds,
        reporterContact,
        location,
        description,
        "Diterima",
        JSON.stringify(photoPaths)
      ]
    );

    res.json({ message: "Laporan berhasil dikirim!" });

  } catch (err) {
    res.status(500).json({ error: "Gagal mengirim laporan", detail: err });
  }
});

router.get("/users", async (req, res) => {
    try {
        const [rows] = await db.query("SELECT * FROM users");
        res.json({
            success: true,
            data: rows
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            success: false,
            message: "Server error"
        });
    }
});

export default router;
