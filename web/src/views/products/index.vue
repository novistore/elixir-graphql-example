<template>
  <main>
    <ns-product v-for="product in products" :product="product" :key="product.id" />
  </main>
</template>

<script>
import { mapGetters } from 'vuex'

import NsProduct from 'components/Product'

export default {
  components: {NsProduct},

  computed: {
    ...mapGetters('product', ['products'])
  },

  created () {
    this.$store.dispatch('product/loadAll')
  }
}
</script>

<style lang="scss">

</style>
