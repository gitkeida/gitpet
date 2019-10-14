import Vue from 'vue'
import Router from 'vue-router'
import Box from '@/components/boxSizing'

import Index from '@/pages/index'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: Index
    },
    {
      path: '/box',
      name: 'box',
      component: Box
    }
  ]
})
