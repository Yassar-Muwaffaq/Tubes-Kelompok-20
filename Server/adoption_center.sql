<<<<<<< HEAD
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 01:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `f_adoption`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adoptions`
--

CREATE TABLE `adoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `adoption_date` DATE,
  `status` enum('Menunggu','Disetujui','Ditolak','Proses Evakuasi') DEFAULT 'Menunggu',
  PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Kucing Bagus (Pemenang Pameran)'),
(2, 'Kucing Spesial (Obesitas)'),
(3, 'Evakuasi Kucing'),
(4, 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Jantan','Betina') DEFAULT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('Tersedia','Diadopsi','Proses Evakuasi') DEFAULT 'Tersedia',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `name`, `age`, `gender`, `breed`, `description`, `image`, `status`, `created_at`) VALUES
(1, 'Milo', 2, 'Jantan', 'Anggora', 'Kucing putih lembut dan jinak', '/images/cats/milo.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(2, 'Luna', 3, 'Betina', 'Persia', 'Kucing aktif dan suka bermain', '/images/cats/luna.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(3, 'Oyen', 1, 'Jantan', 'Kampung', 'Sedang dalam proses evakuasi', '/images/cats/oyen.jpg', 'Proses Evakuasi', '2025-11-23 02:30:39'),

(4, 'Snowy', 4, 'Betina', 'British Shorthair', 'Tenang, manis, dan sangat penyayang', '/images/cats/snowy.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(5, 'Tom', 2, 'Jantan', 'American Shorthair', 'Lucu, lincah, dan sangat suka bermain bola', '/images/cats/tom.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(6, 'Bella', 3, 'Betina', 'Maine Coon', 'Berpostur besar namun lembut dan ramah', '/images/cats/bella.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(7, 'Choki', 1, 'Jantan', 'Kampung', 'Ditemukan terlantar dan masih pemalu', '/images/cats/choki.jpg', 'Menunggu', '2025-11-23 02:30:39'),
(8, 'Nala', 2, 'Betina', 'Ragdoll', 'Sangat manja dan suka digendong', '/images/cats/nala.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(9, 'Simba', 3, 'Jantan', 'Siam', 'Vokal, aktif, dan penuh rasa ingin tahu', '/images/cats/simba.jpg', 'Tersedia', '2025-11-23 02:30:39'),
(10, 'Mimi', 4, 'Betina', 'Persia', 'Kucing senior yang sangat jinak dan kalem', '/images/cats/mimi.jpg', 'Tersedia', '2025-11-23 02:30:39');
-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `category_id`, `title`, `content`, `image`, `created_at`) VALUES
(1, 1, 'Pemenang Lomba Kucing Terbaik', 'Kucing bernama Snowy memenangkan lomba kecantikan kucing.', '/images/news/kucing1.jpg', '2025-11-23 02:30:39'),
(2, 2, 'Kucing Gemuk Tapi Bahagia', 'Obesitas bukan penghalang bagi Momo untuk tetap aktif dan lucu.', '/images/news/Miaww.jpg', '2025-11-23 02:30:39'),
(3, 3, 'Evakuasi Kucing di Daerah Jakarta Timur', 'Tim penyelamat berhasil mengevakuasi 3 kucing liar dari gedung terbengkalai.', '/images/news/kucing2.jpg', '2025-11-23 02:30:39');

(4, 1, 'Kucing Rescue Ditemukan Sehat', 'Seekor kucing liar yang diselamatkan minggu lalu kini sudah pulih sepenuhnya.', '/images/news/kucing3.jpg', '2025-11-23 02:30:39'),
(5, 2, 'Tips Merawat Kucing di Musim Hujan', 'Musim hujan membuat kucing rentan sakit, berikut tips merawatnya.', '/images/news/kucing4.jpg', '2025-11-23 02:30:39');
-- --------------------------------------------------------

--
-- Table structure for table `news_comments`
--

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `likes` int(11) DEFAULT 0,
  `shares` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `breeds` varchar(100) DEFAULT NULL,
  `reporterContact` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Diterima','Diproses','Selesai Evakuasi') DEFAULT 'Diterima',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `reports` 
(`id`, `user_id`, `cat_name`, `age`, `gender`, `breeds`, `reporterContact`, `location`, `description`, `status`, `image`, `created_at`) VALUES
(1, 2, 'Snowy', '4', 'Betina', 'British Shorthair', '08924782341', 'Jakarta Selatan', 'Snowy terlihat berjalan pincang di area taman kompleks.', 'Diterima', '/images/cats/snowy.jpg', '2025-11-23 02:30:39'),
(2, 3, 'Tom', '2', 'Jantan', 'American Shorthair', '082147891233', 'Jakarta Timur', 'Tom terlihat terjebak di selokan yang cukup dalam.', 'Diproses', '/images/cats/tom.jpg', '2025-11-23 02:30:39'),
(3, 5, 'Bella', '3', 'Betina', 'Maine Coon', '087812345678', 'Jakarta Barat', 'Bella ditemukan dalam kondisi basah kuyup setelah hujan deras.', 'Diterima', '/images/cats/bella.jpg', '2025-11-23 02:30:39'),
(4, 2, 'Choki', '1', 'Jantan', 'Kampung', '08924782341', 'Depok', 'Choki terlihat kelaparan dan takut mendekati manusia.', 'Diproses', '/images/cats/choki.jpg', '2025-11-23 02:30:39'),
(5, 3, 'Nala', '2', 'Betina', 'Ragdoll', '082147891233', 'Bekasi', 'Nala ditemukan berada di bawah mobil dan tidak mau keluar.', 'Selesai Evakuasi', '/images/cats/nala.jpg', '2025-11-23 02:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `shelter` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `date_of_birth`, `nik`, `shelter`, `phone`, `email`, `password`, `profile_image`, `created_at`) VALUES
(1, 1, 'Admin Utama', NULL, NULL, NULL, NULL, 'admin@catrescue.com', 'admin123', NULL, '2025-11-23 02:30:39'),
(2, 2, 'Yassar', '2006-03-13', '321478198513', '', '08924782341', 'yassar@example.com', 'password123', NULL, '2025-11-23 02:30:39');

(3, 2, 'Firda', '2005-09-21', '321478998712', '', '082147891233', 'firda@ridzki.com', 'user123', NULL, '2025-11-23 02:30:39'),
(4, 3, 'Shelter Meow Care', NULL, NULL, 'Meow Care Jakarta', '081245667821', 'meowcare@shelter.com', 'shelter123', NULL, '2025-11-23 02:30:39'),
(5, 2, 'Ervina', '2004-12-10', '321478221991', '', '087812345678', 'erviw@example.com', 'password321', NULL, '2025-11-23 02:30:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_comments`
--
ALTER TABLE `news_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adoptions_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `cats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD CONSTRAINT `news_comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
=======
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
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
