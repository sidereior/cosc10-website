<template>
  <div class="timeline">
    <div
      v-for="(title, index) in titles"
      :key="index"
      :class="{ 'timeline-node': true, 'current-node': (index + 1) === currentElement }"
      @click="$emit('timeline-node-clicked', index)"
    >
      {{ title }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    currentElement: {
      type: Number,
      required: true,
    },
    titles: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style>
.timeline {
  position: fixed;
  top: 0;
  right: 0;
  width: 200px;
  height: 100%;
  background-color: transparent;
  padding: 20px;
  overflow-y: auto;
}

.timeline-node {
       font-size: 18px; 
       font-weight: bold; 
       background-color: white;
       background-repeat: no-repeat;
       background-size: cover;
       -webkit-background-clip: text;
       background-clip: text;
       color: transparent;
       cursor: pointer;
     }

.current-node {
       background-color: #5A5A5A; 
       color: #fff;
     }
</style>
