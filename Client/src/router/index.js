import { createRouter, createWebHistory } from 'vue-router'
// 1. Import halaman HomeView yang baru kamu buat
import HomeView from '../views/HomeView.vue'
import DashboardView from '@/views/DashboardView.vue'
import AdoptNowView from '@/views/AdoptNowView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/', // Ini adalah URL root (halaman utama)
      name: 'home',
      component: HomeView // 2. Tampilkan komponen HomeView saat URL '/' dibuka
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardView
    },
    {
      path: '/adopt-now/:id',
      name: 'adopt-now',
      component: AdoptNowView
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