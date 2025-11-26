import express from "express";
import db from "../db.js";
import jwt from "jsonwebtoken";

const router = express.Router();

// =======================
// AUTH MIDDLEWARE
// =======================
export const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  if (!authHeader) return res.status(401).json({ error: "Token tidak ada" });

  const token = authHeader.split(" ")[1];
  if (!token) return res.status(401).json({ error: "Token tidak ada" });

  jwt.verify(token, process.env.JWT_SECRET || "secret_key", (err, user) => {
    if (err) return res.status(403).json({ error: "Token tidak valid" });
    req.user = user;
    next();
  });
};

// =======================
// SIGNUP
// =======================
router.post("/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const [existing] = await db.query(
      "SELECT * FROM users WHERE email = ?",
      [email]
    );
    if (existing.length > 0)
      return res.status(400).json({ error: "Email sudah terdaftar" });

    // Karena tidak pakai bcrypt:
    await db.query(
      `INSERT INTO users (name, email, password, role_id)
       VALUES (?, ?, ?, 2)`,
      [name, email, password]
    );

    res.json({ success: true, message: "Registrasi berhasil" });
  } catch (err) {
    console.error("Signup Error:", err);
    res.status(500).json({ error: "Server error" });
  }
});

// =======================
// LOGIN
// =======================
router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password)
      return res.status(400).json({ error: "Email dan password wajib" });

    const [rows] = await db.query("SELECT * FROM users WHERE email = ?", [
      email,
    ]);

    if (rows.length === 0)
      return res.status(400).json({ error: "Email tidak ditemukan" });

    const user = rows[0];

    // Tidak pakai bcrypt → langsung compare
    if (user.password !== password)
      return res.status(400).json({ error: "Password salah" });

    const token = jwt.sign(
      { id: user.id, email: user.email, role: user.role_id },
      process.env.JWT_SECRET || "secret_key",
      { expiresIn: "1d" }
    );

    // Kirim semua data yang diperlukan frontend
    res.json({
      message: "Login berhasil",
      token,
      user: {
        id: user.id,
        name: user.name,
        username: user.username,
        date_of_birth: user.date_of_birth,
        nik: user.nik,
        shelter: user.shelter,
        phone: user.phone,
        email: user.email,
        profile_image: user.profile_image,
        role_id: user.role_id,
      },
    });
  } catch (err) {
    console.error("Login Error:", err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;
