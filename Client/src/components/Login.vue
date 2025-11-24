<template>
  <div class="min-h-screen flex items-center justify-center bg-[#f7f1e8] relative mt-10">
    <!-- Login Card -->
    <div
      class="relative bg-[#FCD34D] rounded-2xl shadow-lg w-[340px] sm:w-[400px] p-8 flex flex-col items-center"
    >
      <!-- Cat Image -->
      <img
        src="/images/Asset Login/kucing-oren.png"
        alt="Cat"
        class="absolute right-[45%] -top-30  h-50 object-contain"
      />

      <!-- Title -->
      <h2 class="mt-12 text-2xl font-bold text-gray-900 text-center">WELCOME BACK</h2>
      <p class="text-gray-800 mt-2 text-sm">Log in your account</p>

      <!-- Login Form -->
      <form class="mt-6 w-full flex flex-col space-y-4" @submit.prevent="handleLogin">
        <input
          type="text"
          v-model="email"
          placeholder="Enter your email"
          class="w-full px-4 py-2 rounded-lg bg-white border border-gray-300 text-gray-800"
        />
        <input
          type="password"
          v-model="password"
          placeholder="Enter your password"
          class="w-full px-4 py-2 rounded-lg bg-white border border-gray-300 text-gray-800"
        />
        <button
          type="submit"
          class="w-full py-2 bg-white text-gray-900 font-bold rounded-lg hover:bg-gray-200 transition"
        >
          LOGIN
        </button>
      </form>

      <!-- Signup Link -->
      <p class="mt-4 text-sm text-gray-900">
        New User?
        <a href="/signup" class="font-semibold hover:underline">Sign up</a>
      </p>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { AuthApi } from "@/api/authApi"; // pastikan path cocok
import { useAuth } from "@/composables/useAuth";

const router = useRouter();
const { setAuth } = useAuth();

const email = ref("");
const password = ref("");

const handleLogin = async () => {
  try {
    const res = await AuthApi.login({
      email: email.value,
      password: password.value,
    });

    // jika backend mengirim error di body
    if (res.data?.error) {
      alert(res.data.error);
      return;
    }

    // kalau backend mengembalikan token & user
    const token = res.data.token;
    const user = res.data.user;

    if (!token || !user) {
      alert("Login failed: invalid response from server");
      return;
    }

    // simpan ke global auth (juga otomatis ke localStorage & axios header)
    setAuth(user, token);

    // redirect ke home
    router.push("/");
  } catch (err) {
    console.error("Login error:", err);
    if (err.response?.data?.error) {
      alert(err.response.data.error);
    } else {
      alert("Server error");
    }
  }
};
</script>


