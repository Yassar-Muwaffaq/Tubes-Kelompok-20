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

export default router;
