<template>
  <div
    v-if="visible"
<<<<<<< HEAD
    class="fixed inset-0 bg-black/60 flex justify-center items-center z-50"
    @click.self="closePopup"
  >
    <div class="bg-white w-full max-w-5xl h-[80vh] rounded-2xl overflow-hidden flex flex-col md:flex-row">

      <!-- LEFT IMAGE -->
      <div class="md:w-1/2 bg-black flex items-center justify-center">
        <img :src="news.image" class="object-contain max-h-full max-w-full" />
      </div>

      <!-- RIGHT SIDE -->
      <div class="md:w-1/2 flex flex-col">

        <!-- HEADER -->
        <div class="flex justify-between items-center p-4 border-b">
          <h2 class="font-semibold text-lg">{{ news.title }}</h2>
          <button @click="closePopup" class="text-gray-600 hover:text-black">✖</button>
        </div>

        <!-- DESC -->
        <div class="p-4 text-gray-700 border-b">
          {{ news.desc }}
        </div>

        <!-- COMMENT LIST -->
        <div class="flex-1 overflow-y-auto p-4 space-y-3">
          <div
            v-for="c in localComments"
            :key="c.id"
            class="border border-gray-200 rounded-md px-3 py-2 flex justify-between"
          >
            <div>
              <p class="font-semibold">{{ c.user ?? "User" }}</p>
              <p>{{ c.comment }}</p>
              <p class="text-xs text-gray-400">{{ formatTime(c.created_at) }}</p>

              <button
                @click="toggleLike(c)"
                class="text-sm mt-1 hover:underline"
              >
                👍 {{ c.likes }}
              </button>
            </div>

            <button
              v-if="c.user_id === userId"
              @click="deleteComment(c)"
              class="text-red-500 text-sm hover:underline"
            >
              Delete
            </button>
          </div>

          <p v-if="localComments.length === 0" class="text-gray-400 text-sm">
            Belum ada komentar.
          </p>
        </div>

        <!-- INPUT -->
        <div class="border-t p-3 flex">
          <input
            v-model="newComment"
            @keyup.enter="addComment"
            placeholder="Tulis komentar..."
            class="flex-1 border rounded-l-md px-3 py-1 text-sm"
          />
          <button
            @click="addComment"
            class="bg-blue-600 text-white px-3 py-1 rounded-r-md text-sm"
=======
    class="fixed inset-0 bg-black/60 flex justify-center items-center z-50 animate-fadeIn"
    @click.self="emitClose"
  >
    <div
      class="bg-white w-full max-w-5xl h-[80vh] rounded-2xl overflow-hidden flex flex-col md:flex-row animate-slideUp"
    >
      <!-- Kiri: Gambar -->
      <div class="md:w-1/2 bg-black flex items-center justify-center">
        <img
          :src="news.image"
          alt="news"
          class="object-contain max-h-full max-w-full"
        />
      </div>

      <!-- Kanan: Detail + Komentar -->
      <div class="md:w-1/2 flex flex-col">
        <!-- Header -->
        <div class="flex justify-between items-center p-4 border-b border-gray-200">
          <h2 class="font-semibold text-gray-800 text-lg">{{ news.title }}</h2>
          <button @click="emitClose" class="text-gray-500 hover:text-gray-800">✖</button>
        </div>

        <!-- Deskripsi -->
        <div class="p-4 text-gray-700 text-sm border-b border-gray-200">
          {{ news.desc }}
        </div>

        <!-- Komentar -->
        <div class="flex-1 overflow-y-auto p-4 space-y-3">
          <div
            v-for="(comment, i) in news.comments"
            :key="i"
            class="flex justify-between items-center bg-gray-50 rounded-md px-3 py-2"
          >
            <div>
              <span class="font-semibold">{{ comment.user }}</span>
              <span class="ml-2 text-gray-700">{{ comment.text }}</span>
            </div>
            <button @click="toggleCommentLike(comment)" class="text-sm">
              ❤️ {{ comment.likes }}
            </button>
          </div>
        </div>

        <!-- Input Komentar -->
        <div class="border-t border-gray-200 p-3 flex">
          <input
            v-model="news.newComment"
            @keyup.enter="addComment"
            placeholder="Tulis komentar..."
            class="flex-1 border border-gray-300 rounded-l-md px-3 py-1 text-sm focus:outline-none"
          />
          <button
            @click="addComment"
            class="bg-blue-500 text-white px-3 py-1 rounded-r-md hover:bg-blue-600 text-sm"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          >
            Kirim
          </button>
        </div>
<<<<<<< HEAD

=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
      </div>
    </div>
  </div>
</template>

<script setup>
<<<<<<< HEAD
import { ref, watch } from "vue"
import { NewsApi } from "@/api/newsApi.js"
=======
import { defineProps, defineEmits } from "vue"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332

const props = defineProps({
  visible: Boolean,
  news: Object,
<<<<<<< HEAD
  userId: { type: Number, default: 1 } // anggap user id = 1
=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
})

const emit = defineEmits(["close", "update-news"])

<<<<<<< HEAD
const newComment = ref("")
const localComments = ref([])

watch(
  () => props.news,
  (v) => {
    if (v?.comments) localComments.value = JSON.parse(JSON.stringify(v.comments))
  },
  { immediate: true }
)

const closePopup = () => emit("close")

// Format tanggal
const formatTime = (t) => new Date(t).toLocaleString()

// ADD COMMENT
const addComment = async () => {
  if (!newComment.value.trim()) return

  const payload = {
    user_id: props.userId,
    comment: newComment.value
  }

  const res = await NewsApi.addComment(props.news.id, payload)

  const newC = {
    id: res.data.id,
    news_id: props.news.id,
    user: "You",
    user_id: props.userId,
    comment: payload.comment,
    likes: 0,
    created_at: new Date().toISOString()
  }

  localComments.value.push(newC)

  emit("update-news", {
    ...props.news,
    comments: localComments.value
  })

  newComment.value = ""
}

// LIKE / UNLIKE
const toggleLike = async (comment) => {
  if (!comment._liked) {
    comment.likes++
    comment._liked = true
    await NewsApi.likeComment(comment.id)
  } else {
    if (comment.likes > 0) comment.likes--
    comment._liked = false
    await NewsApi.unlikeComment(comment.id)
  }

  emit("update-news", {
    ...props.news,
    comments: localComments.value
  })
}

// DELETE COMMENT
const deleteComment = async (comment) => {
  await NewsApi.deleteComment(comment.id)

  localComments.value = localComments.value.filter((c) => c.id !== comment.id)

  emit("update-news", {
    ...props.news,
    comments: localComments.value
  })
}
</script>
=======
// Tutup modal
const emitClose = () => emit("close")

// Tambah komentar
const addComment = () => {
  if (props.news && props.news.newComment?.trim() !== "") {
    props.news.comments.push({
      user: "Kamu",
      text: props.news.newComment,
      likes: 0,
    })
    props.news.newComment = ""
    emit("update-news", props.news)
  }
}

// Like komentar
const toggleCommentLike = (comment) => {
  comment.likes += 1
  emit("update-news", props.news)
}
</script>

<style scoped>
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes slideUp {
  from {
    transform: translateY(40px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
.animate-fadeIn {
  animation: fadeIn 0.3s ease forwards;
}
.animate-slideUp {
  animation: slideUp 0.3s ease forwards;
}

::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-thumb {
  background: #ccc;
  border-radius: 3px;
}
</style>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
