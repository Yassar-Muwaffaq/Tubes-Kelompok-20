<template>
  <section id="news" class="py-16 bg-gray-50 overflow-hidden">
    <div class="container mx-auto px-4">
      <!-- Judul Utama -->
      <div class="text-center mb-10">
        <h1 class="text-2xl sm:text-3xl font-bold text-gray-800 tracking-tight">
          News About Us
        </h1>
        <p class="text-gray-500 mt-2 text-sm sm:text-base">
          Get the latest stories from our cat community
        </p>
      </div>

      <!-- Wrapper scroll horizontal -->
      <div
        class="flex gap-7 overflow-x-auto snap-x snap-mandatory scroll-smooth pb-4 hide-scrollbar"
      >
        <div
          v-for="(news, index) in newsList"
          :key="index"
          class="flex-none p-1 max-sm:w-[50%] md:w-[32%] bg-white rounded-2xl shadow-md overflow-hidden flex flex-col md:flex-row hover:shadow-lg transition-all snap-start h-[165px] md:h-[175px]"
        >
          <!-- Gambar di kiri -->
          <div class="relative h-[125px] md:w-[45%] md:h-[150px] p-[1.5] sm:h-[80%] sm:w-[40%]">
            <img
              :src="news.image"
              alt="Gambar berita"
              class="w-full h-full object-cover rounded-xl"
            />
          </div>

          <!-- Konten di kanan -->
          <div class="flex flex-col justify-between p-2 md:w-[55%] ">
            <!-- Judul & Deskripsi -->
            <div>
              <div class="flex items-start justify-between">
                <h2
                  class="text-[13px] sm:text-sm font-semibold text-gray-800 leading-snug line-clamp-2"
                >
                  {{ news.title }}
                </h2>
                <button
                  class="text-gray-400 text-[20px] leading-none hover:text-gray-600"
                >
                  ⋮
                </button>
              </div>

              <p
                class="text-gray-600 mt-1 text-[11px] sm:text-[12px] leading-relaxed line-clamp-3"
              >
                {{ news.desc }}
              </p>
            </div>

            <!-- Tombol Aksi & Emoji -->
            <div
              class="flex items-center gap-1 mt-1 border-t border-gray-200 pt-1.5"
            >
              <button
                class="flex items-center gap-1 px-1 py-[3px] rounded-md bg-gray-100 hover:bg-gray-200 text-[10.5px] sm:text-[11.5px] font-medium transition"
              >
                ❤️ <span>{{ news.likes }}</span>
              </button>
              <button
                class="flex items-center gap-1 px-1.5 py-[3px] rounded-md bg-gray-100 hover:bg-gray-200 text-[10.5px] sm:text-[11.5px] font-medium transition"
              >
                💬 <span>{{ news.comments }}</span>
              </button>
              <button
                class="flex items-center gap-1 px-1 py-[3px] rounded-md bg-gray-100 hover:bg-gray-200 text-[10.5px] sm:text-[11.5px] font-medium transition"
              >
                🔗
              </button>

              <!-- Emoji Reaksi -->
              <div class="ml-auto flex gap-1 text-sm sm:text-base">
                <span
                  class="hover:scale-110 transition-transform cursor-pointer"
                  >😺</span
                >
                <span
                  class="hover:scale-110 transition-transform cursor-pointer"
                  >😻</span
                >
                <span
                  class="hover:scale-110 transition-transform cursor-pointer"
                  >😹</span
                >
              </div>
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
    image: "images/header/Cat 9.jpg",
    likes: 20,
    comments: 1000,
  },
  {
    title: "Kucing Diselamatkan dari Pohon",
    desc: "Seekor kucing berhasil diselamatkan oleh tim damkar setelah terjebak di atas pohon selama dua hari.",
    image: "images/header/Cat 9.jpg",
    likes: 54,
    comments: 421,
  },
  {
    title: "Kucing Baru di Shelter",
    desc: "Shelter kami baru kedatangan kucing kecil lucu berumur 2 bulan yang sedang mencari rumah baru.",
    image: "images/header/Cat 9.jpg",
    likes: 13,
    comments: 89,
  },
  {
    title: "Festival Kucing Tahunan",
    desc: "Event besar untuk para pecinta kucing digelar minggu ini, menghadirkan puluhan ras dan atraksi unik.",
    image: "images/header/Cat 9.jpg",
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
