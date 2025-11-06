<template>
  <section id="news" class="py-16 bg-gray-50 mt-5">
    <div class="container mx-auto px-4 lg:px-8">
      <!-- Judul -->
      <div class="text-center mb-10">
        <h1 class="text-2xl sm:text-3xl lg:text-4xl font-bold text-gray-800 tracking-tight">
          News About Us
        </h1>
        <p class="text-gray-500 mt-2 text-sm sm:text-base">
          Get the latest stories from our cat community
        </p>
      </div>

      <!-- Daftar berita -->
      <div class="space-y-8">
        <div
          v-for="(news, index) in newsList"
          :key="index"
          class="bg-white rounded-2xl shadow-md hover:shadow-lg transition-all overflow-hidden border border-gray-100"
        >
          <!-- Gambar + teks -->
          <div class="flex flex-col md:flex-row">
            <!-- Gambar kiri -->
            <div class="md:w-[40%] relative">
              <img
                :src="news.image"
                alt="News image"
                class="w-[60%] h-56 md:h-full object-cover"
              />
            </div>

            <!-- Teks kanan -->
            <div class="md:w-[60%] flex flex-col p-6 justify-start">
              <h2
                class="font-semibold text-gray-800 leading-snug
                       text-lg sm:text-xl lg:text-2xl mb-2"
              >
                {{ news.title }}
              </h2>
              <p
                class="text-gray-600 text-sm sm:text-base lg:text-lg leading-relaxed"
              >
                {{ news.desc }}
              </p>
            </div>
          </div>

          <!-- Bar aksi -->
          <div
            class="flex flex-wrap items-center justify-between px-6 py-3 border-t border-gray-100 bg-gray-50"
          >
            <!-- Kiri: likes, comments, share -->
            <div class="flex items-center gap-3 text-gray-600 text-sm sm:text-base">
              <button
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 transition"
              >
                ❤️ <span>{{ news.likes }}</span>
              </button>

              <button
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 transition"
              >
                💬 <span>{{ news.comments }}</span>
              </button>

              <button
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 transition"
              >
                🔗
              </button>
            </div>

            <!-- Kanan: emoji -->
            <div
              class="flex gap-2 text-lg sm:text-xl md:text-2xl lg:text-2xl text-gray-700"
            >
              <span class="hover:scale-110 transition-transform cursor-pointer">😺</span>
              <span class="hover:scale-110 transition-transform cursor-pointer">😻</span>
              <span class="hover:scale-110 transition-transform cursor-pointer">😹</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const newsList = [
  {
    title: "Ada Kucing Kece",
    desc: "Kucing ini baru saja memenangkan lomba kecantikan hewan tingkat nasional. Ia dikenal karena bulunya yang lembut dan tingkahnya yang menggemaskan.",
    image: "/images/header/Cat 9.jpg",
    likes: 20,
    comments: 1000,
  },
  {
    title: "Kucing Diselamatkan dari Pohon",
    desc: "Seekor kucing berhasil diselamatkan oleh tim damkar setelah terjebak di atas pohon selama dua hari.",
    image: "/images/header/Cat 9.jpg",
    likes: 54,
    comments: 421,
  },
  {
    title: "Kucing Baru di Shelter",
    desc: "Shelter kami baru kedatangan kucing kecil lucu berumur 2 bulan yang sedang mencari rumah baru.",
    image: "/images/header/Cat 9.jpg",
    likes: 13,
    comments: 89,
  },
  {
    title: "Festival Kucing Tahunan",
    desc: "Event besar untuk para pecinta kucing digelar minggu ini, menghadirkan puluhan ras dan atraksi unik.",
    image: "/images/header/Cat 9.jpg",
    likes: 89,
    comments: 230,
  },
]
</script>

<style scoped>
/* Efek animasi halus saat hover card */
@media (prefers-reduced-motion: no-preference) {
  div:hover img {
    transform: scale(1.03);
    transition: transform 0.4s ease-in-out;
  }
}

/* Untuk memastikan layout rapi di HP */
@media (max-width: 640px) {
  #news h2 {
    font-size: 1rem;
  }
  #news p {
    font-size: 0.85rem;
  }
}
</style>
