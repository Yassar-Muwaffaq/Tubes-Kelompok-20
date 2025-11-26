# 🐱 Adopt Center

![Vue.js](https://img.shields.io/badge/vuejs-%2335495e.svg?style=flat&logo=vuedotjs&logoColor=%234FC08D)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=flat&logo=tailwind-css&logoColor=white)

> Platform web berbasis komunitas untuk menghubungkan pecinta kucing, memfasilitasi adopsi, pelaporan kucing hilang/liar, dan donasi untuk kesejahteraan hewan.

## 📖 Tentang Project

**Adopt Center** adalah aplikasi web yang dibangun menggunakan **Vue 3** yang bertujuan untuk memberikan rumah yang aman bagi kucing liar dan terlantar. Platform ini memudahkan calon adopter untuk menemukan teman bulu impian mereka, memungkinkan masyarakat untuk melaporkan penemuan atau kehilangan kucing, serta menyediakan sarana donasi untuk mendukung operasional *shelter*.

## ✨ Fitur Utama

* **🏠 Beranda Interaktif**: Menampilkan *hero section*, slider kucing yang siap diadopsi, berita terbaru, dan informasi penting lainnya.
* **🐈 Pusat Adopsi**:
    * Katalog kucing dengan fitur pencarian dan filter berdasarkan ras dan lokasi.
    * Fitur **Favorit** untuk menyimpan daftar kucing yang diminati.
    * Halaman detail untuk setiap kucing.
    * Formulir pengajuan adopsi yang terintegrasi.
* **📢 Report & Rescue**: Formulir untuk melaporkan kucing hilang atau kucing liar yang membutuhkan pertolongan, lengkap dengan upload foto dan lokasi.
* **❤️ Donasi**: Halaman donasi dengan pilihan nominal cepat dan berbagai metode pembayaran (QRIS, Transfer Bank, E-Wallet).
* **📰 Berita & Komunitas**:
    * Artikel berita seputar dunia kucing.
    * Interaksi pengguna melalui *like*, komentar, dan reaksi emoji.
    * Fitur *share* artikel.
* **👤 Manajemen Pengguna**:
    * Halaman Login/Register (UI).
    * **Profil Pengguna**: Melihat dan mengedit informasi pribadi (disimpan sementara menggunakan `localStorage`).
    * **Dashboard**: Panel admin/user sederhana untuk mengelola data kucing dan pengguna.
* **📱 Responsif**: Tampilan yang optimal di berbagai ukuran perangkat (desktop, tablet, mobile) menggunakan Tailwind CSS.

## 🛠️ Teknologi yang Digunakan

* **Frontend Framework**: [Vue.js 3](https://vuejs.org/) (Composition API & `<script setup>`)
* **Routing**: [Vue Router](https://router.vuejs.org/)
* **Styling**: [Tailwind CSS](https://tailwindcss.com/)
* **UI Components/Libs**:
    * [Swiper.js](https://swiperjs.com/vue) (untuk slider kucing)
* **State Management**: `ref`, `reactive`, dan `localStorage` untuk persistensi data sederhana.

## 🚧 Pengembangan Tahap Selanjutnya (Tubes Fase 2)

Saat ini, *project* Adopt Center berfokus pada pengembangan **Frontend** (antarmuka pengguna). Beberapa fitur masih berjalan menggunakan data statis (*dummy data*) atau penyimpanan lokal sementara (`localStorage`).

Koneksi ke **Database** dan integrasi **Backend** belum diatur dalam tahap ini dan akan diimplementasikan pada pengembangan tahap selanjutnya. Berikut adalah perkiraan bagian-bagian yang membutuhkan integrasi tersebut:

* **Autentikasi User**: Fitur Login dan Register saat ini hanya simulasi UI. Nantinya akan memerlukan *backend* untuk verifikasi keamanan, token sesi, dan manajemen *role* (user vs admin).
* **Data Dinamis Kucing**: Katalog adopsi saat ini menggunakan *array* statis. Kedepannya, data ini (termasuk foto, deskripsi, status adopsi) akan diambil langsung dari *database* agar bisa di-*update* secara *real-time* via Dashboard.
* **Pengajuan Formulir**:
    * **Form Adopsi**: Data pengajuan saat ini hanya muncul di *alert*/*console*. Nantinya perlu disimpan ke *database* untuk diproses oleh admin.
    * **Laporan (Report & Rescue)**: Fitur *upload* foto dan data laporan perlu *backend* untuk menyimpan file gambar ke *storage* server dan data teks ke *database*.
* **Profil Pengguna**: Saat ini menggunakan `localStorage` yang akan hilang jika *browser* dibersihkan. Nantinya data profil akan disimpan permanen di *database* pengguna.
* **Interaksi Komunitas**: Fitur *like*, komentar pada berita, dan favorit kucing saat ini hanya berjalan di sisi *client*. Integrasi *backend* diperlukan agar interaksi ini tersimpan dan bisa dilihat pengguna lain.
* **Sistem Donasi**: Saat ini hanya simulasi tampilan. Tahap selanjutnya mungkin melibatkan integrasi *payment gateway* atau pencatatan transaksi donasi yang sebenarnya di sisi *backend*.

## 📂 Struktur Project

src/
assets/ (File statis CSS utama )
   main.css
components/ (Komponen Vue yang dapat digunakan kembali)
   AboutUs.vue
   AdoptSlider.vue
   ContactUs.vue
   Dashboard.vue
   FAQ.vue
   Login.vue
   Navbar.vue
   NewsPopUp.vue
   NewsSection.vue
   ReportKitten.vue
   TermAndCondition.vue
router/ (Konfigurasi Vue Router)
   index.js
views/ (Halaman utama aplikasi)
   AdoptNowView.vue
   AdoptionView.vue
   DashboardView.vue
   DonateView.vue
   HomeView.vue
   NewsView.vue
   ProfileView.vue
   ReportRescueView.vue
App.vue (Komponen root utama)
main.js (Entry point aplikasi)

untuk assets foto program di simpan di folder public sesuai dengan penggunaannya

## 🚀 Cara Menjalankan Project

Ikuti langkah-langkah berikut untuk menjalankan project ini di komputer lokal Anda.

### Prasyarat
Pastikan Anda telah menginstal **Node.js** (versi LTS direkomendasikan).

### Instalasi

1.  **Clone repository ini**
    ```bash
    git clone [https://github.com/username-anda/adopt-center.git](https://github.com/username-anda/adopt-center.git)
    cd adopt-center
    ```

2.  **Install dependencies**
    ```bash
    npm install
    ```

3.  **Jalankan Development Server**
    ```bash
    npm run dev
    ```

4.  Buka browser dan akses tautan lokal yang muncul di terminal (biasanya `http://localhost:5173`).

## 📸 Tampilan web (Screenshots)
1. HomePage
   <img width="1843" height="828" alt="image" src="https://github.com/user-attachments/assets/97ae0c82-e3da-471c-81d9-4102a4256bcc" />
2. AdoptSlider
   <img width="1845" height="802" alt="image" src="https://github.com/user-attachments/assets/8de70aba-6dac-4871-96d5-fc71d6527f9f" />
3. ReportSection
   <img width="1844" height="874" alt="image" src="https://github.com/user-attachments/assets/85562aa2-e18e-42ba-8aa4-6976802fa3ae" />
4. NewsSection
   <img width="1844" height="760" alt="image" src="https://github.com/user-attachments/assets/61780935-bf32-4fae-b744-1c0005dabd6e" />
5. FAQ
   <img width="1817" height="635" alt="image" src="https://github.com/user-attachments/assets/5b51c3e7-36f9-4e9b-9bc1-b3a5a2b3f60f" />
6. About Us
   <img width="1903" height="871" alt="image" src="https://github.com/user-attachments/assets/42f6783e-e95d-454e-9521-dad4a5614306" />
7. Footer / Contact Us
   <img width="1903" height="326" alt="image" src="https://github.com/user-attachments/assets/0a82b989-01ee-4e8d-b6ec-d7bb01bcf242" />
8. 

---
Dibuat dengan ❤️ oleh Tim Adopt Center
