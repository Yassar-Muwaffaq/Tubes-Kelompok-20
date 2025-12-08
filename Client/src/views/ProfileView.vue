<script setup>
<<<<<<< HEAD
import { ref, onMounted } from "vue";
import { useAuth } from "@/composables/useAuth";
import { AuthApi } from "@/api/authApi";

const { user, token, setAuth } = useAuth();

const isEditing = ref(false);
const tempUser = ref({});

// FORM FIELDS
const name = ref("");
const date_of_birth = ref("");
const nik = ref("");
const shelter = ref("");
const email = ref("");
const phone = ref("");

// Helpers
function formatDateForInput(sqlDate) {
  if (!sqlDate) return "";
  return sqlDate.split("T")[0];
}

function normalizeDate(dateStr) {
  if (!dateStr) return null;
  return dateStr;
}

// Handle Upload
function handleImageUpload(e) {
  const file = e.target.files[0];
  if (!file) return

}

// Load user data
onMounted(() => {
  if (!user.value) return;

  const u = user.value;

  name.value = u.name || "";
  date_of_birth.value = formatDateForInput(u.date_of_birth);
  nik.value = u.nik || "";
  shelter.value = u.shelter || "";
  email.value = u.email || "";
  phone.value = u.phone || "";

});

// Edit
function startEdit() {
  tempUser.value = {
    name: name.value,
    date_of_birth: date_of_birth.value,
    nik: nik.value,
    shelter: shelter.value,
    email: email.value,
    phone: phone.value,
  };

  isEditing.value = true;
}

// Cancel Edit
function cancelEdit() {
  const t = tempUser.value;

  name.value = t.name;
  date_of_birth.value = t.date_of_birth;
  nik.value = t.nik;
  shelter.value = t.shelter;
  email.value = t.email;
  phone.value = t.phone;

  isEditing.value = false;
}

// SAVE PROFILE
async function saveProfile() {
  try {
    const form = new FormData();

    form.append("name", name.value);
    form.append("date_of_birth", normalizeDate(date_of_birth.value));
    form.append("nik", nik.value);
    form.append("shelter", shelter.value);
    form.append("phone", phone.value);
    form.append("email", email.value);


    const res = await AuthApi.updateProfile(user.value.id, form, {
      headers: { "Content-Type": "multipart/form-data" },
    });

    setAuth(res.data.user, token.value);

    isEditing.value = false;
  } catch (err) {
    console.error("Update failed:", err);
    alert("Gagal update profile");
  }
}
</script>


<template>
  <div class="bg-[#f7f1e8] min-h-screen flex flex-col items-center pt-16">
    <div class="relative bg-[#fef5dd] rounded-[25px] w-11/12 max-w-md shadow-lg overflow-visible">

      <img
        src="/images/vector/kucingsetengah.PNG"
        class="absolute -top-16 left-1/2 -translate-x-1/2 w-30 z-10"
      />

      <div class="bg-[#ED8B3C] rounded-t-[25px] text-center py-1 px-5 pt-10 mt-5 relative z-1">
        <h1 class="text-2xl font-bold text-[#1c1c1c] mb-16">User Profile</h1>
      </div>

      <!-- VIEW MODE -->
      <div v-if="!isEditing" class="mt-20 flex flex-col gap-2 px-6 pb-7">

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Name</strong><span>{{ name }}</span>
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Date of Birth</strong><span>{{ date_of_birth }}</span>
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>NIK</strong><span>{{ nik }}</span>
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Shelter</strong><span>{{ shelter }}</span>
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Email</strong><span>{{ email }}</span>
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>No HP</strong><span>{{ phone }}</span>
        </div>

        <button
          @click="startEdit"
          class="mt-6 px-5 py-2 bg-white text-gray-800 rounded-lg hover:bg-gray-300 transition"
=======
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
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
        >
          Edit Profile
        </button>
      </div>

<<<<<<< HEAD
      <!-- EDIT MODE -->
      <div v-else class="mt-20 flex flex-col gap-2 px-6 pb-7">

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Name</strong>
          <input
            v-model="name"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Date of Birth</strong>
          <input
            type="date"
            v-model="date_of_birth"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>NIK</strong>
          <input
            v-model="nik"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Shelter</strong>
          <input
            v-model="shelter"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>Email</strong>
          <input
            v-model="email"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex justify-between bg-[#fff8ee] rounded-lg px-3 py-2 text-gray-700 text-sm">
          <strong>No HP</strong>
          <input
            v-model="phone"
            class="bg-transparent border-b border-gray-300 text-right text-sm outline-none w-3/5"
          />
        </div>

        <div class="flex gap-3 mt-6">
          <button
            @click="saveProfile"
            class="px-5 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition"
          >
            Save
          </button>

          <button
            @click="cancelEdit"
            class="px-5 py-2 bg-gray-400 text-white rounded-lg hover:bg-gray-500 transition"
=======
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
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<<<<<<< HEAD
=======
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
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
