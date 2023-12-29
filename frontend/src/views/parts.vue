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
  <div class="floating-container">
    <h2>EBike Parts Stocks Information</h2>

    <table class="parts-table">
      <tr>
        <th>Name</th>
            <th>Description</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Quantity</th>
            <th>Image</th>
            <th>Price</th>
      </tr>
      <tr v-for="info in info" :key="info.id">
        <td>{{ info.name }}</td>
        <td>{{ info.description }}</td>
        <td>{{ info.brand }}</td>
        <td>{{ info.model }}</td>
        <td>{{ info.quantity }}</td>
        <td v-if="info.image">
                      <img
                        :src="info.image"
                        style="max-width: 200%; max-height: 100%; width: 100px; height: auto;"
                        @error="handleImageError"
                      />
                    </td>
        <td>{{ info.price }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
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
        const inf = await axios.get('getData');
        this.info = inf.data;
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped>
.floating-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center; /* Center content vertically */
  width: 80%;
  margin: 20px auto;
  text-align: center; /* Center content horizontally */
}

h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

.parts-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.parts-table th,
.parts-table td {
  border: 1px solid #535353;
  padding: 12px;
  text-align: center;
}

.parts-table th {
  background-color: #4c4e4e;
  color: #ffffff; /* White text color */
}

.parts-table tr:nth-child(even) {
  background-color: #f0f0f0; /* Light gray background for even rows */
}

.parts-table tr:hover {
  background-color: #e0e0e0; /* Slightly darker gray background on hover */
}
</style>

