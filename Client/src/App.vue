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

</template>

<style scoped>
/* Styling sederhana */
</style>
