<script setup>
// 1. Import komponen Navbar yang baru kita buat
import Navbar from './components/navbar.vue'

// 2. Import 'wadah' untuk halaman kita dari Vue Router
import { RouterView } from 'vue-router'
</script>

<template>
  <Navbar />

  <RouterView />
</template>

<style scoped>
/* Biarkan ini kosong */
</style>