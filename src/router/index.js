import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Welcome from '../views/Welcome.vue'
import Queries from '../views/Queries.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'home',
    component: Home,
    meta: {
      noNav: false
    }
  },
  {
    path: '/queries',
    name: 'queries',
    component: Queries,
    meta: {
      noNav: false
    }
  },
  {
    path: '/',
    name: 'welcome',
    component: Welcome,
    meta: {
      noNav: true
    }
  },
  // {
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  routes
})

export default router
