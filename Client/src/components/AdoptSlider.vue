<template>
  <div class="adopt-slider">
    <div v-if="loading" class="loading-message">
      Memuat daftar kucing...
    </div>
    <div v-else-if="kittens.length === 0" class="no-data-message">
      Tidak ada data kucing. Pastikan server berjalan dan database terisi.
    </div>

    <Swiper
      v-else
      :modules="[Navigation, Pagination]"
      :slides-per-view="3"
      :centered-slides="true"
      :loop="true"
      navigation
      pagination
      class="mySwiper"
      @realIndexChange="onRealIndexChange"
    >
      <SwiperSlide
        v-for="kitten in kittens"
        :key="kitten.id"
        class="kitten-slide"
      >
        <div class="kitten-card">
          <img :src="kitten.imageUrl" :alt="kitten.name" />
          <div class="kitten-info">
            <p class="age">{{ kitten.age || 'Usia tidak diketahui' }}</p>
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
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

const router = useRouter();
const currentRealIndex = ref(0);
const kittens = ref([]);
const loading = ref(true);

const API_URL = 'http://localhost:5000/api/cats';
const IMAGE_BASE = 'http://localhost:5000/uploads/'; // Sesuaikan folder upload backend

const fetchKittens = async () => {
  try {
    const response = await axios.get(API_URL);
    kittens.value = response.data.map(cat => ({
      ...cat,
      imageUrl: cat.image ? IMAGE_BASE + cat.image : '/images/default.jpg'
    }));
  } catch (err) {
    console.error("Gagal mengambil data:", err);
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  fetchKittens();
});

const onRealIndexChange = (swiper) => {
  currentRealIndex.value = swiper.realIndex;
};

const goToAdoptDetail = () => {
  const activeKitten = kittens.value[currentRealIndex.value];
  if (activeKitten && activeKitten.id) {
    router.push(`/adopt-now/${activeKitten.id}`);
  } else {
    console.error("Data kitten tidak ditemukan.");
  }
};
</script>

<style scoped>
/* Style sama seperti sebelumnya */
</style>
