<template>
  <section id="hero-area" class="header-area header-eight">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 col-md-12 col-12">
          <div class="header-content">
            <h1>BRING HOME THE PURRFECT FRIEND</h1>
            <p>
              We take care the stray cat and treat them so you can
              adopt them safely
            </p>
            <div class="button">
              <a href="javascript:void(0)" class="btn primary-btn">Adopt</a>
              <a href="javascript:void(0)" class="community-link">Join our community</a>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-12 col-12">
          <div class="header-image-wrapper"> 
            <img src="/images/header/Cat 9.jpg" alt="Cat" class="hero-cat-image" />
          </div>
          </div>
      </div>
    </div>
  </section>
  <!-- <AdoptSlider /> -->
  <ReportKitten />
  <NewsSection />

</template>

<script setup>
  // 1. Import komponen slider-nya
  import AdoptSlider from '@/components/AdoptSlider.vue' 
import NewsSection from '@/components/NewsSection.vue';
import ReportKitten from '@/components/ReportKitten.vue';
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
    padding:160px 0 100px 0;
    background-color: transparent; 
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
    background-image: url('/images/vector/Background Report.png'); 
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
    font-size: 1.1rem;
    text-decoration: none; 
  }
  .header-eight .community-link:hover {
    color: var(--black); 
  }
</style>