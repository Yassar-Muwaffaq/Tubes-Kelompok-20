import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
<<<<<<< HEAD

// GLOBAL AXIOS
import axios from 'axios'

// 🔧 Set base URL default ke /api di backend
axios.defaults.baseURL = 'http://localhost:5000/api';
=======
//biar ga perlu import axios di tiap komponen
import axios from 'axios';   
// 🔧 Set base URL default untuk semua request axios
axios.defaults.baseURL = 'http://localhost:5000/api'

// 🔧 Daftarkan axios secara global, jadi bisa diakses lewat this.$axios
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332

const app = createApp(App)
app.config.globalProperties.$axios = axios

app.use(router)
<<<<<<< HEAD
app.mount('#app')
=======

app.mount('#app')

>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
