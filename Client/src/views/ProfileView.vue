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
        >
          Edit Profile
        </button>
      </div>

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
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

