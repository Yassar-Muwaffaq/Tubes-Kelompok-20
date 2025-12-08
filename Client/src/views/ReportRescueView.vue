<template>
  <main class="min-h-screen bg-[#f7f1e8] p-4 sm:p-8 relative overflow-hidden">
    <div class="max-w-4xl mx-auto z-10 relative">
      <!-- Judul -->
      <div class="text-center mb-8 pt-10">
        <h1 class="text-4xl sm:text-5xl font-extrabold text-[#2a2a2a] pt-20">Report & Rescue</h1>
        <h2 class="text-3xl sm:text-4xl font-extrabold text-[#2a2a2a]">Kitten</h2>
      </div>

      <!-- Form -->
      <form
        @submit.prevent="submitReport"
<<<<<<< HEAD
        class="bg-[#FCD34D] p-6 sm:p-10 rounded-3xl shadow-2xl space-y-6 border border-[#FFBC00]"
      >
        <!-- Upload Foto -->
      <!-- Perbaruan di bagian agar foto tertampil di form saat user add laporam -->
       <div
          class="bg-[#FFFFFF] p-6 rounded-xl text-center shadow-inner border border-[#4a4a4a]"
        >
          <!-- Jika belum upload foto -->
          <label v-if="previewImages.length === 0" for="photos" class="cursor-pointer">
=======
        class="bg-[#2a2a2a] p-6 sm:p-10 rounded-3xl shadow-2xl space-y-6 border border-[#3d3d3d]"
      >
        <!-- Upload Foto -->
        <div
          class="bg-[#3b3b3b] p-6 rounded-xl text-center shadow-inner border border-[#4a4a4a]"
        >
          <label for="photos" class="cursor-pointer">
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-10 w-10 mx-auto text-[#d4b97d]"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3 9a2 2 0 012-2h.9a2 2 0 001.6-.8l.7-1.4A2 2 0 0110 4h4a2 2 0 011.6.8l.7 1.4a2 2 0 001.6.8H19a2 2 0 012 2v8a2 2 0-01-2 2H5a2 2 0-01-2-2V9z"
              />
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"
              />
            </svg>
            <p class="text-[#e6dccb] font-semibold mt-2">Upload Photos</p>
          </label>
<<<<<<< HEAD

          <!-- Jika foto sudah diupload, tampilkan preview -->
          <div v-else class="grid grid-cols-2 gap-3 mt-3">
            <div v-for="(src, i) in previewImages" :key="i">
              <img :src="src" class="w-full h-40 object-cover rounded-lg border border-[#666]" />
            </div>
          </div>

=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            type="file"
            id="photos"
            @change="handleFileUpload"
            multiple
            class="hidden"
            accept="image/*"
          />
        </div>

<<<<<<< HEAD

        <!-- Input fields -->
        <label class="block">
          <span class="text-black font-semibold">Name</span>
=======
        <!-- Input fields -->
        <label class="block">
          <span class="text-[#e6dccb] font-semibold">Name</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            v-model="form.name"
            type="text"
            placeholder="Nama Kucing (jika tahu)"
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
            required
          />
        </label>

        <label class="block">
<<<<<<< HEAD
          <span class="text-black font-semibold">Age</span>
=======
          <span class="text-[#e6dccb] font-semibold">Age</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            v-model="form.age"
            type="text"
            placeholder="Estimasi Umur"
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
            required
          />
        </label>

        <label class="block">
<<<<<<< HEAD
          <span class="text-black font-semibold">Gender</span>
          <select
            v-model="form.gender"
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
          <span class="text-[#e6dccb] font-semibold">Gender</span>
          <select
            v-model="form.gender"
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
          >
            <option value="" disabled>Pilih Jenis Kelamin</option>
            <option value="Jantan">Jantan</option>
            <option value="Betina">Betina</option>
            <option value="Tidak Tahu">Tidak Tahu</option>
          </select>
        </label>

        <label class="block">
<<<<<<< HEAD
          <span class="text-black font-semibold">Breeds</span>
=======
          <span class="text-[#e6dccb] font-semibold">Breeds</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            v-model="form.breeds"
            type="text"
            placeholder="Ras (Domestik/Persia/dll.)"
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
          />
        </label>

        <label class="block">
<<<<<<< HEAD
          <span class="text-black font-semibold">Reporter's contact</span>
=======
          <span class="text-[#e6dccb] font-semibold">Reporter's contact</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            v-model="form.reporterContact"
            type="tel"
            placeholder="Nomor Telepon/Email"
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
            required
          />
        </label>

        <label class="block">
<<<<<<< HEAD
          <span class="text-black font-semibold">Last Location</span>
=======
          <span class="text-[#e6dccb] font-semibold">Last Location</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <input
            v-model="form.lastLocation"
            type="text"
            placeholder="Alamat/Deskripsi Lokasi"
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all mb-4"
            required
          />
         <div 
            id="map"
            class="h-60 rounded-lg overflow-hidden shadow-md"
          ></div>

        </label>

        <label class="block">
          <span class="text-black font-semibold">Description</span>
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all mb-4"
            required
          />
          <div class="h-40 bg-[#444] rounded-lg overflow-hidden shadow-md flex items-center justify-center">
            <p class="p-4 text-sm text-[#bfbfbf] text-center">
              Placeholder Peta - Integrasi Map API akan dilakukan di sini
            </p>
          </div>
        </label>

        <label class="block">
          <span class="text-[#e6dccb] font-semibold">Description</span>
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          <textarea
            v-model="form.description"
            rows="4"
            placeholder="Jelaskan kondisi kucing, ciri-ciri khusus, dan perilaku."
<<<<<<< HEAD
            class="w-full mt-2 p-3 text-black bg-[#FFFFFF] border-none rounded-md shadow-sm 
=======
            class="w-full mt-2 p-3 text-[#f1e7d0] bg-[#3b3b3b] border-none rounded-md shadow-sm 
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-[#c6bfae] transition-all"
            required
          ></textarea>
        </label>

        <!-- Tombol -->
        <button
          type="submit"
<<<<<<< HEAD
          class="w-full py-3 text-lg font-bold text-black rounded-lg shadow-lg transition-all duration-60000 bg-[#FFA500] hover:bg-[#FF8C00] transform hover:scale-[1.01]"
=======
          class="w-full py-3 text-lg font-bold text-white rounded-lg shadow-lg transition-all duration-300 bg-[#f76c5b] hover:bg-[#e65c4b] transform hover:scale-[1.01]"
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
        >
          Make a report
        </button>
      </form>
<<<<<<< HEAD

=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    </div>

    <!-- Kucing dekorasi -->
    <div class="fixed bottom-0 right-0 z-50">
      <img
        src="/images/report-rescue/sherlock-cat.png"
        alt="Kucing Sherlock"
        class="w-56 h-auto object-cover"
      />
    </div>
  </main>
</template>

<<<<<<< HEAD

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import { useRouter } from "vue-router";

const router = useRouter();
let map;
let userMarker;
let accuracyCircle;
onMounted(() => {
  // Inisialisasi map
  map = L.map("map").setView([-6.9175, 107.6191], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
  }).addTo(map);

  let userMarker = null;
  let accuracyCircle = null;

  // Real-time tracking ala Gojek
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(
      (pos) => {
        const lat = pos.coords.latitude;
        const lng = pos.coords.longitude;
        const accuracy = pos.coords.accuracy;

        if (!userMarker) {
          // Titik biru
          userMarker = L.marker([lat, lng], {
            icon: L.icon({
              iconUrl: "https://cdn-icons-png.flaticon.com/512/684/684908.png",
              iconSize: [25, 25],
            }),
          }).addTo(map);

          // Lingkaran akurasi
          accuracyCircle = L.circle([lat, lng], {
            radius: accuracy,
            color: "#1E90FF",
            fillColor: "#1E90FF",
            fillOpacity: 0.2,
          }).addTo(map);

          // Fokuskan map
          map.setView([lat, lng], 17);
        } else {
          userMarker.setLatLng([lat, lng]);
          accuracyCircle.setLatLng([lat, lng]);
          accuracyCircle.setRadius(accuracy);
        }

      },
      (err) => {
        console.error("GPS error:", err);
        alert("Izinkan akses lokasi untuk menampilkan posisi Anda.");
      },
      { enableHighAccuracy: true }
    );
  }
});



