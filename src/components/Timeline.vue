<template>
  <div class="timeline">
    <div
      v-for="(title, index) in titles"
      :key="index"
      :class="{ 'timeline-node': true, 'current-node': (index + 1) === currentElement }"
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
  background-color: #f1f1f1;
  padding: 20px;
  overflow-y: auto;
}

.timeline-node {
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  background-color: #ddd;
  cursor: pointer;
}

.current-node {
  background-color: #32CD32;
  color: #fff;
}
</style>
