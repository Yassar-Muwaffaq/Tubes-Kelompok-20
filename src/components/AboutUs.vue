
<template>
  <!-- HERO SECTION -->
  <section class="about-hero">
    <div class="hero-text">
      <h1>About <span>Adopt Center</span></h1>
      <p>We’re a community of animal lovers dedicated to helping stray cats find safe and loving homes.</p>
      <button class="btn">Join Our Mission</button>
    </div>
    <!-- <img src="/images/header/kucing.jpg" alt="cat" class="hero-cat"> -->
  </section>

  <!-- MISSION AND VISION -->
  <section class="mission-vision">
    <div class="mv-card">
      <span class="icon">🐾</span>
      <h3>Our Mission</h3>
      <p>To rescue, rehabilitate, and rehome stray cats through love and collaboration.</p>
    </div>
    <div class="mv-card">
      <span class="icon">💙</span>
      <h3>Our Vision</h3>
      <p>A world where every cat has a loving and safe place to call home.</p>
    </div>
  </section>

  <!-- OUR STORY -->
  <section class="story">
    <div class="story-text">
      <h2>Our Story</h2>
      <p>Adopt Center was founded by a group of volunteers who were concerned about the increasing number of stray cats in their neighborhood. We decided to build a platform to connect rescuers, adopters, and donors in one caring community.</p>
    </div>
    <!-- <img src="/images/about/doker-kucing.png" class="story-img"> -->
  </section>

  <!-- VALUES -->
  <section class="values">
    <div class="value-card">
      <span class="icon">🐾</span>
      <h4>Rescue</h4>
      <p>We help save cats from unsafe environments.</p>
    </div>
    <div class="value-card">
      <span class="icon">➕</span>
      <h4>Medical Care</h4>
      <p>Provide health check and vaccination.</p>
    </div>
    <div class="value-card">
      <span class="icon">🏠</span>
      <h4>Foster & Adopt</h4>
      <p>Connect cats with loving adopters.</p>
    </div>
    <div class="value-card">
      <span class="icon">📢</span>
      <h4>Awareness</h4>
      <p>Educate the community to care for stray cats.</p>
    </div>
  </section>

  <!-- TEAM SECTION -->
  <section class="team">
    <h2>Meet Our Team</h2>
    <p>The people behind Adopt Center — passionate animal lovers working to make every cat’s life better.</p>

    <div class="team-list">
      <div class="team-card">
        <!-- <img src="/images/about/jefri.jpg"> -->
        <h4>Jeff</h4>
        <p>Voluteer</p>
      </div>
      <div class="team-card">
        <!-- <img src="/images/about/davina.jpg"> -->
        <h4>Davina</h4>
        <p>Mediss</p>
      </div>
      <div class="team-card">
        <!-- <img src="/images/about/yesaya.jpg"> -->
        <h4>Yesaya</h4>
        <p>Project Manager</p>
      </div>
      <div class="team-card">
        <!-- <img src="/images/about/gabriel.jpg"> -->
        <h4>Gabriel</h4>
        <p>Volunteer Coordinator</p>
      </div>
    </div>

    <p class="team-footer">We may be small, but our hearts are big for cats! 🧡</p>
  </section>

</template>

<style scoped>
body {
  margin: 0;
  font-family: "Poppins", sans-serif;
  background: #FFF6ED;
  color: #333;
}

/* HERO */
.about-hero {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 80px 10%;
}

.hero-text h1 span { color: #d58f15; }

.btn {
  background: #d58f15;;
  border: none;
  padding: 10px 20px;
  color: white;
  border-radius: 8px;
  cursor: pointer;
  margin-top: 20px;
}

.hero-cat {
  width: 260px;
}

/* MISSION & VISION */
.mission-vision {
  display: flex;
  gap: 20px;
  padding: 40px 10%;
}

.mv-card {
  background: #3ad8f7;
  padding: 25px;
  border-radius: 16px;
  flex: 1;
}

/* STORY */
.story {
  display: flex;
  align-items: center;
  padding: 60px 10%;
}

.story-img {
  width: 300px;
  border-radius: 12px;
  margin-left: 30px;
}

/* VALUES */
.values {
  display: flex;
  justify-content: space-between;
  padding: 40px 10%;
}

.value-card {
  text-align: center;
  width: 22%;
}

/* TEAM */
.team {
  text-align: center;
  padding: 80px 10%;
  background: #3ad8f7;
  border-top-left-radius: 80px;
  border-top-right-radius: 80px;
}

.team-list {
  display: flex;
  justify-content: space-between;
  margin-top: 40px;
}

.team-card img {
  width: 200px;
  height: 200px;
  border-radius: 50%;     
  object-fit: cover;      
  display: block;
  margin: 0 auto;
  box-shadow: 0px 4px 12px rgba(0,0,0,0.3);
}
</style>
