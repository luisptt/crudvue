import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

import CrearPastel from '../components/CrearPastel.vue'
import EditarPastel from '@/components/EditarPastel.vue'
import ListarPastel from '@/components/ListarPastel.vue'


const routes = [
  {
    path: '/',
    name: 'homeview',
    component: HomeView
  },
  {
    path: '/crearpastel',
    name: 'CrearPastel',
    component: CrearPastel
  },
  {
    path: '/editarpastel/:id',
    name: 'EditarPastel',
    component: EditarPastel
  },
  {
    path: '/listarpastel',
    name: 'ListarPastel',
    component: ListarPastel
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
