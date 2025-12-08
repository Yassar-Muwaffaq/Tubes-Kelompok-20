<template>
  <section id="news" class="py-16 bg-[#f7f1e8] overflow-hidden">
    <div class="container mx-auto px-4 lg:px-8">
      <!-- Judul Utama -->
      <div class="text-center mb-10">
        <h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-black tracking-tight">
          News About Us
        </h1>
<<<<<<< HEAD

        <p class="text-black mt-2 text-xs sm:text-sm md:text-base lg:text-lg">
          Get the latest stories from our cat community,

          <!-- Hanya tampil kalau ada news -->
          <a
            v-if="newsList.length > 0"
            href="/news"
            class="py-1.5 px-2 border-2 rounded-full border-[#ED8B3C] bg-[#ED8B3C] text-white hover:brightness-90 transition-all"
          >
            More News...
=======
        <p class="text-black mt-2 text-xs sm:text-sm md:text-base lg:text-lg">
          Get the latest stories from our cat community,
          <a
            href="/news"
                  class="py-1.5 px-2 border-2 rounded-full border-[#ED8B3C] bg-[#ED8B3C] text-white hover:brightness-90 transition-all"
                >
                  More News...
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          </a>
        </p>
      </div>

<<<<<<< HEAD
      <!-- KALAU TIDAK ADA NEWS -->
      <div v-if="newsList.length === 0" class="text-center py-10">
        <p class="text-gray-600 text-lg font-medium">
          No news we can give you for now.
        </p>
      </div>

      <!-- KALAU ADA NEWS -->
      <div
        v-else
=======
      <!-- Scroll Horizontal -->
      <div
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
        class="flex gap-6 overflow-x-auto snap-x snap-mandatory scroll-smooth pb-6 hide-scrollbar"
      >
        <!-- Kartu berita -->
        <div
          v-for="(news, index) in newsList"
<<<<<<< HEAD
          :key="news.id ?? index"
=======
          :key="index"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          class="flex-none bg-white rounded-2xl shadow-md hover:shadow-xl hover:scale-[1.03]
                 transition-all snap-start overflow-hidden border border-gray-100 cursor-pointer
                 w-[85%] sm:w-[60%] md:w-[45%] lg:w-[30%] xl:w-[25%]"
          @click="openModal(index)"
        >
          <!-- Gambar -->
          <div class="relative">
            <img
<<<<<<< HEAD
              :src="news.image || '/images/placeholder.jpg'"
=======
              :src="news.image"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
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
<<<<<<< HEAD
              {{ news.desc || news.content || '' }}
=======
              {{ news.desc }}
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
            </p>
          </div>

          <!-- Bar aksi -->
          <div
            class="flex items-center justify-between px-4 py-3 border-t border-gray-100 bg-gray-50"
            @click.stop
          >
            <div class="flex items-center gap-3">
              <button
                @click.stop="toggleLike(index)"
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
              >
<<<<<<< HEAD
                ❤️ <span>{{ news.likes ?? 0 }}</span>
=======
                ❤️ <span>{{ news.likes }}</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
              </button>

              <button
                @click.stop="openModal(index)"
                class="flex items-center gap-1 px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
              >
<<<<<<< HEAD
                💬 <span>{{ (news.comments?.length) || 0 }}</span>
=======
                💬 <span>{{ news.comments.length }}</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
              </button>

              <button
                @click.stop="share(index)"
                class="px-2 py-1 rounded-md hover:bg-gray-200 text-[12px] font-medium transition"
                aria-label="share"
              >
                🔗
              </button>
            </div>

            <div class="flex gap-2 text-[16px]">
              <button @click.stop="addReaction(index, '😺')" class="hover:scale-110 transition-transform cursor-pointer">😺</button>
              <button @click.stop="addReaction(index, '😻')" class="hover:scale-110 transition-transform cursor-pointer">😻</button>
              <button @click.stop="addReaction(index, '😹')" class="hover:scale-110 transition-transform cursor-pointer">😹</button>
            </div>
          </div>
        </div>
      </div>
    </div>

<<<<<<< HEAD
    <!-- POPUP -->
=======
    <!-- POPUP (dari file terpisah) -->
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    <NewsModal
      :visible="modalVisible"
      :news="newsList[selectedIndex]"
      :index="selectedIndex"
      v-if="modalVisible && selectedIndex !== null"
      @close="onModalClose"
      @update-news="onModalUpdate"
    />
  </section>
</template>

