<template>
  <div id="app">
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
          description: "I'm a rising freshman at Dartmouth College, and this is my portfolio to showcase my work and experiences for placement into COSC 10.",
          imageSrc: require('@/assets/intro.png'),
          parallaxBackground: require('@/assets/intro2.png'), 
          isIntro: true,
          imageSize: '25%',
          textboxSize: '100%', 
        },
        {
          title: "Job Experince 1 - LakeShore Cryotronics",
          description: "I've worked as a software engineer for two years at LakeShore Cryotronics, specifically on a part of the MeasureLink team. You're probably asking yourself, what even is Cryotronics? Well, it's as it sounds, \"cold technology\". Over the past two years the bulk of my development has been in (.NET) C#, XAML, WPF, Prism, NUnit, and some Java, JS, and HTML as well. Working as a developer full-time in the summers and then part-time during the school year has been not only instrumental in my programming skills, but also in growing marketable business skills. ", 
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
      this.updateSizes(); // Initial size update
  window.addEventListener('resize', this.updateSizes)
  },
  beforeUnmount() {
      window.removeEventListener('resize', this.updateSizes); // Remove event listener on component destruction
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
  updateSizes() {
    const containerWidth = document.querySelector('.list-item').clientWidth;
    const baseFontSize = 16; // You can adjust this base font size as needed
    const textScaleFactor = 0.03; // Adjust this factor for text resizing
    const imageScaleFactor = 0.03; // Adjust this factor for image resizing

    const newTextSize = Math.floor(baseFontSize + containerWidth * textScaleFactor);
    const newImageSize = Math.floor(containerWidth * imageScaleFactor);

    const textBoxes = document.querySelectorAll('.text');
    textBoxes.forEach(textBox => {
      textBox.style.fontSize = `${newTextSize}px`;
    });

    const images = document.querySelectorAll('.image');
    images.forEach(image => {
      image.style.width = `${newImageSize}px`;
      image.style.height = `${newImageSize}px`; // Maintain aspect ratio
    });
  },

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
  --font-family: 'Helvetica', serif;
}

body {
  background-color: transparent;
  border: none;
  color: var(--text-color);
  font-family: var(--font-family);
  overflow-y: scroll;
  overflow-x: hidden;
  margin: 0; 
  padding: 0;
}

.container {
    overflow-y: scroll;
    scrollbar-width: none; 
    -ms-overflow-style: none;  
}
.container::-webkit-scrollbar { 
    width: 0;
    height: 0;
}

#app {
  background: #000; 
    color: #e0e0e0;
  font-family: 'Roboto', sans-serif;
  max-width: 100vw;
  overflow-x: hidden;
}

.list {
  display: flex;
  flex-wrap: wrap;
  padding: 0;
  white-space: nowrap;
  overflow-x: hidden;
}


.list-item {
  width: 100%;
  height: 1000px;
  display: flex;
  align-items: center;
  position: relative;
  overflow-x: hidden;
  overflow: hidden;
  transition: transform 2.0s ease-in-out;
  padding: 0px;
  margin: 0px;
}

.text {
  background: rgba(128, 128, 128, 0.6);
  width: 100%;
  max-width: 100;
  padding: 10px 20px;
  border-radius: 14px;
  box-sizing: border-box;
  margin: 20px;
  word-wrap: break-word;
}

.image {
  box-shadow: none;
  width: 40%;
  margin: 20px;
  max-width: 100;
}

 .parallax-background {
    height: 100vh;
    padding: 0;
    margin: 0;
}

</style>
