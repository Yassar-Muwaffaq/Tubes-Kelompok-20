<script setup>
import Navbar from './components/navbar.vue'
import { RouterView } from 'vue-router'
import { ref, onMounted } from 'vue'
<<<<<<< HEAD

=======
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
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
</script>

<template>
  <Navbar />
<<<<<<< HEAD
  <RouterView />
=======

>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
</template>

<style scoped>
/* Styling sederhana */
</style>
