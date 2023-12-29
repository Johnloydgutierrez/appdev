<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-black ">
    <div class="container">
      <router-link to="/Admin" class="navbar-brand bg-black">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 20 19">
  <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
</svg>Back</router-link>
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
      <div class="right-container">
        <categ ref="insertForm" @data-saved="getInfo" />
      </div>
      <div class="parts-container">
        <br>
        <h2>Add E-Bike</h2>
<table border="1" class="parts-table">
  <tr>
    <th>productName</th>
    <th>description</th>
    <th>category</th>
    <th>quantity</th>
    <th>cateImage</th>
    <th>price</th>
    <th>action</th>
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
    <td>
              <v-btn @click="deleteRecord(info.id)" color="indigo" dark>
                Delete
              </v-btn>
            </td>
  </tr>
</table>

  </div>
</div>
  
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
    ebikelist: [], 
  };
  },
  created() {
    this.getInfo();
  },
  methods: {
    async deleteRecord(recordId) {
      const confirm = window.confirm("Are you sure you want to delete this? ");
      if(confirm){
        await axios.post("delt", {
        id: recordId,
      });
      this.getInfo();
    }
  },
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
      formComponent.description = selectedInfo.description;
      formComponent.category = selectedInfo.category;
      formComponent.quantity = selectedInfo.quantity;
      formComponent.image = selectedInfo.image;
      formComponent.price = selectedInfo.price;

      // Store the selected item's ID for updating it later
      formComponent.itemId = selectedInfo.id;
      formComponent.isEditing = true;
    },
    async updateI(editItem) {
      try {
        // Make a PUT request to update the item in your database
        await axios.put(`updateItem/${editItem.id}`, editItem);

        // Update the local data with the edited item
        const index = this.info.findIndex(item => item.id === editItem.id);
        this.$set(this.info, index, editItem);

        
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

<style scoped>

@media (max-width: 767px) {
  .navbar-brand {
    font-size: 14px;
  }

  .navbar-toggler {
    font-size: 12px;
  }

  .navbar-nav {
    margin-top: 10px;
  }

  .floating-container {
    flex-direction: column;
  }

  .right-container,
  .parts-container {
    width: 100%;
    padding: 10px;
  }

  .generate {
    width: 100%;
  }

  .table {
    overflow-x: auto;
  }

  .btn-warning {
    width: 100%;
  }
}
.floating-container  {
  display: flex;
  justify-content: space-between;
  width: 100%;
  margin: 0;
  background-image: url('https://i.ibb.co/fGhjxKM/nwowbg.jpg');
 
}

.right-container {
  max-width: 500px;
}

.parts-container , h2{
  flex-grow: 1;
  padding-left: 20px;
  text-align: center;
}

.parts-table {
  width: 97%;
  border-collapse: collapse;
  margin-top: 20px;
  font-family: 'Helvetica', Arial, sans-serif;
  font-weight: 100;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px #0000001a;
}

.parts-table th,
.parts-table td {
  padding: 15px;
  color: #000000;
  border: 1px solid #01030f;
  background-color: #eef0f7; /* Add border styling */
}

.parts-table th {
  background-color: #030f45;
  color: #ffffff;
}

.parts-table tr:hover {
  background-color: #ffffff4d;
}

.parts-table tbody td {
  position: relative;
}

.parts-table tbody tr:hover::before {
  content: "";
  position: absolute;
  background-color: #ffffff33;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: -1;
}

.right-container h2 {
  margin-bottom: 15px;
}

/* Added styling for the delete button */
.parts-table button {
  background-color: darkblue;
  color: #ffffff;
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius: 4px;
  align-items: center;
}

.parts-table button:hover {
  background-color: #0a3e61;
}
</style>