<script setup>
<<<<<<< HEAD
import { ref, onMounted } from 'vue'
import NewsModal from './NewsPopUp.vue'
import { NewsApi } from '@/api/newsApi.js'

const newsList = ref([])
const selectedIndex = ref(null)
const modalVisible = ref(false)

onMounted(async () => {
  try {
    const { data } = await NewsApi.getNews()
    console.log('Berita diterima:', data)

    const allNews = Array.isArray(data) ? data : []

    const commentPromises = allNews.map(n =>
      NewsApi.getComments(n.id).catch(() => ({ data: [] }))
    )
    const commentsResults = await Promise.all(commentPromises)

    allNews.forEach((n, idx) => {
      n.comments = Array.isArray(commentsResults[idx]?.data)
        ? commentsResults[idx].data
        : []

      n.desc = n.desc || n.content || ''
      n.likes = n.likes ?? 0
      n.image =
        import.meta.env.VITE_STATIC_BASE_URL.replace(/\/$/, '') +
        (n.image || '/images/placeholder.jpg')
      n.reactions = n.reactions || {}
      n.newComment = n.newComment ?? ''
    })

    newsList.value = allNews
  } catch (err) {
    console.error('Gagal load news:', err)
    newsList.value = []
  }
})

=======
import { ref } from 'vue'
import NewsModal from './NewsPopUp.vue'

const newsList = ref([
  {
    title: 'Ada Kucing Kece',
    desc: 'Kucing ini baru saja memenangkan lomba kecantikan hewan tingkat nasional. Ia dikenal karena bulunya yang lembut dan tingkahnya yang menggemaskan.',
    image: '/images/home/Cat 9.jpg',
    likes: 20,
    comments: [{ user: 'Mia', text: 'Lucunyaaa 😻', likes: 2 }],
    reactions: {},
  },
  {
    title: 'Kucing Diselamatkan dari Pohon',
    desc: 'Seekor kucing berhasil diselamatkan oleh tim damkar setelah terjebak di atas pohon selama dua hari.',
    image: '/images/home/Cat 9.jpg',
    likes: 54,
    comments: [{ user: 'Luna', text: 'Terima kasih pahlawan damkar!', likes: 3 }],
    reactions: {},
  },
  {
    title: 'Kucing Baru di Shelter',
    desc: 'Shelter kami baru kedatangan kucing kecil lucu berumur 2 bulan yang sedang mencari rumah baru.',
    image: '/images/home/Cat 9.jpg',
    likes: 13,
    comments: [],
    reactions: {},
  },
  {
    title: 'Festival Kucing Tahunan',
    desc: 'Event besar untuk para pecinta kucing digelar minggu ini, menghadirkan puluhan ras dan atraksi unik.',
    image: '/images/home/Cat 9.jpg',
    likes: 89,
    comments: [{ user: 'Dina', text: 'Seru banget tahun lalu!', likes: 1 }],
    reactions: {},
  },
])

const selectedIndex = ref(null)
const modalVisible = ref(false)

>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
function openModal(index) {
  selectedIndex.value = index
  modalVisible.value = true
  document.body.style.overflow = 'hidden'
}

function onModalClose() {
  modalVisible.value = false
  selectedIndex.value = null
  document.body.style.overflow = ''
}

function toggleLike(index) {
<<<<<<< HEAD
  if (!newsList.value[index]) return
  newsList.value[index].likes = (newsList.value[index].likes ?? 0) + 1
}

function share(index) {
  const n = newsList.value[index]
  if (!n) return
  navigator.clipboard.writeText(
    window.location.origin + '/news/' + encodeURIComponent(n.title || '')
  )
=======
  newsList.value[index].likes++
}

function share(index) {
  navigator.clipboard.writeText(window.location.origin + '/news/' + encodeURIComponent(newsList.value[index].title))
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
}

function addReaction(index, emoji) {
  const n = newsList.value[index]
<<<<<<< HEAD
  if (!n) return
  n.reactions = n.reactions || {}
=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
  n.reactions[emoji] = (n.reactions[emoji] || 0) + 1
}

function onModalUpdate({ index, updatedNews }) {
<<<<<<< HEAD
  if (typeof index === 'number' && newsList.value[index]) {
    newsList.value[index] = {
      ...newsList.value[index],
      ...updatedNews
    }
  } else if (updatedNews?.id) {
    const idx = newsList.value.findIndex(x => x.id === updatedNews.id)
    if (idx !== -1)
      newsList.value[idx] = {
        ...newsList.value[idx],
        ...updatedNews
      }
  }
=======
  newsList.value[index] = { ...updatedNews }
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
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
