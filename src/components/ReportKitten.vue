<template>
<section class="relative flex items-center justify-center overflow-visible min-h-screen">
  <img 
    src="/images/vector/Background Report.png"
    alt="Background report"
    class="absolute inset-0 w-full h-full object-cover pointer-events-none"
  />
  <!-- isi konten di sini -->

    <!-- Kucing kiri kanan -->
    <img
      src="/images/header/kucing_kiri_report.png"
      alt="Kucing kiri"
      class="md:block max-md:h-[50%] max-sm:h-[30%] max-sm:top-30 absolute left-0 top-20 h-[70%] object-contain pointer-events-none"
    />
    <img
      src="/images/header/kucing_kanan_report.png"
      alt="Kucing kanan"
      class="md:block max-md:h-[50%] max-sm:h-[30%] max-sm:top-60 absolute right-0 top-20 h-[70%] object-contain pointer-events-none "
    />

    <!-- Konten utama -->
    <div class="relative text-center flex flex-col items-center justify-center space-y-6
    border-2 border-solid">
      <h1 class="text-3xl lg:text-5xl font-bold text-black drop-shadow-lg
      max-sm:text-lg! max-sm:bottom-20 border-2 border-solid">
        Find Missing Kitten?
      </h1>

      <img
        src="/images/header/kucing-report-button.png"
        alt="Kucing tombol"
        class="w-36 sm:w-44 lg:w-52 mx-auto absolute top-[37%] 
        max-sm:w-28 max-sm:top-[52.5%]"
      />

      <div class="relative inline-flex items-center mt-30">
        <img
          src="/images/vector/Vector.svg"
          alt="Magnifying glass"
          class="absolute left-0 -ml-10 top-1/2 -translate-y-1/2 w-15 sm:w-10 max-sm:w-9"
        />
        <button
          class="bg-red-600 hover:bg-red-700
          text-black font-semibold
          rounded-xl!
          max-sm:px-6 max-sm:py-2! max-sm:text-base!
          px-10 sm:px-12 py-3 sm:py-4 text-lg sm:text-xl flex items-center gap-2 transition-transform hover:-translate-x-0.5"
        >
          REPORT
        </button>
      </div>
    </div>
  </section>
</template>

<script setup>
// Tidak perlu JS untuk bagian ini
</script>

<style scoped></style>
