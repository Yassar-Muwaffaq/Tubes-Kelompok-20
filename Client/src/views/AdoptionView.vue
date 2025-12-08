<template>
  <div class="min-h-screen w-full bg-[#f7f1e8] pt-28">
    <main class="max-w-7xl mx-auto p-4 sm:p-8">
      <h1 class="text-3xl font-bold text-primary-text mb-6">Pusat Adopsi Kucing</h1>

      <div class="bg-white p-2 sm:p-4 rounded-xl shadow-lg mb-8 flex flex-wrap gap-2 sm:gap-4 items-center justify-between">
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Cari nama atau deskripsi kucing..."
          class="w-full p-2 sm:p-3 border border-gray-300 rounded-md text-sm sm:text-base focus:ring-light-orange focus:border-light-orange transition duration-300"
        />

        <div class="flex gap-2">
          <select v-model="selectedBreed" class="p-2 bg-light-blue rounded-md border border-gray-200">
            <option value="Semua Ras">Semua Ras</option>
            <option v-for="breed in breeds" :key="breed" :value="breed">{{ breed }}</option>
          </select>
        </div>
      </div>

      <div v-if="filteredCats.length" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div 
          v-for="cat in filteredCats" 
          :key="cat.id" 
          class="bg-white rounded-xl shadow-xl overflow-hidden"
        >
          <div class="relative h-48 w-full bg-dark-bg">
            <img 
              :src="cat.image || '/images/default.jpg'" 
              :alt="cat.name"
              class="object-cover w-full h-full"
            />

          </div>

          <div class="p-5">
            <h2 class="text-2xl font-bold text-primary-text mb-2">{{ cat.name }}</h2>

            <div class="text-sm text-gray-500 space-y-1 mb-4">
              <p>🕓 {{ cat.age }} tahun</p>
              <p>🐱 {{ cat.breed }}</p>
              <p v-if="cat.gender">🚻 {{ cat.gender }}</p>
            </div>

            <p class="text-gray-600 text-sm mb-4 line-clamp-3">{{ cat.description }}</p>

            <button 
              @click="$router.push('/adopt-now/' + cat.id)" 
              class="w-full text-primary-text font-semibold py-2 rounded-lg bg-[#FCD34D] hover:bg-[#ed8b3c]"
            >
              Adopsi Sekarang
            </button>
          </div>
        </div>
      </div>

      <div v-else class="text-center p-10 bg-white rounded-xl shadow-lg text-gray-500">
        Tidak ada kucing yang cocok dengan kriteria pencarian Anda.
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";
import axios from "axios";

const searchQuery = ref("");
const selectedBreed = ref("Semua Ras");
const catList = ref([]);
const breeds = ref([]);

const API_URL = "http://localhost:5000/api/cats";

const fetchCats = async () => {
  try {
    const res = await axios.get(API_URL);

    catList.value = res.data;

    // Ambil semua breed unik
    breeds.value = [...new Set(res.data.map(cat => cat.breed))];

  } catch (err) {
    console.error("Error fetching cats:", err);
  }
};

onMounted(fetchCats);

const filteredCats = computed(() =>
  catList.value.filter(cat =>
    (cat.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
     cat.description.toLowerCase().includes(searchQuery.value.toLowerCase())) &&
    (selectedBreed.value === "Semua Ras" || cat.breed === selectedBreed.value)
  )
);
</script>

<style scoped>
/* style tetap sama */
</style>
