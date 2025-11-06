<template>
<section id="hero-area" class="relative flex flex-col-reverse lg:flex-row items-center min-h-screen overflow-hidden bg-white">
  <!-- Konten kiri -->
  <div class="w-full lg:w-1/2 flex flex-col justify-center px-6 sm:px-12 md:px-16 lg:px-24 py-12 lg:py-0 text-center lg:text-left z-10">
    <div class="header-content max-w-lg mx-auto lg:mx-0">
      <h1 class="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-800 leading-tight mb-4">
        BRING HOME THE PURRFECT FRIEND
      </h1>
      <p class="text-gray-600 text-sm sm:text-base mb-6">
        We take care of stray cats and treat them so you can adopt them safely.
      </p>
      <div class="flex flex-col sm:flex-row gap-3 sm:gap-5 justify-center lg:justify-start">
        <a href="/adoption"
           class="px-6 py-3 bg-orange-500 text-white font-semibold rounded-lg hover:bg-orange-600 transition-all shadow-md">
          Adopt
        </a>
        <a href="javascript:void(0)"
           class="text-orange-500 font-medium underline hover:text-orange-600">
          Join our community
        </a>
      </div>
    </div>
  </div>

  <!-- Gambar kanan -->
  <div class="w-full lg:w-1/2 flex justify-center lg:justify-end m-0 p-0">
    <img
      src="/images/header/Vector.png"
      alt="Cat"
      class="hero-cat-image w-full lg:w-auto lg:h-screen object-contain lg:object-cover m-0 p-0"
    />
  </div>
</section>


  <AdoptSlider />
  <ReportKitten />
  <NewsSection />
  <FAQ />
  <AboutUs />
  <ContactUs />
</template>

<script setup>
  // 1. Import komponen slider-nya
  import AdoptSlider from '@/components/AdoptSlider.vue' 
import NewsSection from '@/components/NewsSection.vue';
import ReportKitten from '@/components/ReportKitten.vue';
import FAQ from '@/components/FAQ.vue';
import ContactUs from '@/components/ContactUs.vue';
import AboutUs from '@/components/AboutUs.vue';
  // (@ adalah shortcut untuk folder 'src')
</script>


<style scoped>
  /* CSS UNTUK HERO (JANGAN DIHAPUS) */
  .header-eight .primary-btn {
    background: var(--primary);
    color: var(--white);  
    box-shadow: var(--shadow-2);
  }
  .header-eight .active.primary-btn, .header-eight .primary-btn:hover, .header-eight .primary-btn:focus {
    background: var(--primary-dark);
    color: var(--white);
    box-shadow: var(--shadow-4);
  }
  .header-eight .deactive.primary-btn {
    background: var(--gray-4);
    color: var(--dark-3);
    pointer-events: none;
  }

  .header-eight {
    position: relative;
    padding:0 0 0 0;
    background-color: #f7f1e8; 
    overflow: hidden; 
  }

  @media only screen and (min-width: 768px) and (max-width: 991px) {
    .header-eight {
      padding: 130px 0 80px 0;
    }
  }
  @media (max-width: 767px) {
    .header-eight {
      padding: 100px 0 60px 0;
    }
  }
  .header-eight .header-image-wrapper {
    position: relative; 
    z-index: 1;
  }

  .header-eight .header-image-wrapper::before {
    content: '';
    position: absolute;
    z-index: -1; 
    
    /* Pastikan path ini benar */
    /* background-image: url('/images/vector/Background Report.png');  */
    background-repeat: no-repeat;
    background-position: center;
    background-size: contain;

    width: 150%; 
    height: 150%;
    top: -25%; 
    left: -25%; 
  }

  .header-eight .hero-cat-image {
    width: 100%;
    position: relative; 
    /* right: -10px; */
    z-index: 2; 
  }
  .header-eight .header-content {
    border-radius: 0;
    position: relative;
    z-index: 1;
    text-align: left;
  }
  .header-eight .header-content h1 {
    font-weight: 700;
    color: var(--black); 
    text-shadow: none; 
    text-transform: uppercase; 
    font-size: 3.5rem; 
    line-height: 1.2; 
  }
  @media only screen and (min-width: 768px) and (max-width: 991px) {
    .header-eight .header-content h1  {
      font-size: 35px;
      line-height: 45px;
    }
  }
  @media (max-width: 767px) {
    .header-eight .header-content h1  {
      font-size: 30px;
      line-height: 42px;
    }
  }
  .header-eight .header-content h1 span {
    display: block;
  }
  .header-eight .header-content p {
    margin-top: 30px;
    color: var(--dark-3); 
    opacity: 1; 
    font-size: 1.2rem; 
    max-width: 400px; 
  }
  .header-eight .button {
    margin-top: 40px;
  }
  .header-eight .primary-btn {
    margin-right: 25px; 
    background-color: #FFC900; 
    color: var(--black); 
    border: 1px solid transparent;
    font-weight: 700; 
    padding: 15px 30px; 
  }
  .header-eight .primary-btn:hover {
    background-color: #e6b500; 
    color: var(--black); 
    border-color: transparent; 
  }
  .header-eight .community-link {
    color: var(--dark-2); 
    font-weight: 600;
    font-size: 1rem;
    text-decoration: none; 
  }
  .header-eight .community-link:hover {
    color: var(--black); 
  }
</style>