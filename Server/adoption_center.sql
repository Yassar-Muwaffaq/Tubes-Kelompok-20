-- Hapus database lama kalau ada
DROP DATABASE IF EXISTS cat_adoption_system;
CREATE DATABASE cat_adoption_system;
USE cat_adoption_system;

-- ==============================
-- TABLE: roles
-- ==============================
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO roles (name) VALUES ('admin'), ('user');

-- ==============================
-- TABLE: users
-- ==============================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- ==============================
-- TABLE: categories
-- (Kategori untuk news)
-- ==============================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO categories (name) VALUES 
('Kucing Bagus (Pemenang Pameran)'),
('Kucing Spesial (Obesitas)'),
('Evakuasi Kucing'),
('Umum');

-- ==============================
-- TABLE: news
-- ==============================
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- ==============================
-- TABLE: news_comments
-- ==============================
CREATE TABLE news_comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT NOT NULL,
    user_id INT,
    comment TEXT,
    likes INT DEFAULT 0,
    shares INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- ==============================
-- TABLE: cats
-- ==============================
CREATE TABLE cats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Jantan', 'Betina'),
    breed VARCHAR(100),
    description TEXT,
    image VARCHAR(255),
    status ENUM('Tersedia', 'Diadopsi', 'Proses Evakuasi') DEFAULT 'Tersedia',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- TABLE: adoptions
-- ==============================
CREATE TABLE adoptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cat_id INT NOT NULL,
    adoption_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('Menunggu', 'Disetujui', 'Ditolak', 'Proses Evakuasi') DEFAULT 'Menunggu',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES cats(id) ON DELETE CASCADE
);

-- ==============================
-- TABLE: donations
-- ==============================
CREATE TABLE donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2) NOT NULL,
    message VARCHAR(255),
    anonymous BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- ==============================
-- TABLE: reports (laporan penyelamatan)
-- ==============================
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cat_name VARCHAR(100),
    location VARCHAR(255),
    description TEXT,
    status ENUM('Diterima', 'Diproses', 'Selesai Evakuasi') DEFAULT 'Diterima',
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ==============================
-- TABLE: activity_logs
-- ==============================
CREATE TABLE activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- ==============================
-- DATA AWAL (seed)
-- ==============================
INSERT INTO users (role_id, name, email, password) VALUES
(1, 'Admin Utama', 'admin@catrescue.com', 'admin123'),
(2, 'Yassar', 'yassar@example.com', 'password123');

INSERT INTO cats (name, age, gender, breed, description, image, status) VALUES
('Milo', 2, 'Jantan', 'Anggora', 'Kucing putih lembut dan jinak', '/images/cats/milo.jpg', 'Tersedia'),
('Luna', 3, 'Betina', 'Persia', 'Kucing aktif dan suka bermain', '/images/cats/luna.jpg', 'Tersedia'),
('Oyen', 1, 'Jantan', 'Kampung', 'Sedang dalam proses evakuasi', '/images/cats/oyen.jpg', 'Proses Evakuasi');

INSERT INTO news (category_id, title, content, image) VALUES
(1, 'Pemenang Lomba Kucing Terbaik', 'Kucing bernama Snowy memenangkan lomba kecantikan kucing.', '/images/news/snowy.jpg'),
(2, 'Kucing Gemuk Tapi Bahagia', 'Obesitas bukan penghalang bagi Momo untuk tetap aktif dan lucu.', '/images/news/momo.jpg'),
(3, 'Evakuasi Kucing di Daerah Jakarta Timur', 'Tim penyelamat berhasil mengevakuasi 3 kucing liar dari gedung terbengkalai.', '/images/news/rescue.jpg');
