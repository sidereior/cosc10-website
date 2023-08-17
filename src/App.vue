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
  :imageSize="item.imageSize" 
  imagePosition="(index % 2 === 0) ? 'left' : 'right'"
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
    currentElement: 1, 
    items: [
      {
        title: "Hi, I'm Alexander Nanda!",
        description: "I'm a rising freshman for Dartmouth College, and this is my portfolio to showcase my work and experiences for placement into COSC 10.",
        imageSrc: require('@/assets/intro.png'),
        parallaxBackground: require('@/assets/intro2.png'), 
        isIntro: true,
        imageSize: '10%',
        textboxSize: '50%', 
      },
      {
        title: "Job Experince 1 - LakeShore Cryotronics",
        description: "Description of Class 1",
        imageSrc: require('@/assets/lakeshore.png'),
        parallaxBackground: require('@/assets/lakeback.png'),
        imageSize: '15%', 
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
    methods: {
    handleScroll() {
  const elements = document.getElementsByClassName('list-item');
  let activeElementIndex = null;

  for (let i = 0; i < elements.length; i++) {
    const rect = elements[i].getBoundingClientRect();
    
    if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
      activeElementIndex = i;
      break;
    }
  }

  if (activeElementIndex !== null) {
    this.currentElement = activeElementIndex + 1;
  }
},

      setTitles() {
      this.titles = this.items.map(item => item.title);
    },
    setCurrentElement(title) {
      this.currentElement = this.items.findIndex(item => item.title === title) + 1;
    },
  scrollToElement(index) {
  const element = document.getElementById(`item-${index}`);
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' });
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
  scrollbar-width: none; 
  -ms-overflow-style: none; 
}

body::-webkit-scrollbar {
  display: none; 
}

#app {
  background: #000;
  color: #e0e0e0;
  font-family: 'Your-Font-Family', sans-serif;
}

.list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 20px;
  overflow-x: auto;
  white-space: nowrap;
}

.list-item {
  /* somehow this changes the entire scrolling behavior, need to text on mobile */
  width: 300vw;
  height: 1000px;
  display: flex;
  align-items: center;
  margin: 20px;
  position: relative;
  overflow: hidden;
  transition: transform 0.3s ease-in-out;
  padding: 20px;
}

.text {
  background: rgba(128, 128, 128, 0.6);
  width: 30%;
  padding: 10px 20px;
  box-sizing: border-box;
  margin: 20px; }

.image {
  width: 40%;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  margin: 20px; }

.image img {
  width: 100%;
  height: auto;
}

.list {
  display: flex;
  justify-content: space-between;
  padding: 20px;
}

</style>
