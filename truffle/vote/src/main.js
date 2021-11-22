import { createApp } from 'vue'
import App from './App.vue'
//import store from "./store"
import { createStore } from 'vuex'

import drizzleVuePlugin from "@drizzle/vue-plugin"
import drizzleOptions from "./drizzleOptions"

const store = createStore({
  state: {

  },
  mutations: {

  },
  actions: {

  }
});
createApp(App).use(drizzleVuePlugin, { store, drizzleOptions }).mount('#app');

/*let app = '';
if(!app){
  app = createApp(App).use(store).use(drizzleVuePlugin, { store, drizzleOptions });//.use(store);
  app.mount('#app');
}*/