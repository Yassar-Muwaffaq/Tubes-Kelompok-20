<template>
  <!-- BAGIAN 6 CONTACT US -->
  <section class="contact-section">
    <h2>Contact Us</h2>
    <p>
      For more information about our adoption program, donations, or collaborations, 
      please contact our team through the available contact details or send us a message below.
    </p>

    <div class="contact-container">
      <div class="contact-card">
        <i class="fa-solid fa-house"></i>
        <h3>Location</h3>
        <p>Street Bandung</p>
      </div>

      <div class="contact-card">
        <i class="fa-brands fa-instagram"></i>
        <h3>Instagram</h3>
        <p>@adopeCenter.co</p>
      </div>

      <div class="contact-card">
        <i class="fa-brands fa-whatsapp"></i>
        <h3>What’s App</h3>
        <p>+628099999999</p>
      </div>

      <div class="contact-card">
        <i class="fa-solid fa-envelope"></i>
        <h3>Email</h3>
        <p>@adope.center.co</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "ContactUs"
}
</script>

<style scoped>
/* ===========
   BAGIAN 6 CONTACT US
   =========== */
.contact-section {
  background-color: #6CD4FF;
  text-align: center;
  padding: 60px 20px;
}

.contact-section h2 {
  font-size: 30px;
  font-weight: bold;
  margin-bottom: 10px;
}

.contact-section p {
  max-width: 700px;
  margin: 0 auto 40px auto;
  line-height: 1.6;
  font-size: 16px;
}

.contact-container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 25px;
}

.contact-card {
  background-color: #FFBA6B;
  width: 160px;
  border-radius: 10px;
  padding: 20px 10px;
  box-shadow: 0 4px 4px rgba(0,0,0,0.1);
  transition: transform 0.2s, box-shadow 0.2s;
}

.contact-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 10px rgba(0,0,0,0.2);
}

.contact-card i {
  font-size: 35px;
  margin-bottom: 10px;
  color: #000;
}

.contact-card h3 {
  margin-bottom: 5px;
  font-size: 18px;
}

.contact-card p {
  margin: 0;
  font-size: 14px;
}
</style>
