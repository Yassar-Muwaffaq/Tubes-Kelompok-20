<template>
  <header
    :class="[
      'fixed top-0 left-0 w-full z-50 transition-all duration-500 ease-in-out bg-white/30 backdrop-blur-xl border-b border-white/20 shadow-sm',
      scrolledDown ? 'translate-y-0' : '-translate-y-full'
    ]"
  >
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">
        <!-- Brand -->
        <router-link to="/" class="flex items-center space-x-2">
          <div class="flex-shrink-0 flex items-center justify-center">
            <img
              src="/images/logo.svg"
              alt="Logo"
              class="h-10 w-10 rounded-full bg-gray-200 object-contain"
            />
          </div>
          <span class="text-xl font-semibold text-gray-800 leading-none flex items-center">
            Adopt Center
          </span>
        </router-link>

        <!-- Nav Links -->
        <nav class="hidden md:flex space-x-6">
          <router-link to="/" class="text-gray-900 hover:text-gray-800 transition">Home</router-link>
          <router-link to="/adopt-now" class="text-gray-900 hover:text-gray-800 transition">Adopt</router-link>
          <router-link to="/about" class="text-gray-900 hover:text-gray-800 transition">About Us</router-link>
          <router-link to="/faq" class="text-gray-900 hover:text-gray-800 transition">FAQ</router-link>
          <router-link to="/donate" class="text-gray-900 hover:text-gray-800 transition">Donate</router-link>
        </nav>

        <!-- User Area -->
        <div v-if="!isLoggedIn" class="hidden md:flex items-center space-x-4">
          <router-link to="/login" class="px-4 py-1.5 bg-blue-600 text-white rounded-full hover:bg-blue-700 transition">
            Log in
          </router-link>
          <router-link to="/signup" class="px-4 py-1.5 border border-blue-600 text-blue-600 rounded-full hover:bg-blue-50 transition">
            Sign up
          </router-link>
        </div>

        <div v-else class="hidden md:flex items-center space-x-2 relative group">
          <img
            src="/images/header/hero-image.jpg"
            alt="User"
            class="h-8 w-8 rounded-full bg-gray-300 object-cover cursor-pointer"
          />
          <span class="text-gray-900 font-medium cursor-pointer">User</span>

          <!-- Dropdown -->
          <div
            class="absolute right-0 top-10 w-36 bg-white rounded-xl shadow-lg border border-gray-100 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300"
          >
            <router-link
              to="/profile"
              class="block px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-t-xl"
            >
              Profile
            </router-link>
            <button
              @click="logout"
              class="w-full text-left block px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-b-xl"
            >
              Logout
            </button>
          </div>
        </div>

        <!-- Mobile Menu Button -->
        <button @click="mobileOpen = !mobileOpen" class="md:hidden text-gray-800 focus:outline-none">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-7 h-7">
            <path
              v-if="!mobileOpen"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            />
            <path
              v-else
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>
      </div>
    </div>

    <!-- Mobile Menu -->
    <transition name="slide-fade">
      <div
        v-if="mobileOpen"
        class="md:hidden bg-white/30 backdrop-blur-xl border-t border-white/20 shadow-md pb-3"
      >
        <nav class="flex flex-col px-4 py-3 space-y-2">
          <router-link to="/" class="text-gray-900 hover:text-gray-800 transition">Home</router-link>
          <router-link to="/adopt-now" class="text-gray-900 hover:text-gray-800 transition">Adopt</router-link>
          <router-link to="/about" class="text-gray-900 hover:text-gray-800 transition">About Us</router-link>
          <router-link to="/faq" class="text-gray-900 hover:text-gray-800 transition">FAQ</router-link>
          <router-link to="/donate" class="text-gray-900 hover:text-gray-800 transition">Donate</router-link>

          <div v-if="!isLoggedIn" class="pt-3 border-t border-gray-200">
            <router-link to="/login" class="block py-2 text-blue-600 font-medium">Login</router-link>
            <router-link to="/signup" class="block py-2 text-blue-600 font-medium">Sign Up</router-link>
          </div>
          <div v-else class="pt-3 border-t border-gray-200">
            <router-link to="/profile" class="block py-2 text-gray-800 font-medium">Profile</router-link>
            <button @click="logout" class="block w-full text-left py-2 text-gray-800 font-medium">Logout</button>
          </div>
        </nav>
      </div>
    </transition>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'

const scrolledDown = ref(true)
const lastScrollY = ref(0)
const mobileOpen = ref(false)
const isLoggedIn = ref(false)
const router = useRouter()

// cek status login dari localStorage
onMounted(() => {
  isLoggedIn.value = localStorage.getItem('isLoggedIn') === 'true'
  window.addEventListener('scroll', handleScroll)
})
onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

// sembunyikan navbar saat scroll ke bawah
const handleScroll = () => {
  const currentY = window.scrollY
  scrolledDown.value = !(currentY > lastScrollY.value && currentY > 100)
  lastScrollY.value = currentY
}

// logout
const logout = () => {
  localStorage.removeItem('isLoggedIn')
  isLoggedIn.value = false
  router.push('/')
}
</script>

<style scoped>
.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s ease;
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(-10px);
  opacity: 0;
}
</style>
