<template>
  <main class="min-h-screen bg-[#f7f1e8] p-4 sm:p-8 relative overflow-hidden">
    <div v-for="i in 10" :key="i" :style="fishboneStyle(i)">
      <img
        src="https://assets.website-files.com/5f793e25d2b7c02b376d5423/5f793e25d2b7c050076d542e_fishbone.svg"
        alt="Fishbone Decoration"
        class="w-10 h-10 opacity-40 rotate-[var(--r)]"
        style="--r: 0deg"
      />
    </div>

    <div class="max-w-4xl mx-auto z-10 relative">
      <div class="text-center mb-8 pt-10">
        <h1 class="text-4xl sm:text-5xl font-extrabold text-[#3a2f1c] pt-20">Report & Rescue</h1>
        <h2 class="text-3xl sm:text-4xl font-extrabold text-[#3a2f1c]">Kitten</h2>
      </div>

      <form
        @submit.prevent="submitReport"
        class="bg-[#f7e9c8] p-6 sm:p-10 rounded-3xl shadow-2xl space-y-6"
      >
        <div
          class="bg-[#e8dcb2] p-6 rounded-xl text-center shadow-inner border border-[#f7e9c8]"
        >
          <label for="photos" class="cursor-pointer">
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
            <p class="text-[#3a2f1c] font-semibold mt-2">Upload Photos</p>
          </label>
          <input
            type="file"
            id="photos"
            @change="handleFileUpload"
            multiple
            class="hidden"
            accept="image/*"
          />
        </div>

        <!-- Input fields -->
        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Name</span>
          <input
            v-model="form.name"
            type="text"
            placeholder="Nama Kucing (jika tahu)"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
            required
          />
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Age</span>
          <input
            v-model="form.age"
            type="text"
            placeholder="Estimasi Umur"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
            required
          />
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Gender</span>
          <select
            v-model="form.gender"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
          >
            <option value="" disabled>Pilih Jenis Kelamin</option>
            <option value="Jantan">Jantan</option>
            <option value="Betina">Betina</option>
            <option value="Tidak Tahu">Tidak Tahu</option>
          </select>
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Breeds</span>
          <input
            v-model="form.breeds"
            type="text"
            placeholder="Ras (Domestik/Persia/dll.)"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
          />
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Reporter's contact</span>
          <input
            v-model="form.reporterContact"
            type="tel"
            placeholder="Nomor Telepon/Email"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
            required
          />
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Last Location</span>
          <input
            v-model="form.lastLocation"
            type="text"
            placeholder="Alamat/Deskripsi Lokasi"
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all mb-4"
            required
          />
          <div class="h-40 bg-gray-300 rounded-lg overflow-hidden shadow-md flex items-center justify-center">
            <p class="p-4 text-sm text-gray-600 text-center">
              Placeholder Peta - Integrasi Map API akan dilakukan di sini
            </p>
          </div>
        </label>

        <label class="block">
          <span class="text-[#3a2f1c] font-semibold">Description</span>
          <textarea
            v-model="form.description"
            rows="4"
            placeholder="Jelaskan kondisi kucing, ciri-ciri khusus, dan perilaku."
            class="w-full mt-2 p-3 text-[#3a2f1c] bg-white/80 border-none rounded-md shadow-sm 
                   focus:ring-[#d4b97d] focus:border-[#d4b97d] placeholder-gray-500 transition-all"
            required
          ></textarea>
        </label>

        <button
          type="submit"
          class="w-full py-3 text-lg font-bold text-white rounded-lg shadow-lg transition-all duration-300 bg-[#f76c5b] hover:bg-[#e65c4b] transform hover:scale-[1.01]"
        >
          Make a report
        </button>
      </form>
    </div>

    <div class="fixed bottom-0 right-0 z-50">
      <img
        src="/images/report-rescue/sherlock-cat.png"
        alt="Kucing Sherlock"
        class="w-56 h-auto object-cover"
      />
    </div>
  </main>
</template>

<script setup>
import { ref } from 'vue';

const form = ref({
  photos: [],
  name: '',
  age: '',
  gender: '',
  breeds: '',
  reporterContact: '',
  lastLocation: '',
  description: '',
});

const handleFileUpload = (event) => {
  form.value.photos = Array.from(event.target.files);
  console.log('Files uploaded:', form.value.photos.map((f) => f.name));
};

const submitReport = () => {
  console.log('Report Submitted:', form.value);
  alert(`Laporan tentang ${form.value.name || 'kucing tak bernama'} telah dibuat!`);
};

const fishboneStyle = (index) => {
  const positions = [
    { top: '5%', left: '5%', rotate: 45 },
    { top: '15%', right: '10%', rotate: -30 },
    { bottom: '20%', left: '15%', rotate: 120 },
    { bottom: '5%', right: '5%', rotate: -90 },
    { top: '30%', left: '40%', rotate: 60 },
    { top: '50%', right: '3%', rotate: 15 },
    { bottom: '40%', left: '3%', rotate: -135 },
    { top: '75%', left: '25%', rotate: 90 },
    { bottom: '10%', right: '35%', rotate: 0 },
    { top: '5%', left: '70%', rotate: 180 },
  ];
  const style = positions[index % 10];
  return {
    position: 'absolute',
    top: style.top,
    left: style.left || 'auto',
    right: style.right || 'auto',
    bottom: style.bottom || 'auto',
    '--r': `${style.rotate}deg`,
    zIndex: 0,
  };
};
</script>
