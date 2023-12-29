<template>
 
        
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <router-link to="/Nhome" class="navbar-brand">Back</router-link>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          
        </ul>
      </div>
    </div>
  </nav>
  <br>
  <h1>Employees Task</h1>
  <div class="task-container">
    <table class="task-table">
      <tr>
        <th>Employee</th>
        <th>Description</th>
        <th>Location</th>
        <th>Contact Number</th>
        <th>Customer Name</th>
      </tr>
      <tr v-for="info in info" :key="info.id">
        <td>{{ info.staff }}</td>
        <td>{{ info.description }}</td>
        <td>{{ info.location }}</td>
        <td>{{ info.contact }}</td>
        <td>{{ info.costumer }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import insert from '@/components/insert.vue';

import axios from 'axios';

export default {
  components: {
    insert,
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
h1 {
  text-align: center;
}

.task-container {
  display: flex;
  justify-content: center;
  align-items: center; /* Center vertically */
  height: 50vh; /* Full height of the viewport */
}

.task-table {
  border-collapse: collapse;
  width: 90%;
  border-radius: 15px; /* Add border-radius for curved edges */
  overflow: hidden; /* Hide overflow for curved edges */
  background-color: #f0f0f0; /* Light gray background color */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Black shadow color */
  margin-top: 20px;
  font-family: 'Arial', sans-serif;
}

.task-table th,
.task-table td {
  border: 1px solid #000; /* Black border */
  padding: 16px;
  text-align: left;
  font-size: 16px;
  color: #333; /* Dark gray text color */
}

.task-table th {
  background-color: #333; /* Dark gray background for th */
  color: #fff; /* White text color */
}

.task-table tr:nth-child(even) {
  background-color: #ddd; /* Light gray background for even rows */
}

.task-table tr:hover {
  background-color: #ccc; /* Slightly darker gray background on hover */
}
</style>

