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
  <table border="1" class="parts-table">
  <tr>
    <th>Model</th>
    <th>Description</th>
    <th>Category</th>
    <th>Quantity</th>
    <th>CategImage</th>
    
    
    <th>price</th>
    
    <th style="display: none">ID</th>
  </tr>
  <tr v-for="info in ebikelist" :key="info.id">
    <td>{{ info.productName }}</td>
    <td>{{ info.description }}</td>
    <td>{{ info.category }}</td>
    <td>{{ info.quantity }}</td>
    
    <td v-if="info.categImage">
      <img
        :src="info.categImage"
        style="max-width: 100%; max-height: 100%; width: 100px; height: auto;"
        @error="handlecategImageError"
      />
    </td>
    <td>{{ info.price }}</td>
    <td style="display: none">{{ info.id }}</td>
   
  </tr>
</table>
</template>
<script>
import categ from '@/components/categ.vue';
import axios from 'axios';

export default {
  components: {
    categ,
  },
  data() {
    return {
    ebikelist: [], // Corrected property productName
  };
  },
  created() {
    this.getInfo();
  },
  methods: {
    async getInfo() {
      try {
        const inf = await axios.get('/ebikecategGetData');
        this.ebikelist = inf.data;
      } catch (error) {
        console.error(error);
      }
    },
    editItem(selectedInfo) {
      // Access the form component using the ref
      const formComponent = this.$refs.insertForm;

      // Update the form fields with the selected item's data
      
      formComponent.id = selectedInfo.ID;
      formComponent.sid = selectedInfo.ID;
      formComponent.productName = selectedInfo.productName;
     
      formComponent.category = selectedInfo.category;
      formComponent.categImage = selectedInfo.categImage;
      formComponent.price = selectedInfo.price;

      // Store the selected item's ID for updating it later
      formComponent.itemId = selectedInfo.id;
      formComponent.isEditing = true;
    },
    generatePDF() {
      // Your existing code for generating PDF
    },
    async updateItem(editedItem) {
      try {
        // Make a PUT request to update the item in your database
        await axios.put(`updateItem/${editedItem.id}`, editedItem);

        // Update the local data with the edited item
        const index = this.info.findIndex(item => item.id === editedItem.id);
        this.$set(this.info, index, editedItem);
      } catch (error) {
        console.error(error);
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
.floating-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%; /* Take full width of the parent */
  max-width: 800px; /* Limit the maximum width */
  margin: 20px auto;
  text-align: center;
}

/* Add a media query for smaller screens */
@media screen and (max-width: 768px) {
  .floating-container {
    padding: 0 10px; /* Add some padding for smaller screens */
  }
}
</style>
