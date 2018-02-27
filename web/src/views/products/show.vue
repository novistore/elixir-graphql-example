<template>
  <main v-if="product">
    <ns-product :product="product" />
    <hr>
    <ns-review v-for="review in product.reviews" :review="review" :key="review.id" />
    <hr>
    <ns-review-form @submit="createReview" />
  </main>
  <div v-else>Loading...</div>
</template>

<script>
import NsProduct from 'components/Product'
import NsReview from 'components/Review'
import NsReviewForm from 'components/ReviewForm'

export default {
  components: {NsProduct, NsReview, NsReviewForm},

  props: ['productId'],

  data: () => ({
    product: null
  }),

  methods: {
    async createReview (review) {
      try {
        let result = await this.$store.dispatch('review/create', {
          ...review,
          productId: this.product.id
        })

        this.product.reviews.push(result)
      } catch (error) {
        console.error(error)
      }
    }
  },

  async created () {
    this.product = await this.$store.dispatch('product/load', this.productId)
  }
}
</script>
