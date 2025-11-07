<template>
  <div class="adopt-slider">
    <Swiper
      :modules="[Navigation, Pagination]"
      :slides-per-view="3"
      :centered-slides="true"
      :loop="true"
      navigation
      pagination
      class="mySwiper"
    >
      <SwiperSlide
        v-for="(kitten, index) in kittens"
        :key="index"
        class="kitten-slide"
      >
        <div class="kitten-card">
          <img :src="kitten.image" :alt="kitten.name" />
          <div class="kitten-info">
            <p class="age">{{ kitten.age }}</p>
            <h3 class="name">{{ kitten.name }}</h3>
          </div>
        </div>
      </SwiperSlide>
    </Swiper>

    <h2 class="title">ADOPT UR KITTEN HERE</h2>
    
    <button class="cat-button" @click="goToReport">
      <img src="/images/header/cat-button.png" alt="Report Kitten" />
    </button>
  </div>
</template>

<script setup>
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

// 2. DITAMBAHKAN: Import router dan inisialisasi
import { useRouter } from 'vue-router';
const router = useRouter();

const kittens = [
  { name: 'Miawi', age: '2 Tahun', image: '/images/miawi.jpg' },
  { name: 'Puff', age: '1 Tahun', image: '/images/puff.jpg' },
  { name: 'Coco', age: '3 Bulan', image: '/images/coco.jpg' },
  { name: 'Lulu', age: '8 Bulan', image: '/images/lulu.jpg' },
  { name: 'Neko', age: '6 Bulan', image: '/images/neko.jpg' },
];

// 2. DITAMBAHKAN: Fungsi untuk navigasi
function goToReport() {
  router.push('/report-rescue');
}
</script>

<style scoped>
.adopt-slider {
  text-align: center;
  background: #f7f1e8;
  padding: 40px 0;
}
.mySwiper {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
  padding-bottom: 50px;
}

/* posisi slide tetap seimbang */
.swiper-slide {
  display: flex;
  justify-content: center;
  transition: all 0.3s ease;
}

/* ukuran dan efek skala */
.kitten-slide {
  transform: scale(0.8);
  opacity: 0.6;
  transition: transform 0.4s ease, opacity 0.4s ease;
}

.swiper-slide-active {
  transform: scale(1.15);
  opacity: 1;
  z-index: 2;
}

.swiper-slide-prev,
.swiper-slide-next {
  transform: scale(0.9);
  opacity: 0.8;
  z-index: 1;
}

/* gaya kartu kitten */
.kitten-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  text-align: center;
  width: 200px;
  height: 240px;
}

.kitten-card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
}

.kitten-info {
  padding: 10px 0;
}

.kitten-info .age {
  font-size: 12px;
  color: #555;
  margin: 0;
}

.kitten-info .name {
  font-size: 18px;
  font-weight: bold;
  margin: 0;
}

.title {
  font-size: 28px;
  font-weight: 800;
  margin-top: 30px;
}

.cat-button {
  background: transparent;
  border: none;
  padding: 0;
  margin-top: 10px;
  cursor: pointer;
  transition: transform 0.2s ease, opacity 0.2s ease;
}

.cat-button img {
  /* Atur ukuran gambar tombol di sini */
  width: 80px; 
  height: auto;
}

.cat-button:hover {
  transform: scale(1.1); /* Efek hover membesar */
  opacity: 0.9;
}
</style>
