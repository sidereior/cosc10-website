<template>
  <div class="list-item" :style="parallaxStyle">
    <div class="parallax-overlay"></div>
    <div class="content">
      <div class="image" :class="imagePosition">
        <img :src="imageSrc" alt="Item Image">
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
    imagePosition: String,
    parallaxBackground: String, 
  },
  computed: {
    parallaxStyle() {
      return {
        background: this.parallaxBackground
          ? `url(${this.parallaxBackground}) center/cover fixed no-repeat`
          : "transparent",
      };
    },
  },
};
</script>


<style>

.image {
  width: 40%;
  border: 2px solid #fff;
}

.text {
  width: 60%;
  padding: 0 20px;
}

.list-item {
  position: relative;
  z-index: 0; /* Newly added */
}

.content {
  position: relative;  
  z-index: 2; /* Modified */
}

.parallax-overlay {
  background: rgba(0, 0, 0, 0.5); /* Overlay with black and 50% transparency */
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1; /* Modified */
}
</style>