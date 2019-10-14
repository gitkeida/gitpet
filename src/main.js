// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import animate from 'animate.css'
import '@/assets/css/base.css'

import axios from './service/axios'
import api from './service/api'


Vue.use(animate)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  api,
  components: { App },
  template: '<App/>'
})
