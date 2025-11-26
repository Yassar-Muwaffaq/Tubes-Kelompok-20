<template>
  <div class="relative z-10 p-6 mt-20 bg-gray-50 min-h-screen">

    <!-- Switch User/Kucing + Search -->
    <div class="flex flex-wrap items-center space-x-4 mb-6 relative z-20">
      <button
        @click="changeType('Kucing')"
        :class="[currentType === 'Kucing'
            ? 'bg-gray-400 text-white shadow-md'
            : 'bg-gray-200 text-gray-700 hover:bg-gray-300',
          'px-4 py-2 rounded-lg text-sm font-semibold transition']"
      >
        Kucing
      </button>

      <button
        @click="changeType('User')"
        :class="[currentType === 'User'
            ? 'bg-gray-400 text-white shadow-md'
            : 'bg-gray-200 text-gray-700 hover:bg-gray-300',
          'px-4 py-2 rounded-lg text-sm font-semibold transition']"
      >
        User
      </button>

      <div class="relative flex-grow max-w-lg">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="Search..."
          class="w-full pl-10 pr-4 py-2 rounded-lg bg-gray-200 placeholder-gray-500 border-none focus:ring-1 focus:ring-gray-500"
        />
        <svg
          class="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-500"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
          />
        </svg>
      </div>
    </div>

    <!-- Table -->
    <div class="bg-white shadow overflow-hidden sm:rounded-lg relative z-10">
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Gambar</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Nama</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                {{ currentType === 'Kucing' ? 'Jenis' : 'Role' }}
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                {{ currentType === 'Kucing' ? 'Umur' : 'Kontak' }}
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Kota</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Aksi</th>
            </tr>
          </thead>

          <tbody class="bg-white divide-y divide-gray-200">
            <tr
              v-for="item in filteredData"
              :key="item.id"
              class="hover:bg-gray-50"
            >
              <td class="px-6 py-4 text-sm text-gray-900">{{ item.id }}</td>

              <td class="px-6 py-4">
                <div class="h-10 w-10">
                  <img
                    v-if="item.img"
                    :src="item.img"
                    class="h-10 w-10 rounded-full object-cover"
                  />
                  <div
                    v-else
                    class="h-10 w-10 bg-gray-300 rounded-full flex items-center justify-center text-white"
                  >
                    <span v-if="currentType === 'User'">👤</span>
                    <span v-else>🐾</span>
                  </div>
                </div>
              </td>

              <td class="px-6 py-4 text-sm text-gray-500">{{ item.name }}</td>
              <td class="px-6 py-4 text-sm text-gray-500">{{ item.role }}</td>
              <td class="px-6 py-4 text-sm text-gray-500">{{ item.contact }}</td>
              <td class="px-6 py-4 text-sm text-gray-500">{{ item.location }}</td>

              <td class="px-6 py-4 text-sm space-x-2">
                <span @click="handleAction('Detail', item)" class="text-indigo-600 cursor-pointer hover:text-indigo-900">Detail</span>
                <button @click="handleAction('Edit', item)" class="text-gray-400 hover:text-gray-700">✏️</button>
                <button @click="handleAction('Delete', item)" class="text-gray-400 hover:text-gray-700">🗑️</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";
import { DashboardApi } from "@/api/dashboardApi";

const catData = ref([]);
const userData = ref([]);

const currentType = ref("Kucing");
const searchQuery = ref("");

// ✅ Fetch USERS (benar)
onMounted(async () => {
  try {
    const res = await DashboardApi.getUsers();
    console.log("Users API:", res.data.data);

    if (!res.data.success) return;

    userData.value = res.data.data.map(u => ({
      id: u.id,
      img: u.profile_image_url,
      name: u.name,
      role: u.role ?? "-",
      contact: u.phone,
      location: u.shelter
    }));
  } catch (err) {
    console.error("Gagal mengambil data user:", err);
  }
});

// ✅ Fetch REPORTS (kucing) (benar)
onMounted(async () => {
  try {
    const res = await DashboardApi.getReports();
    console.log("Reports API:", res.data);

    // Jika API report formatnya: [ {id, image, ...} ]
    const reports = Array.isArray(res.data) ? res.data : res.data.data;

    catData.value = reports.map(r => {
      let img = null;

      // image berupa JSON string → parse dulu
      try {
        const arr = JSON.parse(r.image);
        img = arr.length > 0 ? `http://localhost:5000/uploads/${arr[0]}` : null;
      } catch {}

      return {
        id: r.id,
        img,
        name: r.cat_name,
        role: r.breeds,
        contact: r.age,
        location: r.location,
      };
    });

  } catch (err) {
    console.error("Gagal mengambil data reports:", err);
  }
});


// 🔄 Table Switch
const tableData = computed(() =>
  currentType.value === "Kucing" ? catData.value : userData.value
);

// 🔍 Search Filter
const filteredData = computed(() => {
  if (!searchQuery.value) return tableData.value;

  const q = searchQuery.value.toLowerCase();
  return tableData.value.filter(item =>
    Object.values(item).some(v => String(v).toLowerCase().includes(q))
  );
});

const changeType = type => {
  currentType.value = type;
  searchQuery.value = "";
};

const handleAction = (action, item) => {
  alert(`${action} untuk ${item.name} (ID: ${item.id})`);
};
</script>

