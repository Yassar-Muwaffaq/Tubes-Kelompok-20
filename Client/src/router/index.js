import { createRouter, createWebHistory } from 'vue-router'
<<<<<<< HEAD
=======
// 1. Import halaman HomeView yang baru kamu buat
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
import HomeView from '../views/HomeView.vue'
import DashboardView from '@/views/DashboardView.vue'
import AdoptNowView from '@/views/AdoptNowView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
<<<<<<< HEAD
      path: '/',
      name: 'home',
      component: HomeView
=======
      path: '/', // Ini adalah URL root (halaman utama)
      name: 'home',
      component: HomeView // 2. Tampilkan komponen HomeView saat URL '/' dibuka
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    },
    {
      path: '/dashboard',
      name: 'dashboard',
<<<<<<< HEAD
      component: DashboardView,
      meta: { requiresAuth: true } // contoh butuh login
=======
      component: DashboardView
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    },
    {
      path: '/adopt-now/:id',
      name: 'adopt-now',
<<<<<<< HEAD
      component: AdoptNowView,
      meta: { requiresAuth: true }
=======
      component: AdoptNowView
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    },
    {
      path:'/terms',
      name:'terms',
      component: () => import('../components/TermAndCondition.vue')
    },
    {
      path:'/adoption',
      name:'adoption',
      component: () => import('@/views/AdoptionView.vue'),
    },
    {
      path:'/profile',
      name:'profile',
      component: () => import('@/views/ProfileView.vue'),
<<<<<<< HEAD
      meta: { requiresAuth: true }
=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    },
    {
      path:'/news',
      name:'news',
      component: () => import('@/views/NewsView.vue'),
    },
    {
      path:'/report-rescue',
      name:'report-rescue',
      component: () => import('@/views/ReportRescueView.vue'),
<<<<<<< HEAD
      meta: { requiresAuth: true }
=======
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
    },
    {
      path:'/login',
      name:'login',
      component: () => import('@/components/Login.vue'),
    },
    {
      path:'/sign-up',
      name:'sign-up',
      component: () => import('@/components/SignUp.vue'),
    },
    {
      path:'/donate',
      name:'donate',
      component: () => import('@/views/DonateView.vue'),
    },
    {
      path:'/all-pages',
      name:'all-pages',
      component: () => import('@/views/AllPagesView.vue'),
<<<<<<< HEAD
    }
  ]
})


// ✅ Middleware setelah router dibuat
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem("token")

  if (to.meta.requiresAuth && !token) {
    return next("/login")
  }

  next()
})

export default router
=======
    },
    // Kamu bisa menambahkan halaman lain di sini nanti, contoh:
    // {
    //   path: '/about',
    //   name: 'about',
    //   component: () => import('../views/AboutView.vue')
    // }
  ]
})

export default router
>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
