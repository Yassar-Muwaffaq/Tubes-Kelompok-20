// =========================
// GET ALL NEWS
// =========================
app.get("/news", (req, res) => {
    const sql = `
        SELECT id, title, content AS desc, image, created_at
        FROM news ORDER BY created_at DESC
    `;
    db.query(sql, (err, result) => {
        if (err) return res.status(500).json(err);

        const formatted = result.map(row => ({
            ...row,
            likes: 0,
            comments: [],
            reactions: {}
        }));
        res.json(formatted);
    });
});


// =========================
// GET COMMENTS BY NEWS ID
// =========================
app.get("/news/:id/comments", (req, res) => {
    const sql = `
        SELECT 
            news_comments.*, 
            users.name AS user
        FROM news_comments
        LEFT JOIN users ON users.id = news_comments.user_id
        WHERE news_id = ?
        ORDER BY created_at ASC
    `;
    db.query(sql, [req.params.id], (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result);
    });
});


// =========================
// ADD COMMENT
// =========================
app.post("/news/:id/comments", (req, res) => {
    const { user_id, comment } = req.body;
    console.log("Adding comment:", req.params.id, user_id, comment);

    const sql = `
        INSERT INTO news_comments (news_id, user_id, comment)
        VALUES (?, ?, ?)
    `;
    db.query(sql, [req.params.id, user_id, comment], (err, result) => {
        if (err) return res.status(500).json(err);

        res.json({
            success: true,
            id: result.insertId,
            news_id: req.params.id,
            user_id,
            comment
        });
    });
});


// =========================
// DELETE COMMENT
// =========================
app.delete("/news/comments/:id", (req, res) => {
    const sql = `DELETE FROM news_comments WHERE id = ?`;

    db.query(sql, [req.params.id], (err, result) => {
        if (err) return res.status(500).json(err);

        res.json({ success: true });
    });
});


// =========================
// LIKE / UNLIKE COMMENT
// =========================
// frontend kirim: { user_id, like: true/false }
app.post("/news/comments/:id/like", (req, res) => {
    const { user_id, like } = req.body;

    if (!user_id) return res.status(400).json({ error: "Missing user_id" });

    if (like) {
        // LIKE
        const sql = `
            INSERT IGNORE INTO news_comment_likes (comment_id, user_id)
            VALUES (?, ?)
        `;
        db.query(sql, [req.params.id, user_id], err => {
            if (err) return res.status(500).json(err);
            res.json({ success: true, liked: true });
        });

    } else {
        // UNLIKE
        const sql = `
            DELETE FROM news_comment_likes
            WHERE comment_id = ? AND user_id = ?
        `;
        db.query(sql, [req.params.id, user_id], err => {
            if (err) return res.status(500).json(err);
            res.json({ success: true, liked: false });
        });
    }
});


// =========================
// GET LIKE COUNT PER COMMENT
// =========================
app.get("/news/comments/:id/likes", (req, res) => {
    const sql = `SELECT COUNT(*) AS likes FROM news_comment_likes WHERE comment_id = ?`;

    db.query(sql, [req.params.id], (err, result) => {
        if (err) return res.status(500).json(err);
        res.json(result[0]);
    });
});
