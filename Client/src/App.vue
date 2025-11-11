<script setup>
import Navbar from './components/navbar.vue'
import { RouterView } from 'vue-router'
import { ref, onMounted } from 'vue'
import {CatApi} from '@/api/api.js'


const cats = ref([])

onMounted(async () => {
  try {
    const res = await CatApi.getAll()
    cats.value = res.data
  } catch (err) {
    console.error('❌ Gagal ambil data kucing:', err)
  }
})
</script>

<template>
  <Navbar />
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">🐾 Daftar Kucing</h1>

    <ul v-if="cats.length" class="space-y-3">
      <li
        v-for="cat in cats"
        :key="cat.id"
        class="border p-4 rounded-lg shadow-sm hover:bg-gray-50"
      >
        <h2 class="text-lg font-semibold">{{ cat.name }}</h2>
        <p>Usia: {{ cat.age }} tahun</p>
        <p>Ras: {{ cat.breed }}</p>
      </li>
    </ul>

    <p v-else class="text-gray-500">Belum ada data kucing.</p>
  </div>

  <RouterView />
</template>

<style scoped>
/* Styling sederhana */
</style>
