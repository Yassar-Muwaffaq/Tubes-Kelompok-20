<template>
  <div
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
            <input
              :type="field.type"
              v-model="formData[field.model]"
              :placeholder="field.placeholder"
              class="w-[90%] bg-transparent border-b border-gray-500 py-2 mb-6 outline-none focus:border-gray-900 transition"
              required
            />
          </div>

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
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { AuthApi } from "@/api/authApi.js"

const router = useRouter()

const formData = ref({
  name: '',
  email: '',
  password: ''
})

const handleSignup = async () => {
  try {
    const res = await AuthApi.signup(formData.value)

    if (res.data.success) {
      alert("Signup success!")
      router.push("/login")
    } else {
      alert("Signup gagal")
    }
  } catch (err) {
    console.error(err)
    alert("Server error")
  }
}

</script>
