<script setup>
import { ref, onMounted } from 'vue'

// data profil
const user = ref({
  name: '',
  username: '',
  dob: '',
  nik: '',
  selter: '',
  email: '',
  phone: ''
})

// mode edit
const isEditing = ref(false)
const tempUser = ref({})

// ambil data user dari localStorage atau pakai default
onMounted(() => {
  const stored = localStorage.getItem('user')
  if (stored) {
    user.value = JSON.parse(stored)
  } else {
    user.value = {
      name: 'Ervina Kusnanda',
      username: 'ERVII',
      dob: '12/12/2000',
      nik: '3217090000000001',
      selter: 'Volunteer',
      email: 'ervinaanakbaik@gmail.com',
      phone: '08220000118'
    }
    localStorage.setItem('user', JSON.stringify(user.value))
  }
})

// aktifkan mode edit
function startEdit() {
  tempUser.value = { ...user.value } // salin dulu
  isEditing.value = true
}

// simpan perubahan
function saveProfile() {
  localStorage.setItem('user', JSON.stringify(user.value))
  isEditing.value = false
}

// batal ubah
function cancelEdit() {
  user.value = { ...tempUser.value }
  isEditing.value = false
}
</script>

<template>
  <div class="profile-container mt-15">
    <div class="profile-card">
      <!-- kucing -->
      <img src="/images/vector/kucingsetengah.PNG" class="cat-img" />

      <!-- header kuning -->
      <div class="profile-header">
        <h1 class="title">User Profile</h1>
        <div class="profile-pic">
          <img src="/images/vector/gabriel.svg" />
          <p class="caption">Profile Picture</p>
        </div>
      </div>

      <!-- tampilan normal -->
      <div class="info" v-if="!isEditing">
        <div class="info-item"><strong>Name</strong><span>{{ user.name }}</span></div>
        <div class="info-item"><strong>Username</strong><span>{{ user.username }}</span></div>
        <div class="info-item"><strong>Date of Birth</strong><span>{{ user.dob }}</span></div>
        <div class="info-item"><strong>NIK</strong><span>{{ user.nik }}</span></div>
        <div class="info-item"><strong>Selter</strong><span>{{ user.selter }}</span></div>
        <div class="info-item"><strong>Email</strong><span>{{ user.email }}</span></div>
        <div class="info-item"><strong>No HP</strong><span>{{ user.phone }}</span></div>

        <button
          class="mt-6 px-5 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
          @click="startEdit"
        >
          Edit Profile
        </button>
      </div>

      <!-- mode edit -->
      <div class="info" v-else>
        <div class="info-item"><strong>Name</strong><input v-model="user.name" /></div>
        <div class="info-item"><strong>Username</strong><input v-model="user.username" /></div>
        <div class="info-item"><strong>Date of Birth</strong><input v-model="user.dob" /></div>
        <div class="info-item"><strong>NIK</strong><input v-model="user.nik" /></div>
        <div class="info-item"><strong>Selter</strong><input v-model="user.selter" /></div>
        <div class="info-item"><strong>Email</strong><input v-model="user.email" /></div>
        <div class="info-item"><strong>No HP</strong><input v-model="user.phone" /></div>

        <div class="flex gap-3 mt-6">
          <button
            class="px-5 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition"
            @click="saveProfile"
          >
            Save
          </button>
          <button
            class="px-5 py-2 bg-gray-400 text-white rounded-lg hover:bg-gray-500 transition"
            @click="cancelEdit"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.profile-container {
  background-color: #f7f1e8;
  min-height: 100vh;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: column;
  padding-top: 60px;
}

.profile-card {
  position: relative;
  background-color: #fef5dd;
  border-radius: 25px;
  width: 90%;
  max-width: 420px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  overflow: visible;
}

.cat-img {
  position: absolute;
  top: -60px;
  left: 50%;
  transform: translateX(-50%);
  width: 120px;
  z-index: 10;
}

.profile-header {
  background-color: #ED8B3C ;
  border-top-left-radius: 25px;
  border-top-right-radius: 25px;
  text-align: center;
  padding: 60px 20px 60px;
  position: relative;
  z-index: 1;
}

.title {
  font-size: 28px;
  font-weight: bold;
  color: #1c1c1c;
  margin-bottom: 60px;
}

.profile-pic {
  position: absolute;
  bottom: -60px;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  z-index: 5;
}

.profile-pic img {
  width: 110px;
  height: 110px;
  border-radius: 50%;
  border: 5px solid #fef5dd;
  object-fit: cover;
}

.caption {
  margin-top: 8px;
  font-size: 14px;
  color: #555;
}

.info {
  margin-top: 80px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 0 25px 30px;
}

.info-item {
  display: flex;
  justify-content: space-between;
  background: #fff8ee;
  padding: 10px 14px;
  border-radius: 10px;
  font-size: 15px;
  color: #444;
}

.info-item input {
  border: none;
  background: transparent;
  border-bottom: 1px solid #ccc;
  outline: none;
  text-align: right;
  font-size: 15px;
  color: #444;
  width: 60%;
}
</style>
