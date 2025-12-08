<template>
  <div class="adopt-slider">
<<<<<<< HEAD
    <div v-if="loading" class="loading-message">
      Memuat daftar kucing...
    </div>

    <div v-else-if="kittens.length === 0" class="no-data-message">
      Tidak ada data kucing saat ini.
    </div>

    <Swiper
      v-else
      :modules="[Navigation, Pagination]"
      :slides-per-view="3"
      :centered-slides="true"
      :loop="shouldLoop"
=======
    <Swiper
      :modules="[Navigation, Pagination]"
      :slides-per-view="3"
      :centered-slides="true"
      :loop="true"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
      navigation
      pagination
      class="mySwiper"
      @realIndexChange="onRealIndexChange"
<<<<<<< HEAD
      :breakpoints="{
        320: { slidesPerView: 1, spaceBetween: 10 },
        640: { slidesPerView: 2, spaceBetween: 20 },
        1024: { slidesPerView: 3, spaceBetween: 30 }
      }"
    >
      <SwiperSlide
        v-for="kitten in kittens"
        :key="kitten.id"
        class="kitten-slide"
      >
        <div class="kitten-card">
          <img 
            v-if="kitten.imageUrl && !kitten.imageError"
            :src="kitten.imageUrl" 
            :alt="kitten.name" 
            @error="kitten.imageError = true"
          />
          
          <div v-else class="no-image-placeholder">
            <span class="no-image-text">Foto tidak tersedia</span>
          </div>

          <div class="kitten-info">
            <p class="age">{{ kitten.age ? kitten.age + ' Tahun' : 'Usia ?' }}</p>
=======
    >
      <SwiperSlide
        v-for="(kitten, index) in kittens"
        :key="kitten.id" 
        class="kitten-slide"
      >
        <div class="kitten-card">
          <img :src="kitten.image" :alt="kitten.name" />
          <div class="kitten-info">
            <p class="age">{{ kitten.age }}</p>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
            <h3 class="name">{{ kitten.name }}</h3>
          </div>
        </div>
      </SwiperSlide>
    </Swiper>

    <h2 class="title">ADOPT UR KITTEN HERE</h2>
    
    <button class="cat-button" @click="goToAdoptDetail">
      <img src="/images/home/cat-button.png" alt="adopt-now" />
    </button>

    <div class="more-button-container">
      <RouterLink to="/adoption" class="see-more-btn">
        Lihat Lainnya
      </RouterLink>
    </div>
  </div>
</template>

<script setup>
<<<<<<< HEAD
import axios from 'axios';
import { ref, onMounted, computed } from 'vue';
import { useRouter } from 'vue-router';
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
=======
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';

// Import style Swiper
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

const router = useRouter();
<<<<<<< HEAD
const currentRealIndex = ref(0);
const kittens = ref([]);
const loading = ref(true);

const API_URL = 'http://localhost:5000/api/cats';

const shouldLoop = computed(() => kittens.value.length > 3);

const fetchKittens = async () => {
  try {
    const response = await axios.get(API_URL);
    
    kittens.value = response.data.map(cat => {
      let finalImageUrl = null;

      // Logika Path Gambar Backend vs Manual
      if (cat.image && cat.image.startsWith('/images')) {
        // Gambar statis (seeding manual)
        finalImageUrl = cat.image; 
      } else if (cat.image_url) {
        // Gambar upload backend (sudah full URL dari backend)
        finalImageUrl = cat.image_url;
      }
      
      return {
        ...cat,
        imageUrl: finalImageUrl,
        imageError: false // Status awal: gambar dianggap aman (belum error)
      };
    });

  } catch (err) {
    console.error("Gagal mengambil data:", err);
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  fetchKittens();
});

=======
const currentRealIndex = ref(0); // State untuk menyimpan index slide aktif

// Data Kittens dengan ID unik
const kittens = [
  { id: 101, name: 'Miawi', age: '2 Tahun', image: '/images/miawi.jpg' },
  { id: 102, name: 'Puff', age: '1 Tahun', image: '/images/puff.jpg' },
  { id: 103, name: 'Coco', age: '3 Bulan', image: '/images/coco.jpg' },
  { id: 104, name: 'Lulu', age: '8 Bulan', image: '/images/lulu.jpg' },
  { id: 105, name: 'Neko', age: '6 Bulan', image: '/images/neko.jpg' },
];

// Event handler saat slide berubah (loop-compatible)
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
const onRealIndexChange = (swiper) => {
  currentRealIndex.value = swiper.realIndex;
};

