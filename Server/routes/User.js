import express from "express";
import { db } from "../db.js"; // your db pool
import { authenticateToken } from "./AuthRoute.js"; // if using JWT auth

const router = express.Router();

// GET user profile (optional)
router.get("/profile/:id", authenticateToken, async (req, res) => {
  try {
    const userId = req.params.id;
    const [rows] = await db.query(
      `SELECT id, name, username, dob, nik, selter, email, phone FROM users WHERE id = ?`,
      [userId]
    );
    if (!rows.length) return res.status(404).json({ error: "User not found" });
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

// UPDATE profile
router.put("/profile/:id", authenticateToken, async (req, res) => {
  try {
    const userId = req.params.id;
    const { name, username, dob, nik, selter, email, phone } = req.body;

    const [result] = await db.query(
      `UPDATE users 
       SET name = ?, username = ?, dob = ?, nik = ?, selter = ?, email = ?, phone = ?
       WHERE id = ?`,
      [name, username, dob, nik, selter, email, phone, userId]
    );

    if (result.affectedRows === 0) return res.status(404).json({ error: "User not found" });

    // Return updated user
    const [updatedRows] = await db.query(
      `SELECT id, name, username, dob, nik, selter, email, phone FROM users WHERE id = ?`,
      [userId]
    );

    res.json({ success: true, user: updatedRows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;
