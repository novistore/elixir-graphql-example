import Vue from 'vue'
import Router from 'vue-router'
import ProductIndexView from 'views/products/index'
import ProductShowView from 'views/products/show'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'products.index',
      component: ProductIndexView
    },
    {
      path: '/:productId',
      name: 'products.show',
      component: ProductShowView,
      props: true
    }
  ]
})
