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


.text {
  background: rgba(0, 0, 0, 0.9);
  width: 60%;
  padding: 10px 20px;
  box-sizing: border-box;
  border-radius: 10px;
  color: #ffffff;
}

.image {
  width: 40%;
  display: flex;
  justify-content: flex-end;
}

.image img {
  width: 100%;
  height: auto;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}


h2 {
  font-size: 28px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

p {
  font-size: 16px;
  margin-top: 10px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); 
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