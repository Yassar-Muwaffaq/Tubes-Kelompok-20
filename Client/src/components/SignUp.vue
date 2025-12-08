<template>
  <div
<<<<<<< HEAD
    class="min-h-screen w-full bg-[#f7f1e8] bg-repeat"
    :style="{ backgroundSize: '60px' }"
  >
    <Navbar />

    <div class="flex justify-center items-start pt-20 relative">
      <img
        :src="catImage"
        alt="cat"
        class="absolute top-4 right-[20%] hidden lg:block w-48 object-contain z-10"
      />

      <div
        class="bg-[#FCD34D] w-[450px] rounded-xl shadow-lg px-8 pt-10 pb-8 text-center relative mt-10 z-20"
      >
        <h2 class="font-bold text-2xl mb-2 text-gray-900">CREATE ACCOUNT</h2>
        <p class="text-gray-800 text-sm mb-6">Join our community today</p>

        <div class="flex w-full gap-3 mb-6">
          <button
            v-for="button in socialButtons"
            :key="button.name"
            type="button"
            class="flex items-center justify-center gap-2 bg-white border border-gray-200 w-1/2 py-2 rounded-lg text-sm font-medium hover:bg-gray-50 transition shadow-sm"
          >
            <img :src="button.icon" :alt="button.name" class="w-5 h-5" />
            {{ button.label }}
          </button>
        </div>

        <div class="flex items-center justify-center gap-3 mb-6">
          <span class="h-px bg-gray-400 w-full"></span>
          <span class="text-gray-600 text-sm font-medium whitespace-nowrap">OR REGISTER WITH</span>
          <span class="h-px bg-gray-400 w-full"></span>
        </div>

        <form @submit.prevent="handleSignup" class="flex flex-col gap-4">
          <div v-for="field in formFields" :key="field.model" class="text-left">
=======
    class="min-h-screen w-full bg-repeat"
    :style="{
      backgroundImage: `url(${backgroundImage})`,
      backgroundSize: '60px'
    }"
  >
    <Navbar />

    <div class="flex justify-center items-start pt-40 relative">
      <!-- Gambar Kucing -->
      <img
        :src="catImage"
        alt="cat"
        class="absolute top-17 right-[35%] -translate-x-1/2 w-50 object-contain z-10"
      />

      <!-- Card Sign Up -->
      <div
        class="bg-[#f7d36a] w-[454px] rounded-xl shadow-lg px-1 pt-20 pb-6 text-center relative"
      >
        <h2 class="font-bold text-xl mb-6">CREATE ACCOUNT</h2>

        <!-- Tombol Social Media -->
        <div class="flex w-full gap-2 mb-7">
          <button
            v-for="button in socialButtons"
            :key="button.name"
            class="flex items-center justify-center gap-2 bg-gray-200 border border-gray-300 w-1/2 py-1 px-2 rounded-lg text-sm hover:bg-gray-100 transition shadow-sm"
          >
            <img :src="button.icon" :alt="button.name" class="w-6 h-5" />
            {{ button.label }} 
          </button>
        </div>

        <!-- Garis Pemisah -->
        <div class="flex items-center justify-center gap-3 my-4">
          <span class="h-px bg-gray-500 w-16"></span>
          <span class="text-gray-900 text-xl font-semibold">OR</span>
          <span class="h-px bg-gray-500 w-16"></span>
        </div>

        <!-- Form Input -->
        <form @submit.prevent="handleSignup" class="text-left">
          <div
            v-for="field in formFields"
            :key="field.model"
            class="flex flex-col items-center"
          >
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
            <input
              :type="field.type"
              v-model="formData[field.model]"
              :placeholder="field.placeholder"
<<<<<<< HEAD
              class="w-full px-4 py-3 rounded-lg bg-white border border-gray-300 text-gray-800 placeholder-gray-500 outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent transition"
=======
              class="w-[90%] bg-transparent border-b border-gray-500 py-2 mb-6 outline-none focus:border-gray-900 transition"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
              required
            />
          </div>

<<<<<<< HEAD
          <button
            type="submit"
            :disabled="isLoading"
            class="w-full mt-4 bg-gray-900 text-white font-bold py-3 rounded-lg hover:bg-gray-800 transition shadow-md disabled:opacity-50"
          >
            {{ isLoading ? "CREATING ACCOUNT..." : "CREATE ACCOUNT" }}
          </button>
        </form>

        <p class="text-sm mt-6 text-gray-800">
=======
          <div class="flex justify-center flex-col">
            <button
              type="submit"
              class="bg-gray-200 text-gray-800 w-[50%] py-3 rounded-md hover:bg-gray-300 transition shadow-lg mx-auto"
            >
              CREATE ACCOUNT
            </button>
          </div>
        </form>

        <p class="text-sm mt-5">
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          Already have an account?
          <router-link
            to="/login"
            class="font-bold underline text-gray-900 hover:text-black"
          >
            Login
          </router-link>
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
<<<<<<< HEAD
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { AuthApi } from "@/api/authApi.js"
// Import Navbar jika ada, jika tidak komen baris ini
import Navbar from '@/components/navbar.vue'

const router = useRouter()
const isLoading = ref(false)

// --- 1. DEFINISI DATA (Ini yang sebelumnya hilang!) ---
const catImage = "/images/Asset Signup/kucing-report-button.png" // Pastikan file ini ada di public/images/Asset Signup/

const socialButtons = [
  { name: 'google', label: 'Google', icon: '/images/Asset Signup/google-removebg-preview.png' },
  { name: 'facebook', label: 'Facebook', icon: '/images/Asset Signup/facebook-removebg-preview.png' }
]

const formFields = [
  { type: 'text', model: 'name', placeholder: 'Full Name' },
  { type: 'email', model: 'email', placeholder: 'Email Address' },
  { type: 'password', model: 'password', placeholder: 'Password' }
]

=======
import Navbar from '@/components/Navbar.vue'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

//Background dan Gambar
const backgroundImage = '/src/assets/fish.png'
const catImage = '/images/Asset Signup/kucing-report-button.png'

// Data tombol social media
const socialButtons = [
  {
    name: 'google',
    label: 'Sign up with Google',
    icon: '/images/Asset Signup/google-removebg-preview.png'
  },
  {
    name: 'facebook',
    label: 'Sign up with Facebook',
    icon: '/images/Asset Signup/facebook-removebg-preview.png'
  }
]

//Data input form
const formFields = [
  { model: 'name', type: 'text', placeholder: 'Full Name' },
  { model: 'email', type: 'email', placeholder: 'Email Address' },
  { model: 'password', type: 'password', placeholder: 'Password' }
]

//State data form
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
const formData = ref({
  name: '',
  email: '',
  password: ''
})

<<<<<<< HEAD
// --- 2. FUNGSI SIGNUP ---
const handleSignup = async () => {
  if (isLoading.value) return
  isLoading.value = true

  try {
    console.log("Sending data:", formData.value) // Debugging
    const res = await AuthApi.signup(formData.value)

    if (res.data.success) {
      alert("Signup Berhasil! Silakan Login.")
      router.push("/login")
    } else {
      alert("Signup Gagal: " + (res.data.error || "Unknown error"))
    }
  } catch (err) {
    console.error(err)
    const msg = err.response?.data?.error || "Terjadi kesalahan pada server"
    alert(msg)
  } finally {
    isLoading.value = false
  }
}
</script>
=======
// Fungsi Sign Up
const handleSignup = () => {
  const { name, email, password } = formData.value
  if (name && email && password) {
    alert('Account created successfully!')
    router.push('/login')
  } else {
    alert('Please fill all fields!')
  }
}
</script>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
