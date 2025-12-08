import express from "express";
import db from "../db.js";

const router = express.Router();

// Get single cat by ID
router.get("/adoption/:id", async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT id, name, age, breed, description, image FROM cats WHERE id = ?",
      [req.params.id]
    );
    console.log(rows)

    if (!rows.length) return res.status(404).json({ error: "Cat not found" });

    res.json(rows[0]);
  } catch (err) {
    console.error("Get Cat Error:", err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;
