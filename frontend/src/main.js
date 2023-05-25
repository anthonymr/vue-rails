import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import axios from 'axios'
import VueAxios from 'vue-axios'
import VueBasicAlert from 'vue-basic-alert'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.component('vue-basic-alert', VueBasicAlert)

app.use(createPinia())
app.use(router)
app.use(VueAxios, axios)

app.mount('#app')
