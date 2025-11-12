import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
//biar ga perlu import axios di tiap komponen
import axios from 'axios';   
// 🔧 Set base URL default untuk semua request axios
axios.defaults.baseURL = 'http://localhost:5000/api'

// 🔧 Daftarkan axios secara global, jadi bisa diakses lewat this.$axios

const app = createApp(App)
app.config.globalProperties.$axios = axios

app.use(router)

app.mount('#app')

