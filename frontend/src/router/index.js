import { createRouter, createWebHistory } from 'vue-router'
import NhomePage from '../views/NhomePage.vue'
import  HistoryPage from '../views/sales/HistoryPage.vue'




const routes = [
  {
    path: '/Nhome',
    component: NhomePage,
    meta:{requiredAuth: true}
  },
  
  {
    path: '/Contact',
    name: 'Contact',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Contact.vue'),
    meta:{requiredAuth: true}
  },
  
  {
    path: '/',
    name: 'Login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue') 
  
  },
  {
    path: '/Payment',
    name: 'Payment',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Payment.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/Admin',
    name: 'Admin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Admin.vue'),
    meta:{requiredAuth: true},
  },
  {
    path: '/Signup',
    name: 'Signup',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Signup.vue')
  },
  {
    path: '/ListEbike',
    name: 'ListEbike',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ListEbike.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/Assignment',
    name: 'Assignment',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Assignment.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/parts',
    name: 'parts',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/parts.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/AddEbike',
    name: 'AddEbike',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/inventory/AddEbike.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/AddAssignment',
    name: 'AddAssignment',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/inventory/AddAssignment.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/AddParts',
    name: 'AddParts',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/inventory/AddParts.vue'),
    meta:{requiredAuth: true}
  },
  {
    path: '/Sales',
    name: 'Sales',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/sales/Sales.vue'),
    meta:{requiredAuth: true}
  },

  {
    path: '/Invoice',
    name: 'Invoicee',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/sales/Invoicee.vue'),
    meta:{requiredAuth: true}
  },

  {
    path: '/products',
    name: 'ProductView',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/sales/ProductView.vue'),
    meta:{requiredAuth: true}
  },

  { path: '/history/:upc', name: 'history',  component: HistoryPage },



  

]
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to, from, next) => {
  const isLoggedin = checkUserLogin();
 if (to.matched.some((record) => record.meta.requiredAuth)) {
  if (!isLoggedin) {
    next('/');
  } else {
    next();
  }
 }else{
  next();
 }
});

 function checkUserLogin(){
  const userToken = sessionStorage.getItem("jwt");
  return !!userToken;
}
export default router

