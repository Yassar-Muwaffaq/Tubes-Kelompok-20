<template>
  <section id="news" class="py-16 bg-gray-50 overflow-hidden">
    <div class="container mx-auto px-4 lg:px-8">
      <!-- Judul Utama -->
      <div class="text-center mb-10">
        <h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-gray-800 tracking-tight">
          News About Us
        </h1>
        <p class="text-gray-500 mt-2 text-xs sm:text-sm md:text-base lg:text-lg">
          Get the latest stories from our cat community
        </p>
      </div>

      <!-- Wrapper scroll horizontal -->
      <div
        class="flex gap-6 overflow-x-auto snap-x snap-mandatory scroll-smooth pb-6 hide-scrollbar"
      >
        <!-- Kartu berita -->
        <div
          v-for="(news, index) in newsList"
          :key="index"
          class="flex-none bg-white rounded-2xl shadow-md hover:shadow-lg transition-all snap-start
                 overflow-hidden border border-gray-100
                 w-[85%] sm:w-[60%] md:w-[45%] lg:w-[30%] xl:w-[25%]"
        >
          <!-- Bagian atas: gambar + teks -->
          <div class="flex flex-col md:flex-row">
            <!-- Gambar -->
            <div class="relative md:w-[40%]">
              <img
                :src="news.image"
                alt="Gambar berita"
                class="w-full h-[140px] sm:h-[150px] md:h-[130px] lg:h-[160px] object-cover"
              />
            </div>

            <!-- Judul + Deskripsi -->
            <div class="flex flex-col justify-center p-4 md:w-[60%]">
              <h2
                class="font-semibold text-gray-800 leading-snug 
                       text-[13px] sm:text-[14px] md:text-[15px] lg:text-[16px] xl:text-[17px]
                       line-clamp-2 mb-1"
              >
                {{ news.title }}
              </h2>
              <p
                class="text-gray-600 
                       text-[11px] sm:text-[12px] md:text-[13px] lg:text-[14px] xl:text-[15px]
                       leading-relaxed line-clamp-3"
              >
                {{ news.desc }}
              </p>
            </div>
          </div>

          <!-- Bagian bawah: bar aksi -->
          <div
            class="flex items-center justify-between px-4 py-3 border-t border-gray-100 bg-gray-50"
          >
            <div class="flex items-center gap-2 sm:gap-3">
              <button
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 
                       text-[10px] sm:text-[11px] md:text-[12px] lg:text-[13px] font-medium transition"
              >
                ❤️ <span>{{ news.likes }}</span>
              </button>

              <button
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 
                       text-[10px] sm:text-[11px] md:text-[12px] lg:text-[13px] font-medium transition"
              >
                💬 <span>{{ news.comments }}</span>
              </button>

              <button
                class="px-2 py-1 rounded-md hover:bg-gray-200 
                       text-[10px] sm:text-[11px] md:text-[12px] lg:text-[13px] font-medium transition"
                aria-label="share"
              >
                🔗
              </button>
            </div>

            <!-- Emoji kanan -->
            <div class="flex gap-1.5 sm:gap-2 text-[12px] sm:text-[14px] md:text-[15px] lg:text-[16px]">
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
];
</script>

<style scoped>
.hide-scrollbar::-webkit-scrollbar {
  display: none;
}
.hide-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>
