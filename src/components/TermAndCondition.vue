<template>
  <section class="min-h-screen bg-gradient-to-b from-gray-50 to-white py-20 px-6">
    <div class="max-w-4xl mx-auto">
      <!-- Header -->
      <div class="text-center mb-12">
        <h3 class="text-4xl font-extrabold text-gray-900 mb-4">
          Terms and Conditions
        </h3>
        <p class="text-gray-600 text-base max-w-2xl mx-auto">
          Mohon baca dan pahami syarat serta ketentuan berikut sebelum melanjutkan proses adopsi.
        </p>
        <div class="w-240 h-[2px] bg-gray-300 mx-auto mt-6"></div>
      </div>

      <!-- Content Box -->
      <div class="bg-white shadow-lg shadow-gray-100/60 rounded-2xl p-10 border border-gray-100">
        <ol class="list-decimal pl-6 space-y-5 text-gray-700 leading-relaxed text-base">
          <li>Berusia minimal <strong>18 tahun</strong> atau memiliki izin dari orang tua/wali.</li>
          <li>Bersedia memberikan identitas yang valid (<strong>KTP/KK</strong>).</li>
          <li>Bertempat tinggal di lingkungan/perumahan yang mengizinkan memelihara hewan.</li>
          <li>Bersedia merawat kucing dengan kasih sayang dan tanggung jawab.</li>
          <li>Menyediakan makanan bergizi, air bersih, dan lingkungan yang aman.</li>
          <li>Memberikan waktu untuk bermain dan berinteraksi dengan kucing.</li>
          <li>Tidak mengurung kucing di dalam kandang terus-menerus.</li>
          <li>Dilarang menjual kembali atau memperdagangkan kucing yang diadopsi.</li>
          <li>Tidak menggunakan kucing untuk percobaan berbahaya atau kompetisi.</li>
          <li>Dilarang menelantarkan, menyakiti, atau melepaskan kucing tanpa izin.</li>
          <li>Adopter bersedia dikunjungi atau diperiksa oleh pihak pengadopsi kapan saja.</li>
          <li>Jika adopter tidak mampu lagi merawat kucing, maka wajib mengembalikannya.</li>
          <li>
            Dengan menandatangani perjanjian adopsi ini, calon adopter setuju dan bersedia
            menaati seluruh ketentuan di atas.
          </li>
        </ol>

        <div class="border-t border-gray-200 mt-10 pt-6 text-sm text-gray-500 text-center">
          <p>
            Terima kasih atas komitmen Anda untuk memberikan rumah baru yang penuh kasih.
          </p>
        </div>
      </div>

      <!-- Button -->
      <button
        @click="goToAdoptForm"
        class="mt-8 w-full bg-gray-900 text-white py-3 rounded-lg font-semibold hover:bg-gray-700 transition-colors"
      >
        Setuju dan Lanjutkan ke Formulir Adopsi
      </button>
    </div>
  </section>
</template>

<script setup>
import { useRouter } from "vue-router";
const router = useRouter();

const goToAdoptForm = () => {
  router.push("/adopt-now");
};
</script>
