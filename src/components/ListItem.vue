<template>
  <div class="list-item" :style="parallaxStyle">
    <div class="content">
      <div class="horizontal-layout">
        <div class="image" :class="imagePosition" :style="{ width: imageWidth }">
          <img :src="imageSrc" alt="Item Image" />
        </div>
        <div class="text" :style="{ width: textWidth }">
          <h2>{{ title }}</h2>
          <p class="description">{{ description }}</p>
        </div>
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
    isIntro: Boolean,
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

<style scoped>

.image img {
  width: var(--image-box-width, 100%); 
  height: auto;
  display: flex;
  align-items: center;
  margin-right: 20px;

}

h2 {
  font-size: 2.5rem;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

p {
  font-size: 1.25rem;
  margin-top: 10px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.list-item {
  position: relative;
  width: 100%;
  height: 100vh;
  z-index: 0;
   white-space: normal; 
  overflow-x: hidden;
}

.parallax-background {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  background-size: cover;
  background-position: center;
}

.content {
  position: relative;
  z-index: 2;
}

.horizontal-layout {
  display: flex;
  align-items: center;
  justify-content: safe;
}

.description {
  font-size: 1.25rem; 
  line-height: 1.75;
}
</style>