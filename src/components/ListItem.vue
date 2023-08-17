<template>
  <div>
    <template v-if="isIntro">
      <IntroItem :title="title" :description="description" :imageSrc="imageSrc" />
    </template>
    <template v-else>
      <div class="list-item" :style="parallaxStyle">
        <div class="parallax-overlay"></div>
        <div class="content">
          <div class="horizontal-layout">
           <div class="image" :class="imagePosition" :style="{ width: imageSize }">
      <img :src="imageSrc" alt="Item Image">
    </div>
    <div class="text" :style="{ width: textboxSize }">
  <h2>{{ title }}</h2>
  <p>{{ description }}</p>
</div>
         </div>
        </div>
      </div>
    </template>
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
    imageSize: String, 
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
.text {
  background: rgba(0, 0, 0, 0.9);
  width: 30%;
  padding: 10px 20px;
  box-sizing: border-box;
  border-radius: 10px;
  color: #ffffff;
}

.image {
  width: 40%;
  display: flex;
  align-items: center;
}

.image img {
  width: 40%;
  height: auto;
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

h2 {
  font-size: 38px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

p {
  font-size: 16px;
  margin-top: 10px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); 
}

.list-item {
  position: relative;
  width: 500vw;
  height: 1000px;
  z-index: 0;
}

.content {
  position: relative;  
  z-index: 2;
}

.parallax-overlay {
  background: rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

.horizontal-layout {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.intro-item {
  display: flex;
  align-items: center;
  padding: 20px;
  background-color: #f5f5f5;
  margin-bottom: 20px;
}

.circular-image {
  width: 100px;
  height: 100px;
  object-fit: cover;
  margin-right: 20px;
}

.intro-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}
</style>
