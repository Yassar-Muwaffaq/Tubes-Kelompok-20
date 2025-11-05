<template>
  <header
    :class="[
      'fixed top-0 left-0 w-full z-50 transition-all duration-500 ease-in-out',
      scrolledDown ? 'translate-y-0 bg-white/90 backdrop-blur-md shadow-md' : '-translate-y-full',
    ]"
  >
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">
        <!-- Brand -->
        <a href="/" class="flex items-center space-x-2">
          <img src="/images/logo.svg" alt="Logo" class="h-10 w-10 rounded-full bg-gray-200" />
          <span class="text-xl font-semibold text-gray-800">Adopt Center</span>
        </a>

        <!-- Nav Links -->
        <nav class="hidden md:flex space-x-6">
          <a href="/" class="text-gray-800 hover:text-gray-500 transition">Home</a>
          <a href="#adopt" class="text-gray-800 hover:text-gray-500 transition">Adopt</a>
          <a href="#about" class="text-gray-800 hover:text-gray-500 transition">About Us</a>
          <a href="#faq" class="text-gray-800 hover:text-gray-500 transition">FAQ</a>
          <a href="#donate" class="text-gray-800 hover:text-gray-500 transition">Donate</a>
        </nav>

        <!-- User Icon -->
        <div class="hidden md:flex items-center space-x-2">
          <img
            src="/images/header/hero-image.jpg"
            alt="User"
            class="h-8 w-8 rounded-full bg-gray-300 object-cover"
          />
          <span class="text-gray-800 font-medium">User</span>
        </div>

        <!-- Mobile Menu Button -->
        <button @click="mobileOpen = !mobileOpen" class="md:hidden text-gray-800 focus:outline-none">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            class="w-7 h-7"
          >
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
        class="md:hidden bg-white/90 backdrop-blur-md border-t border-gray-200 shadow-md"
      >
        <nav class="flex flex-col px-4 py-3 space-y-2">
          <a href="#hero-area" class="text-gray-800 hover:text-gray-500 transition">Home</a>
          <a href="#adopt" class="text-gray-800 hover:text-gray-500 transition">Adopt</a>
          <a href="#about" class="text-gray-800 hover:text-gray-500 transition">About Us</a>
          <a href="#faq" class="text-gray-800 hover:text-gray-500 transition">FAQ</a>
          <a href="#donate" class="text-gray-800 hover:text-gray-500 transition">Donate</a>
        </nav>
      </div>
    </transition>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const scrolledDown = ref(true)
const lastScrollY = ref(0)
const mobileOpen = ref(false)

const handleScroll = () => {
  const currentY = window.scrollY
  if (currentY > lastScrollY.value && currentY > 100) {
    // Scrolling down -> hide navbar
    scrolledDown.value = false
  } else {
    // Scrolling up -> show navbar
    scrolledDown.value = true
  }
  lastScrollY.value = currentY
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})
onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
/* Smooth slide for mobile menu */
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
