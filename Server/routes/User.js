import express from "express";
import db from "../db.js";
import multer from "multer";

const router = express.Router();
const upload = multer({ dest: "uploads/" });

// GET PROFILE
router.get("/profile/:id", async (req, res) => {
  try {
    const [rows] = await db.query(
      `SELECT id, name, date_of_birth, nik, shelter, phone, email, profile_image 
       FROM users WHERE id = ?`,
      [req.params.id]
    );

    if (!rows.length) return res.status(404).json({ error: "User not found" });

    res.json(rows[0]);
  } catch (err) {
    console.error("Get Profile Error:", err);
    res.status(500).json({ error: "Server error" });
  }
});

// UPDATE PROFILE (tanpa multer & authenticateToken dulu)
router.put("/profile/:id", async (req, res) => {
  try {
    const { name, date_of_birth, nik, shelter, phone, email, profile_image } = req.body;
    console.log("Update Profile Data:", req.body);
    const [result] = await db.query(
      `UPDATE users SET 
       name = ?, 
       date_of_birth = ?, 
       nik = ?, 
       shelter = ?, 
       phone = ?, 
       email = ?, 
       profile_image = ?
       WHERE id = ?`,
      [name, date_of_birth, nik, shelter, phone, email, profile_image, req.params.id]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ error: "User not found" });

    const [updatedRows] = await db.query(
      `SELECT id, name, date_of_birth, nik, shelter, phone, email, profile_image 
       FROM users WHERE id = ?`,
      [req.params.id]
    );

    res.json({ success: true, user: updatedRows[0] });

  } catch (err) {
    console.error("Update Profile Error:", err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;
