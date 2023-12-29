<template>
  
  <div class="sidebar  text-light p-4">
    
    
    <h3>Add Task</h3>
    <form @submit.prevent="sve">
      <div class="mb-3">
        <label for="staff" class="form-label">Employee</label>
        <input type="text" class="form-control" placeholder="Employee" v-model="staff" required>
      </div>

      <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <input type="text" class="form-control" placeholder="Description" v-model="description" required>
      </div>

      <div class="mb-3">
        <label for="location" class="form-label">Location</label>
        <input type="text" class="form-control" placeholder="Location" v-model="location" required>
      </div>

      <div class="mb-3">
        <label for="contact" class="form-label">Contact</label>
        <input type="text" class="form-control" placeholder="Contact" v-model="contact" required>
      </div>

      <div class="mb-3">
        <label for="costumer" class="form-label">Costumer</label>
        <input type="text" class="form-control" placeholder="Costumer" v-model="costumer" required>
      </div>

      <button type="submit" class="btn btn-info">Save</button>
      
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      staff: '',
      description: '',
      location: '',
      contact: '',
      costumer: '',
      
    };
  },
  methods: {
    async sve() {
      try {
        const ins = await axios.post('sve', {
          staff: this.staff,
          description: this.description,
          location: this.location,
      contact: this.contact,
      costumer:this.costumer,
      
        });
      this.staff ='';
      this.description ='';
      this.location ='';
      this.contact ='';
      this.costumer ='';

      this.$emit('data-saved');
          this.getInfo(id);
      console.log(staff,description,location,contact,costumer)

        
      } catch (error) {
        console.log(error);
        
      }
     
    },
   
  },
};
</script>

<style scoped>
body{
  background-color: rgb(8, 99, 8);

}
.sidebar {
  background-color: rgb(58, 58, 124);
  border-radius: 15px;
  overflow: hidden;
  width: 300px;
  
}

.sidebar h3 {
  margin-bottom: 20px;
}

.sidebar label {
  margin-bottom: 5px;
}

.sidebar input {
  margin-bottom: 15px;
}

.sidebar button {
  margin-top: 10px;
}

.btn {
  padding: 8px 16px;
  cursor: pointer;
}
@media screen and (max-width: 768px) {
  .floating-container {
    padding: 0 10px; /* Add some padding for smaller screens */
  }
}

</style>
