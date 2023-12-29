import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'
import axios from 'axios'
import '@mdi/font/css/materialdesignicons.css';
loadFonts()

axios.defaults.baseURL="http://backend.test/"
createApp(App)
  .use(router)
  .use(vuetify)
  .mount('#app')
