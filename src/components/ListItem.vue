<!-- ListItem.vue -->
<template>
  <div class="list-item">
    <div class="content">
      <div class="image" :class="imagePosition">
        <img :src="require('@/assets/class1.png')" alt="Item Image">
      </div>
      <div class="text">
        <h2>{{ title }}</h2>
        <p>{{ description }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    description: String,
    imageSrc: String,
    imagePosition: String, // 'left' or 'right'
  },
};
</script>

<style>
/* Add your styles for each item here */
</style>
