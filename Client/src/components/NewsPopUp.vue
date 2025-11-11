<template>
  <div
    v-if="visible"
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
          >
            Kirim
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from "vue"

const props = defineProps({
  visible: Boolean,
  news: Object,
})

const emit = defineEmits(["close", "update-news"])

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
