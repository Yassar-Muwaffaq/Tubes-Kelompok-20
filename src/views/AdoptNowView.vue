<template>
  <div>
    <Navbar />

    <!-- Hero Section -->
    <section class="min-h-screen bg-gradient-to-b from-gray-50 to-white py-16 px-6">
      <div class="max-w-5xl mx-auto text-center">
        <h1 class="text-5xl font-extrabold text-gray-900 mb-6">
          Adopt Your New Furry Friend 🐾
        </h1>
        <p class="text-gray-600 max-w-2xl mx-auto mb-10">
          Temukan sahabat kucing impianmu! Isi formulir di bawah ini untuk memulai proses adopsi.
        </p>
      </div>

      <!-- Cat Description -->
      <div class="max-w-4xl mx-auto px-4 pt-12 pb-10 flex items-start space-x-6">
        <div class="mt-16 space-y-4">
          <div class="w-6 h-6 bg-gray-300 rounded-full opacity-50"></div>
          <div class="w-4 h-4 bg-gray-300 rounded-full opacity-70 ml-2"></div>
        </div>

        <div class="flex-grow">
          <h2 class="text-3xl font-extrabold text-gray-800 mb-4">{{ cat.name }}</h2>

          <div
            class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-800 p-4 mb-6 rounded-lg shadow-md flex items-start space-x-4"
          >
            <div class="flex-grow space-y-2">
              <div class="flex items-center space-x-4 text-sm font-semibold">
                <span class="flex items-center">
                  <svg
                    class="h-4 w-4 mr-1"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                    />
                  </svg>
                  {{ cat.age }}
                </span>
                <span class="flex items-center">
                  <svg
                    class="h-4 w-4 mr-1"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"
                    />
                  </svg>
                  {{ cat.breed }}
                </span>
                <span class="flex items-center">
                  <svg
                    class="h-4 w-4 mr-1"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                    />
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                  </svg>
                  {{ cat.location }}
                </span>
              </div>
              <p class="text-sm italic mt-2">{{ cat.description }}</p>
            </div>
            <img
              :src="cat.imageUrl"
              :alt="cat.name"
              class="w-32 h-32 object-cover rounded-lg shadow-lg"
            />
          </div>
        </div>
      </div>

      <!-- Adoption Form -->
      <div
        class="max-w-3xl mx-auto bg-white shadow-md rounded-2xl p-8 border border-gray-100"
      >
        <h3 class="text-2xl font-bold text-gray-900 mb-6 text-center">
          Formulir Adopsi
        </h3>

        <form @submit.prevent="handleSubmit" class="space-y-5">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Nama Lengkap</label>
            <input
              v-model="form.name"
              type="text"
              placeholder="Masukkan nama lengkapmu"
              class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input
              v-model="form.email"
              type="email"
              placeholder="example@email.com"
              class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Nomor Telepon</label>
            <input
              v-model="form.phone"
              type="tel"
              placeholder="08xxxxxxxxxx"
              class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Alamat Lengkap</label>
            <textarea
              v-model="form.address"
              rows="3"
              placeholder="Tulis alamat lengkapmu"
              class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900"
              required
            ></textarea>
          </div>

          <div class="flex items-center justify-between pt-2">
            <div class="flex items-center">
              <input
                id="agree"
                type="checkbox"
                v-model="form.agreed"
                class="h-4 w-4 text-gray-900 border-gray-300 rounded"
                required
              />
              <label for="agree" class="ml-2 text-sm text-gray-700">
                Saya telah membaca dan menyetujui
                <span
                  @click="goToTerms"
                  class="text-gray-900 font-semibold cursor-pointer hover:underline"
                >
                  Syarat & Ketentuan
                </span>.
              </label>
            </div>
          </div>

          <button
            type="submit"
            class="w-full mt-4 bg-gray-900 text-white py-3 rounded-lg font-semibold hover:bg-gray-700 transition-all"
          >
            Kirim Formulir Adopsi
          </button>
        </form>
      </div>
    </section>
  </div>
</template>

<script setup>
import Navbar from "@/components/Navbar.vue";
import { ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();

const cat = ref({
  name: "Milo",
  age: "7 Bulan",
  breed: "Persian Breeds",
  location: "Bandung",
  description:
    "Milo adalah kucing jantan berusia 7 bulan yang aktif dan sangat ramah. Dia telah diperiksa dokter hewan dan cocok untuk keluarga dengan anak-anak.",
  imageUrl: "https://i.imgur.com/Gj3Hj0c.jpg",
});

const form = ref({
  name: "",
  email: "",
  phone: "",
  address: "",
  agreed: false,
});

const goToTerms = () => router.push("/terms");

const handleSubmit = () => {
  if (!form.value.agreed) {
    alert("Harap centang persetujuan Syarat & Ketentuan terlebih dahulu.");
    return;
  }

  alert(`Formulir adopsi untuk ${cat.value.name} telah berhasil dikirim!`);
  console.log("Form Data:", form.value);
};
</script>
