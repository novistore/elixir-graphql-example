<template>
  <div class="ns-review">
    <h4>{{ review.title }}</h4>
    <p>{{ review.body }}</p>
    <a :href="`mailto:${review.email}`">Respond</a>
  </div>
</template>

<script>
export default {
  props: {
    review: Object
  }
}
</script>

<style lang="scss">
.ns-review {

}
</style>
