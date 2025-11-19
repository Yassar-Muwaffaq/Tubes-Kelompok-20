import express from "express";
import { db } from "../db.js";

const router = express.Router();

// GET semua kucing
router.get("/cats", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM cats");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// POST tambah kucing baru
router.post("/add-cat", async (req, res) => {
  const { name, age, breed } = req.body;
  try {
    await db.query("INSERT INTO cats (name, age, breed) VALUES (?, ?, ?)", [name, age, breed]);
    res.json({ message: "Cat added successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// --- ROUTE NEWS (SESUAI TABEL KAMU) ---
router.get('/news', async (req, res) => {
    try {
        // Ambil data dari tabel 'news'
        const [rows] = await db.query('SELECT * FROM news ORDER BY created_at DESC');
        
        // Format data agar cocok dengan Frontend
        const formattedNews = rows.map(item => ({
            id: item.id,
            title: item.title,
            // 👇 Mapping kolom 'content' dari DB ke 'desc' untuk Vue
            desc: item.content, 
            image: item.image || '/images/home/Cat 9.jpg',
            likes: 0, // Default 0 karena tidak ada kolom likes di DB
            comments: [],
            reactions: {}
        }));

        res.json(formattedNews);
    } catch (error) {
        console.error('Error fetching news:', error);
        res.status(500).json({ message: 'Gagal mengambil berita.' });
    }
});

export default router;
