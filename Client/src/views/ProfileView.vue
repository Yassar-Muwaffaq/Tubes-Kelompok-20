<script setup>
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
    <div class="relative bg-white rounded-2xl w-11/12 max-w-md shadow-md border border-gray-100 overflow-visible p-6">


      <img
        src="/images/vector/kucingsetengah.PNG"
        class="absolute -top-16 left-1/2 -translate-x-1/2 w-30 z-10"
      />

      <div class="text-center py-6 border-b border-gray-200 mb-6">
        <h1 class="text-3xl font-extrabold text-gray-900">User Profile</h1>
      </div>



      <!-- VIEW MODE -->
      <div v-if="!isEditing" class="mt-20 space-y-4 px-6 pb-10">

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">Name</p>
    <p class="text-gray-800">{{ name }}</p>
  </div>

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">Date of Birth</p>
    <p class="text-gray-800">{{ date_of_birth }}</p>
  </div>

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">NIK</p>
    <p class="text-gray-800">{{ nik }}</p>
  </div>

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">Shelter</p>
    <p class="text-gray-800">{{ shelter }}</p>
  </div>

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">Email</p>
    <p class="text-gray-800">{{ email }}</p>
  </div>

  <div class="bg-white border border-gray-200 rounded-lg px-4 py-3 shadow-sm">
    <p class="text-sm text-gray-500 font-semibold">No HP</p>
    <p class="text-gray-800">{{ phone }}</p>
  </div>

  <button
    @click="startEdit"
    class="w-full mt-4 bg-[#ED8B3C] text-white py-3 rounded-lg font-semibold hover:bg-gray-700 transition-all"
  >
    Edit Profile
  </button>

</div>


      <!-- EDIT MODE -->
<div v-else class="mt-20 space-y-5 px-6 pb-10">

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">Name</label>
    <input
      v-model="name"
      type="text"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">Date of Birth</label>
    <input
      type="date"
      v-model="date_of_birth"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">NIK</label>
    <input
      v-model="nik"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">Shelter</label>
    <input
      v-model="shelter"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
    <input
      v-model="email"
      type="email"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">No HP</label>
    <input
      v-model="phone"
      type="tel"
      class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#ED8B3C]"
    />
  </div>

  <div class="flex gap-4 pt-4">
    <button
      @click="saveProfile"
      class="w-1/2 bg-[#ED8B3C] text-white py-2 rounded-lg font-semibold hover:bg-gray-700 transition-all"
    >
      Save
    </button>

    <button
      @click="cancelEdit"
      class="w-1/2 bg-gray-400 text-white py-2 rounded-lg font-semibold hover:bg-gray-500 transition-all"
    >
      Cancel
    </button>
  </div>
</div>

    </div>
  </div>
</template>

