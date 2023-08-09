<template>
  <div class="timeline">
    <div
      v-for="element in elements"
      :key="element.id"
      :class="{ 'timeline-node': true, 'current-node': element.id === currentElement }"
    >
      {{ element.label }}
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      elements: [
        { id: 1, label: 'Element 1' },
        { id: 2, label: 'Element 2' },
        { id: 3, label: 'Element 3' },
        // Add more elements as needed
      ],
    };
  },
  props: ['currentElement'],
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