//untuk preview gambar saat user add laporan
const previewImages = ref([]);
=======
<script setup>
import { ref } from 'vue';
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332

const form = ref({
  photos: [],
  name: '',
  age: '',
  gender: '',
  breeds: '',
<<<<<<< HEAD
  reporterContact:'',
=======
  reporterContact: '',
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
  lastLocation: '',
  description: '',
});

<<<<<<< HEAD
//upload dan preview photo
const handleFileUpload = (event) => {
  const files = Array.from(event.target.files);
  form.value.photos = files;
  previewImages.value = files.map(file => URL.createObjectURL(file));
};

const submitReport = async () => {
  try {
    const formData = new FormData();

    // Upload file
    form.value.photos.forEach(file => {
      formData.append("photos", file);
    });

    formData.append("cat_name", form.value.name);
    formData.append("age", form.value.age);
    formData.append("gender", form.value.gender);
    formData.append("breeds", form.value.breeds);
    formData.append("reporterContact", form.value.reporterContact);
    formData.append("location", form.value.lastLocation);
    formData.append("description", form.value.description);
    formData.append("user_id", 1);

    await axios.post("http://localhost:5000/api/reports", formData, {
      headers: { "Content-Type": "multipart/form-data" },
    });

    alert("Laporan berhasil dikirim!");
    router.push("/");

    // RESET FORM
    form.value = {
      photos: [],
      name: '',
      age: '',
      gender: '',
      breeds: '',
      reporterContact: '',
      lastLocation: '',
      description: '',
    };

    // RESET PREVIEW FOTO
    previewImages.value = [];
    document.getElementById("photos").value = "";

  } catch (error) {
    console.error("DETAIL ERROR:", error.response?.data || error.message);
    alert("Gagal mengirim laporan!");
  }
};


=======
const handleFileUpload = (event) => {
  form.value.photos = Array.from(event.target.files);
  console.log('Files uploaded:', form.value.photos.map((f) => f.name));
};

const submitReport = () => {
  console.log('Report Submitted:', form.value);
  alert(`Laporan tentang ${form.value.name || 'kucing tak bernama'} telah dibuat!`);
};
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
</script>
