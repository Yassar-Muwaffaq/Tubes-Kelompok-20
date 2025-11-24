import express from "express"
import db from "../db.js"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"

const router = express.Router()

// SIGNUP
router.post("/signup", async (req, res) => {
    const { name, email, password } = req.body

    const hashed = await bcrypt.hash(password, 10)

    const sql = `
        INSERT INTO users (name, email, password)
        VALUES (?, ?, ?)
    `
    db.query(sql, [name, email, hashed], (err, result) => {
        if (err) return res.status(500).json(err)
        res.json({ success: true })
    })
})

// LOGIN
router.post("/login", async (req, res) => {
  try {
    console.log("📥 Incoming login:", req.body);

    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ error: "Email dan password wajib diisi" });
    }

    // CARI USER BERDASARKAN EMAIL
    const [rows] = await db.execute(
      "SELECT * FROM users WHERE email = ?",
      [email]
    );

    console.log("🔍 Query result:", rows);

    if (rows.length === 0) {
      return res.status(400).json({ error: "Email tidak ditemukan" });
    }

    const user = rows[0];

    // CEK PASSWORD
    // ❗ kalau kamu belum hash password pakai bcrypt, pakai cek biasa dulu
    if (password !== user.password) {
      return res.status(400).json({ error: "Password salah" });
    }

    // GENERATE TOKEN
    const token = jwt.sign(
      { id: user.id, email: user.email, role: user.role_id },
      process.env.JWT_SECRET || "secret_key",
      { expiresIn: "1d" }
    );

    res.json({
      message: "Login berhasil",
      token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        role_id: user.role_id,
        profile_image: user.profile_image,
        created_at: user.created_at
      }
    });

  } catch (err) {
    console.error("🔥 SERVER ERROR:", err);
    res.status(500).json({ error: "Server error", detail: err.message });
  }
});


router.put("/profile/update", async (req, res) => {
  try {
    const { id, name, email, phone } = req.body;

    const sql = `
      UPDATE users 
      SET name = ?, email = ?, phone = ?
      WHERE id = ?
    `;

    await db.query(sql, [name, email, phone, id]);

    res.json({ success: true, message: "Profile updated!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});


export default router
