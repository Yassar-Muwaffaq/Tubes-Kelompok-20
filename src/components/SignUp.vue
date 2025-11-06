<template>
  <div>
    <div class="container mt-5" style="max-width: 400px;">
      <h2 class="text-center mb-4">Sign Up</h2>
      <form @submit.prevent="handleSignup">
        <div class="mb-3">
          <label>Nama Lengkap</label>
          <input type="text" class="form-control" v-model="name" required />
        </div>
        <div class="mb-3">
          <label>Email</label>
          <input type="email" class="form-control" v-model="email" required />
        </div>
        <div class="mb-3">
          <label>Password</label>
          <input type="password" class="form-control" v-model="password" required />
        </div>
        <button class="btn btn-success w-100" type="submit">Daftar</button>
      </form>

      <p class="text-center mt-3">
        Sudah punya akun?
        <router-link to="/login">Login</router-link>
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const name = ref('')
const email = ref('')
const password = ref('')

const handleSignup = () => {
  if (name.value && email.value && password.value) {
    alert('Akun berhasil dibuat! Silakan login.')
    router.push('/login')
  } else {
    alert('Isi semua kolom!')
  }
}
</script>
