<template>
  <router-link :to="{name: 'products.show', params: {productId: product.id}}" class="ns-product">
    <h2>{{ product.title }}</h2>
    <span class="ns-product__price">{{ formattedPrice }}</span>
    <p>{{ product.description}}</p>
  </router-link>
</template>

<script>
export default {
  props: {
    product: Object
  },

  computed: {
    formattedPrice () {
      let price = this.product.price.toString()

      return `€ ${price.slice(0, price.length - 2) || '0'},${price.slice(-2)}`
    }
  }
}
</script>

<style lang="scss">
.ns-product {
  &__price {
    color: #4CAF50;
  }
}
</style>
