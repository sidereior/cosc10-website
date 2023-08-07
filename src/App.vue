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
  </div>
</template>

<script>
import ListItem from "./components/ListItem.vue";

export default {
  name: "App",
  components: {
    ListItem,
  },
  data() {
    return {
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
  }
};
</script>

<style>

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
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 20px;
  overflow: hidden;
}

.list-item {
  display: flex;
  align-items: center;
  margin: 20px 0;
  position: relative;
  overflow: hidden;
}

.text {
  width: 60%;
  padding: 0 20px;
}



h2 {
  font-size: 24px;
  text-shadow: 0 0 10px #32CD32, 0 0 20px #32CD32;
}

p {
  font-size: 16px;
  margin-top: 10px;
  text-shadow: 0 0 10px #32CD32, 0 0 20px #32CD32;
}
</style>
