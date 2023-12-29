<template>
  <div class="top-bar">
  <a href="/Admin" >

    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-arrow-left-square-fill" viewBox="0 0 20 19">
  <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
</svg>
  </a>
</div>
      
  <div class="container">
    
    <assign @data-saved="getInfo" />
    <div class="main-content">
      
      <div class="task-container">
        <h2>Add Assignment</h2>
        <br> <!-- Add a line break for separation -->
        <table class="task-table custom-table">
          <tr>
            <th>Employee</th>
            <th>Description</th>
            <th>Location</th>
            <th>Contact Number</th>
            <th>Customer Name</th>
            <th>Action</th>
          </tr>
          <tr v-for="info in info" :key="info.id">
            <td>{{ info.staff }}</td>
            <td>{{ info.description }}</td>
            <td>{{ info.location }}</td>
            <td>{{ info.contact }}</td>
            <td>{{ info.costumer }}</td>
            <td>
              <v-btn @click="deleteRecord(info.id)" color="indigo" dark>
                Task Complete
              </v-btn>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</template>


<script>
import assign from '../../components/assign.vue';

import axios from 'axios';

export default {
 
  components: {
    assign,
   
    
  },
  data() {
    return {
      info: [],
    };
  },
  created() {
    this.getInfo();
  },
    methods: {
    async deleteRecord(recordId) {
      await axios.post("del", {
        id: recordId,
      });
      this.getInfo();
    },
    async getInfo() {
      try {
        const inf = await axios.get('Assign');
        this.info = inf.data;
      } catch (error) {
        console.log(error);
      }  
    },
  },
   
};
</script>

<style>
 

 .top-bar {
      background-color: #000000; /* Set your desired background color */
      color: #fff; /* Set your desired text color */
      padding: 10px; /* Adjust padding as needed */
      text-align: left; /* Center the content */
    }

    .container {
      color: inherit; /* Inherit the text color from the parent */
      text-decoration: none; /* Remove the default underline on links */
      display: flex;
      align-items: center;
    }

    .container svg {
      margin-right: 5px; /* Add spacing between the icon and text */
    }
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.task-container {
  text-align: center;
}

h2 {
  margin-bottom: 20px;
}

.generate {
  margin-bottom: 20px;
}

.content-container {
  display: flex;
}

.sidebar {
  width: 300px;
  background-color: #333; /* Dark gray background color */
  border-radius: 10px;
  overflow: hidden;
  margin-right: 20px;
}

.main-content {
  flex-grow: 1;
  padding: 20px;
}



.custom-table {
  border-collapse: collapse;
  width: 100%;
  border: 2px solid #555; /* Border color */
  border-radius: 10px;
  overflow: hidden;
}

.custom-table th,
.custom-table td {
  border: 1px solid #555;
  padding: 15px; /* Adjusted padding */
  text-align: center;
}

.custom-table th {
  background-color: rgb(58, 58, 124); /* Dark gray header background color */
  color: black; /* White text color */
}



.custom-table tr:nth-child(even) {
  background-color: #bdbdbd; /* Darker gray background for even rows */
}

.custom-table tr:hover {
  background-color: rgb(154, 150, 205); /* Darker gray background on hover */
}
@media (max-width: 767px) {
  .top-bar {
    padding: 5px;
  }

  .container {
    flex-direction: column;
  }

  .container svg {
    margin-right: 0;
    margin-bottom: 5px;
  }

  .task-container {
    padding: 10px;
  }

  .generate {
    margin-bottom: 10px;
  }
}
@media screen and (max-width: 768px) {
  .floating-container {
    padding: 0 10px; /* Add some padding for smaller screens */
  }
}
</style>

