import client from 'gql/client'
import cloneDeep from 'lodash/cloneDeep'

import allProductsQuery from 'queries/product/all'
import productByIdQuery from 'queries/product/byId'

export const state = {
  products: []
}

export const getters = {
  products: state => state.products
}

export const mutations = {
  setProducts (state, products) {
    state.products = products
  }
}

export const actions = {
  async loadAll (store) {
    const {data} = await client.query({
      query: allProductsQuery
    })

    store.commit('setProducts', cloneDeep(data.products))

    return data.products
  },

  async load (store, id) {
    const {data} = await client.query({
      query: productByIdQuery,
      variables: { id }
    })

    return cloneDeep(data.product)
  }
}

export const namespaced = true
