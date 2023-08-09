<template>
  <div id="app">
    <div class="parallax-background"></div>
    <div class="list">
      <ListItem
        v-for="(item, index) in items"
        :key="index"
        :title="item.title"
        :description="item.description"
        :imageSrc="item.imageSrc"
        :imagePosition="(index % 2 === 0) ? 'left' : 'right'"
        :parallaxBackground="item.parallaxBackground"
      />
    </div>
    <Timeline :currentElement="currentElement" />
  </div>
</template>

<script>
import Timeline from './components/Timeline.vue';
import ListItem from "./components/ListItem.vue";

export default {
  name: "App",
  components: {
    Timeline,
    ListItem,
  },
  data() {
    return {
      currentElement: 1, // Set the currently viewed element's identifier here
      items: [
        {
          title: "Class 1",
          description: "Description of Class 1",
          imageSrc: require('@/assets/class1.png'),
          parallaxBackground: require('@/assets/class1.png'), 
        },
        {
          title: "Project 1",
          description: "Description of Project 1",
          imageSrc: require('@/assets/project1.png'), 
          parallaxBackground: require('@/assets/project1.png'), 
        },
        {
          title: "Job Experience 1",
          description: "Description of Job Experience 1",
          imageSrc: require('@/assets/job1.png'), 
          parallaxBackground: require('@/assets/job1.png'), 
        },  
      ],
    };
  },
};
</script>


<style>

:root {
  --primary-color: #2c3e50; 
  --secondary-color: #bdc3c7;
  --text-color: #2c3e50; 
  --font-family: 'Helvetica', sans-serif;
}

body {
  background-color: var(--primary-color);
  color: var(--text-color);
  font-family: var(--font-family);
  overflow-y: scroll;
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none; /* Internet Explorer and Edge */
}

body::-webkit-scrollbar {
  display: none; /* Chrome, Safari, and Opera */
}


.list-item {
  width: 100vw; 
  height: 500px;
  display: flex;
  align-items: center;
  margin: 20px 0;
  position: relative;
  overflow: hidden;
}

#app {
  background: #000;
  color: #e0e0e0;
  font-family: 'Your-Font-Family', sans-serif;
}

.list {
  display: grid;
  gap: 20px;
  place-items: center;
  padding: 20px;
  overflow: hidden;
}

.list-item {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.text {
  background: rgba(128, 128, 128, 0.6);
  width: 60%;
  padding: 10px 20px;
  box-sizing: border-box;
}

.image {
  width: 50%;
  border: 2px solid white;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  overflow: hidden;
}

.image img {
  width: 100%;
  height: auto;
}

</style>