<<<<<<< HEAD
const goToAdoptDetail = () => {
  if (kittens.value.length === 0) return;
  const activeKitten = kittens.value[currentRealIndex.value];
  if (activeKitten && activeKitten.id) {
    router.push(`/adopt-now/${activeKitten.id}`);
  }
};
</script>

<style scoped>
.adopt-slider {
  width: 100%;
  max-width: fit-content;
  margin: 0 auto;
  background-color: #f7f1e8;
  position: relative;
  text-align: center;
  padding: 2rem 0;
}

.loading-message, .no-data-message {
  text-align: center;
  padding: 50px;
  font-size: 1.2rem;
  color: #666;
}

.mySwiper {
  width: 100%;
  padding-bottom: 50px;
}

.kitten-slide {
  display: flex;
  justify-content: center;
  align-items: center;
  transition: transform 0.3s;
}

.swiper-slide-active .kitten-card {
  transform: scale(1.1);
  z-index: 10;
  box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

.kitten-card {
  background: #f7f1e8;
  border-radius: 15px;
  overflow: hidden;
  width: 250px;
  height: 350px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
  position: relative;
  display: flex;       /* Tambahan agar layout rapi */
  flex-direction: column;
}

/* Style Gambar */
.kitten-card img {
  width: 100%;
  height: 250px;       /* Tinggi fix untuk area gambar */
  object-fit: cover;
  display: block;
}

/* Style Pengganti Gambar (Kotak Abu-abu) */
.no-image-placeholder {
  width: 100%;
  height: 250px;       /* Tinggi sama persis dengan img */
  background-color: #e5e7eb; /* Abu-abu muda */
  display: flex;
  align-items: center;
  justify-content: center;
  color: #6b7280;
  font-size: 0.9rem;
  font-weight: 600;
  text-align: center;
  padding: 1rem;
}

.kitten-info {
  padding: 1rem;
  text-align: left;
  flex-grow: 1;        /* Mengisi sisa ruang ke bawah */
}

.kitten-info .age {
  font-size: 0.9rem;
  color: #888;
  margin-bottom: 0.2rem;
}

.kitten-info .name {
  font-size: 1.2rem;
  font-weight: bold;
  color: #333;
}

.title {
  font-family: 'Poppins', sans-serif;
  font-size: 2rem;
  font-weight: 800;
  margin: 2rem 0 1rem;
  color: #333;
}

.cat-button {
  background: none;
  border: none;
  cursor: pointer;
  transition: transform 0.2s;
}

.cat-button:hover {
  transform: scale(1.05);
}

.cat-button img {
  width: 120px;
}
.more-button-container {
  margin-top: 1rem;
  padding: 0.5rem 1rem; /* contoh padding */
  width: fit-content;

  /* Center the button */
  margin-left: auto;
  margin-right: auto;

  text-align: center;
  
  background-color: #ed8b3c;
  border-radius: 5px; /* opsional biar lebih rapi */
}
.see-more-btn {
  text-decoration: none;
  color: #f9f5f5;
  font-weight: 600;
  border-bottom: 2px solid transparent;
  transition: border-color 0.3s;
}

.see-more-btn:hover {
  border-color: #FCD34D;
  color: #333;
}
</style>
=======
// Fungsi navigasi dinamis ke halaman detail
const goToAdoptDetail = () => {
  const activeKitten = kittens[currentRealIndex.value];
  if (activeKitten && activeKitten.id) {
    // Contoh hasil: /adopt-now/102
    router.push(`/adopt-now/${activeKitten.id}`);
  } else {
    console.error("Data kitten tidak ditemukan untuk index ini.");
  }
};
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

.more-button-container {
  margin-top: 20px;
  text-align: center;
}

.see-more-btn {
  display: inline-block;
  background-color: #ED8B3C;
  color: white;
  padding: 12px 40px;
  border-radius: 9999px;
  text-decoration: none;
  font-weight: 700;
  transition: all 0.3s ease;
}

.see-more-btn:hover {
  background-color: #d97a2b; /* Warna sedikit lebih gelap saat di-hover */
  transform: translateY(-3px); /* Tombol naik sedikit saat di-hover */
  box-shadow: 0 6px 12px rgba(237, 139, 60, 0.4); /* Bayangan lebih tegas saat hover */
}

.see-more-btn:active {
  transform: translateY(-1px); /* Efek tekan saat diklik */
  box-shadow: 0 2px 4px rgba(237, 139, 60, 0.3);
}

</style>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
