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
        :parallaxBackground="item.parallaxBackground"
        imagePosition="(index % 2 === 0) ? 'left' : 'right'"
        class="text-box image-box"
      />
    </div>
    <Timeline :currentElement="currentElement" :titles="titles" @timeline-node-clicked="scrollToElement" />
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
      currentElement: 1,
      items: [
        {
          title: "Hi, I'm Alexander Nanda",
          description: "I'm a rising freshman at Dartmouth College from Columbus, Ohio, and this is my portfolio for placement out of COSC 10. I've been programming for nearly six years now, but the Thayer School of Engineering, Dept. of Mathematics, and Tuck Business School interest me greatly as well. This website is organized in no particular order and contains all relevant information (jobs, classes, projects) listed on the Dept. of CS website's Advice section for COSC 10 placement. Feel free to check out my github: github.com/sidereior Thanks for reviewing this! - Alex",
          imageSrc: require('@/assets/intro.png'),
          parallaxBackground: require('@/assets/intro2.png'), 
        },
        {
          title: "Job Experince 1 - LakeShore Cryotronics",
          description: "I've worked as a software engineer for two years at LakeShore Cryotronics, specifically on a part of the MeasureLink team. You're probably asking yourself, what even is Cryotronics? It's as the etymological roots suggest, \"cold technology\", and LakeShore manufactures hardware, software, and sensors for low-temperature, high-field, and quantum appalications. Over the past two years the bulk of my development has been in .NET (C#, XAML, WPF, Prism, NUnit) along with some Java and HTML as well. More recently I have been doing some work with embedded systems in C and assembly. Working as a developer full-time in the summers and then part-time during the school year has not only helped improve my programming skills, but also in learning how to be a successful engineer from a business perspective.", 
          imageSrc: require('@/assets/lakeshore.png'),
          parallaxBackground: require('@/assets/lakeback.png'),
        },
        {
          title: "Job Experience 2 - The Ohio State University",
          description: "Over the summer between my sophomore and junior year, I worked full-time within the Ohio State University's Department of Aerospace and Mechanical Engineering as a computer science researcher. I worked on the M-Themes project which is a Mesoscale Thermomechanical Materials Simulator written in C. I worked entirely in C and implemented a variety of fast-fourier smoothing algorithms using the FFTW library, updating outdated libraries throughout the codebase, preformed continual data-analysis on runtime and space complexity, and presented at both OSU and to my school faculty. Looking back, doing low-level programming in C relatively early on was invaluable for my growth as a programmer and built a foundation to truly understand how a computer functions, which I built upon later. This was my first experience in the \"real-world\" and exposed me to what software and research truly look like.",
          imageSrc: require('@/assets/osu.png'), 
          parallaxBackground: require('@/assets/data.png'), 
        },
        {
          title: "Courses",
            description: "Over the course of my time at Columbus Academy High School I took three computer science courses. I unfortunately don't have of their syllabi, so I'll describe the content and a few highlights. The first, Honors CS 1 (HCS1), was a pretty standard AP Computer Science A course taught in Java. I ended with an A+ and a 5 on the AP. My sophomore year I took HCS2, which is the equivalent of a college level data-structures and algorithm course or AP Computer Science AB (that has been discontinued). This course taught data-structures, algorithms, and time complexity, and one of my favorite projects I built for this class was a predictive-text language-generator where you could give the program a handful of texts and then have a conversation with it based upon what it 'knows'. I scored a A+ in this class and it was a highlight of high school. In my junior year I took HCS3. I have never found a great college-equivalent of this course, but it was a college-level course. Topics included the history of CS, state machines & circuits, one instruction set computers, and networking. The highlights of this course for me was building a LAN network zombie-survival game (and entirely re-building it the night before it was due) along with making a handful of intersting mathematical functions in a subleq-like language. I ended the year with an A+ in this course also.",
          imageSrc: require('@/assets/ca.png'), 
          parallaxBackground: require('@/assets/robotics.png'), 
        }, 
        {
          title: "Clubs & Other Experiences",
            description: "Over the course of my time at Columbus Academy High School I was a part of a handful of clubs related to CS. Most notably I was the president of our Code Club for my Junior and Senior year, where I made and graded monthly problem sets, hosted a handful of code-your-own-bot competitions for games we coded from scratch, taught content, and prepared labs for students to learn from. Also, during my junior to senior year summer I attended the Management and Technology Summer Institute at the Univeristy of Pennsylvania. Here I took EAS 0028 (see Dept. of Engineering and Applied Sciences at UPenn) which involved building a hardware product startup from start to end in three weeks and invovled circuits and some C++. I recieved one college credit hour for this class and my final grade was an A.",
          imageSrc: require('@/assets/ca.png'), 
          parallaxBackground: require('@/assets/robotics.png'), 
        },
        {
          title: "Startups",
            description: "Founding startups has been by far the most enjoyment I have had in programming. Most recently I have founded PaidPlanet after winning the PennApps XXIII hackathon last September. PaidPlanet is releasing later this month and is the first app that pays for everyday sustainable action. I wrote the IOS app using Swift, backend in Firebase, and I have a new website coming soon in Vue.js. Check out more at paidplanet.com. During my sophomore year I founded KnowBeforeYouGo along with two friends and I am the Chief Architect. KnowBeforeYouGo provides both hardware and software to analyze the number of people within a location at a given time and provides software to consumers to see how busy locations are such as resturants, malls, or even parks. We also provide software to businesses that uses AI to predict the busyness of locations and can help optimize employment schedules. Over the two years which we worked on KnowBeforeYouGo we wrote code in Flutter, Microjava, Java, and SQL as well as designed and produced hardware & firmware for our physical devices that would collect data at a specific location. Check out more at bdoyan.com",
          imageSrc: require('@/assets/avatar.png'), 
          parallaxBackground: require('@/assets/paid.png'), 
        },
        {
            title: "Projects",
            description: "Over the years programming, I have almost always been working on personal projects. Recently I made a physically-based rendering engine in Rust from scratch in two weeks (see the youtube video I made: youtube.com/watch?v=MnoGSOUFFjA). Some of my favorite projects have been MERCOR, which is a language I wrote in Java that is designed for applications in economics involving anything from stock lookups to easily performing complex calculations based upon real-time data. Another of my favorites is the smart-contracts I wrote for both the PennApps XXIII hackathon and BitApps hackathon. After the release of PaidPlanet I am planning on working on WebQL, a new query language and database type that I have been thinking about for a while which incorporates fundamental HTTPS-based programming paradigms from MERCOR to databases written in Rust. I'd encourage you to check out my GitHub (github.com/sidereior) if you want to see more of my projects and code. If you've made it this far, I really want to thank you for taking the time to evaluate my CS placement at Dartmouth. Looking forward to meeting everyone soon! - Alex",
          imageSrc: require('@/assets/avatar.png'), 
          parallaxBackground: require('@/assets/rust.png'), 
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
      window.removeEventListener('resize', this.updateSizes); 
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
  updateSizes() {
    const containerWidth = document.querySelector('.list-item').clientWidth;
    const baseFontSize = 16; 
    const textScaleFactor = 0.03;
    const imageScaleFactor = 0.33; 

    const newTextSize = Math.floor(baseFontSize + containerWidth * textScaleFactor);
    const newImageSize = Math.floor(containerWidth * imageScaleFactor);

    const textBoxes = document.querySelectorAll('.text');
    textBoxes.forEach(textBox => {
      textBox.style.fontSize = `${newTextSize}px`;
    });

    const images = document.querySelectorAll('.image');
    images.forEach(image => {
      image.style.width = `${newImageSize}px`;
      image.style.height = `${newImageSize}px`; 
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
  --text-color: #ffffff; 
  --font-family: 'Helvetica', serif;
}

body {
  background-color: transparent;
  border: none;
  color: var(--text-color);
  font-family: var(--font-family);
  overflow-y: scroll;
  scrollbar-width: none;
  -ms-overflow-style: none;
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
   white-space: normal; 
  overflow-x: hidden;
}


.list-item {
  width: 100%;
  height: 1000px;
  display: flex;
   white-space: normal; 
  align-items: center;
  position: relative;
  overflow-x: hidden;
  overflow: hidden;
  transition: transform 2.0s ease-in-out;
  padding: 20px;
  margin: 0px;
}

.text {
  background: rgba(108, 108, 108, 0.8);
  color: #ffffff;
  width: 100%;
  max-width: 100%;
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
  max-width: 100%; 
}

 .parallax-background {
    height: 100vh;
    padding: 0;
    margin: 0;
}

</style>
