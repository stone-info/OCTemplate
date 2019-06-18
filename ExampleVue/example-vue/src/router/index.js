import Vue         from 'vue'
import Router      from 'vue-router'
import Home        from '../components/Home'
import Accordion   from '../components/Accordion'
import Actionsheet from '../components/Actionsheet'

Vue.use(Router)

export const routes = [
  { path: '/', redirect: '/Home' },
  { path: '/home', name: 'home', component: Home },
  { path: '/accordion', name: 'accordion', component: Accordion },
  { path: '/actionsheet', name: 'actionsheet', component: Actionsheet },
]
export default new Router({
  routes: routes,
})
