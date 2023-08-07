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
          imageSrc: require('@/assets/class1.png'), // Local image path
        },
        {
          title: "Project 1",
          description: "Description of Project 1",
          imageSrc: require('@/assets/project1.png'), // Local image path
        },
        {
          title: "Job Experience 1",
          description: "Description of Job Experience 1",
          imageSrc: require('@/assets/job1.png'), // Local image path
        },
        // Add more items as needed
      ],
    };
  },
};
</script>


<style>
#app {
  /* Add your global styles for the entire app here */
  font-family: 'Your-Font-Family', sans-serif;
  color: #fff;
}

.parallax-background {
  /* Add your parallax background styles here */
  /* For example, you can use a background image and adjust background-position */
  background-image: url('https://upload.wikimedia.org/wikipedia/commons/9/97/Lockheed_SR-71_Blackbird.jpg');
  background-size: cover;
  background-attachment: fixed;
  height: 100vh;
}

.list {
  /* Add your styles for the list container here */
  /* For example, you can use flexbox to center the items */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

.list-item {
  /* Add your styles for each list item here */
  /* For example, you can use flexbox to arrange the elements */
  display: flex;
  flex-direction: row;
  align-items: center;
  margin: 20px 0;
}

.content {
  /* Add your styles for the item content here */
  /* For example, you can set the width and padding */
  width: 80%;
  padding: 20px;
}

.image {
  /* Add your styles for the image container here */
  /* For example, you can set the width and add a border */
  width: 40%;
  border: 2px solid #fff;
}

.text {
  /* Add your styles for the text container here */
  /* For example, you can set the width and add some spacing */
  width: 60%;
  padding: 0 20px;
}

h2 {
  /* Add your styles for the title here */
  /* For example, you can set the font size and add a shadow effect */
  font-size: 24px;
  text-shadow: 2px 2px 4px #000;
}

p {
  /* Add your styles for the description here */
  /* For example, you can set the font size and add some spacing */
  font-size: 16px;
  margin-top: 10px;
}
</style>
