<template>
  <form class="ns-review-form" @submit="submit">
    <h2>Write a review</h2>
    <input v-model="review.email" type="email" placeholder="Email">
    <input v-model="review.title" type="text" placeholder="Title">
    <textarea v-model="review.body" placeholder="What do you think about this product?" />
    <button type="submit">Submit review</button>
  </form>
</template>

<script>
export default {
  data: () => ({
    review: {
      title: '',
      body: '',
      email: ''
    }
  }),

  methods: {
    submit () {
      this.$emit('submit', this.review)
    }
  }
}
</script>

<style lang="scss">
.ns-review-form {
  display: grid;
  grid-row-gap: 12px;

  > input {
    padding: 0 12px;
    height: 36px;
  }

  > textarea {
    padding: 12px;
    height: 240px;
  }

  > button {
    height: 36px;
  }
}
</style>
