<template>
  <section id="news" class="py-16 bg-gray-50 overflow-hidden">
    <div class="container mx-auto px-4 lg:px-8">
      <!-- Judul Utama -->
      <div class="text-center mb-10">
        <h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 tracking-tight">
          News About Us
        </h1>
        <p class="text-gray-500 mt-2 text-xs sm:text-sm md:text-base lg:text-lg">
          Get the latest stories from our cat community,
          <a
            href="/news"
            class="text-blue-500 py-2 px-4 border-2 rounded-full border-blue-500 hover:bg-blue-500 hover:text-zinc-950"
          >
            More News...
          </a>
        </p>
      </div>

      <!-- Scroll Horizontal -->
      <div class="flex gap-6 overflow-x-auto snap-x snap-mandatory scroll-smooth pb-6 hide-scrollbar">
        <!-- Kartu berita -->
        <div
          v-for="(news, index) in newsList"
          :key="index"
          class="flex-none bg-white rounded-2xl shadow-md hover:shadow-xl hover:scale-[1.03]
                 transition-all snap-start overflow-hidden border border-gray-100 cursor-pointer
                 w-[85%] sm:w-[60%] md:w-[45%] lg:w-[30%] xl:w-[25%]"
          @click="openModal(news)"
        >
          <!-- Gambar -->
          <div class="relative">
            <img
              :src="news.image"
              alt="Gambar berita"
              class="w-full h-[160px] sm:h-[180px] md:h-[200px] lg:h-[220px] object-cover"
            />
          </div>

          <!-- Judul + Deskripsi -->
          <div class="flex flex-col justify-start p-4">
            <h2
              class="font-semibold text-gray-800 leading-snug 
                     text-[14px] sm:text-[15px] md:text-[16px] lg:text-[17px]
                     line-clamp-2 mb-1"
            >
              {{ news.title }}
            </h2>
            <p
              class="text-gray-600 
                     text-[12px] sm:text-[13px] md:text-[14px] lg:text-[15px]
                     leading-relaxed line-clamp-3"
            >
              {{ news.desc }}
            </p>
          </div>

          <!-- Bar aksi -->
          <div
            class="flex items-center justify-between px-4 py-3 border-t border-gray-100 bg-gray-50"
          >
            <div class="flex items-center gap-3">
              <button
                @click.stop="toggleLike(news)"
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
              >
                ❤️ <span>{{ news.likes }}</span>
              </button>

              <button
                @click.stop
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
              >
                💬 <span>{{ news.comments }}</span>
              </button>

              <button
                @click.stop
                class="px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
                aria-label="share"
              >
                🔗
              </button>
            </div>

            <div class="flex gap-2 text-[16px]">
              <span @click.stop class="hover:scale-110 transition-transform cursor-pointer">😺</span>
              <span @click.stop class="hover:scale-110 transition-transform cursor-pointer">😻</span>
              <span @click.stop class="hover:scale-110 transition-transform cursor-pointer">😹</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- POPUP MODAL -->
    <transition name="fade">
      <div
        v-if="selectedNews"
        class="fixed inset-0 bg-black/70 flex items-center justify-center z-50 px-4"
        @click.self="closeModal"
      >
        <div
          class="bg-white rounded-2xl max-w-3xl w-full overflow-hidden shadow-2xl relative"
        >
          <button
            class="absolute top-3 right-4 text-gray-500 hover:text-gray-700 text-2xl font-bold"
            @click="closeModal"
          >
            ✕
          </button>

          <img :src="selectedNews.image" class="w-full h-[300px] sm:h-[400px] object-cover" />

          <div class="p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-2">{{ selectedNews.title }}</h2>
            <p class="text-gray-600 leading-relaxed text-sm sm:text-base">
              {{ selectedNews.desc }}
            </p>

            <div class="flex items-center gap-4 mt-4 border-t pt-3 text-gray-700 text-sm">
              <button @click="toggleLike(selectedNews)" class="flex items-center gap-2 hover:text-red-500">
                ❤️ {{ selectedNews.likes }}
              </button>
              <span>💬 {{ selectedNews.comments }}</span>
              <span>🔗 Share</span>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const newsList = ref([
  {
    title: 'Ada Kucing Kece',
    desc: 'Kucing ini baru saja memenangkan lomba kecantikan hewan tingkat nasional. Ia dikenal karena bulunya yang lembut dan tingkahnya yang menggemaskan.',
    image: '/images/header/Cat 9.jpg',
    likes: 20,
    comments: 1000,
  },
  {
    title: 'Kucing Diselamatkan dari Pohon',
    desc: 'Seekor kucing berhasil diselamatkan oleh tim damkar setelah terjebak di atas pohon selama dua hari.',
    image: '/images/header/Cat 9.jpg',
    likes: 54,
    comments: 421,
  },
  {
    title: 'Kucing Baru di Shelter',
    desc: 'Shelter kami baru kedatangan kucing kecil lucu berumur 2 bulan yang sedang mencari rumah baru.',
    image: '/images/header/Cat 9.jpg',
    likes: 13,
    comments: 89,
  },
  {
    title: 'Festival Kucing Tahunan',
    desc: 'Event besar untuk para pecinta kucing digelar minggu ini, menghadirkan puluhan ras dan atraksi unik.',
    image: '/images/header/Cat 9.jpg',
    likes: 89,
    comments: 230,
  },
])

const selectedNews = ref(null)

function openModal(news) {
  selectedNews.value = news
  document.body.style.overflow = 'hidden'
}

function closeModal() {
  selectedNews.value = null
  document.body.style.overflow = ''
}

function toggleLike(news) {
  news.likes += 1
}
</script>

<style scoped>
.hide-scrollbar::-webkit-scrollbar {
  display: none;
}
.hide-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
