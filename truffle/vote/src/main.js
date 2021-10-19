import { createApp } from 'vue'
import App from './App.vue'
import store from "./store"

import drizzleVuePlugin from "@drizzle/vue-plugin"
import drizzleOptions from "./drizzleOptions"

Vue.use(drizzleVuePlugin, { store, drizzleOptions })

createApp(App).mount('#app')
