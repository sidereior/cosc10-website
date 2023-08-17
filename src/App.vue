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
        @item-selected="setCurrentElement"
      />
    </div>
    <Timeline :currentElement="currentElement" :titles="titles" @timeline-node-clicked="scrollToElement" />
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
      currentElement: 1, // Set the initially viewed element's identifier here
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
      titles: [],
    };
  },
  mounted() {
    this.setTitles();
    this.handleScroll();
    window.addEventListener('scroll', this.handleScroll);
  },
  unmounted() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      const windowHeight = window.innerHeight;
      const elements = document.getElementsByClassName('list-item');
      
      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const rect = element.getBoundingClientRect();
        
        if (rect.top >= 0 && rect.top <= windowHeight) {
          this.currentElement = i + 1;
          break;
        }
      }
    },
    setTitles() {
      this.titles = this.items.map(item => item.title);
    },
    setCurrentElement(title) {
      this.currentElement = this.items.findIndex(item => item.title === title) + 1;
    },
    scrollToElement(index) {
      const element = document.getElementById(`item-${index + 1}`);
      if (element) {
        const rect = element.getBoundingClientRect();
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const targetTop = rect.top + scrollTop;
        window.scrollTo({
          top: targetTop,
          behavior: "smooth",
        });
      }
    },
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
  height: 700px;
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
  width: 100vw; 
  height: 500px;
  display: flex;
  align-items: center;
  margin: 20px 0;
  position: relative;
  overflow: hidden;
  transition: transform 0.3s ease-in-out; /* Add this line */
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
