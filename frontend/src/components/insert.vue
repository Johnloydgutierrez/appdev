<template>
<div class="sidebar bg-dark-blue text-light p-4">
    <h3>Add New Product</h3>
    <form @submit.prevent="save">
      
      <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" v-model="itemId">
        <input type="text" class="form-control" placeholder="Name" v-model="name" required>
      </div>
      
      <div class="mb-3">
        
        <label for="Description" class="form-label">Description</label>
        <input type="text" class="form-control" placeholder="Description" v-model="description" required>
      </div>

            
      <div class="mb-3">
        <label for="Brand" class="form-label">Brand</label>
        <input type="text" class="form-control" placeholder="Brand" v-model="brand" required>
      </div>
      
            
      <div class="mb-3">
        <label for="Model" class="form-label">Model</label>
        <input type="text" class="form-control" placeholder="Model" v-model="model" required>
      </div>

            
      <div class="mb-3">
        <label for="Quantity" class="form-label">Quantity</label>
        <input type="text" class="form-control" placeholder="Quantity" v-model="quantity" required>
      </div>

      <div class="mb-3">
        <label for="partsImage" class="form-label">Image</label>
        <input type="file" id="partsImage" class="form-control" @change="handleImageUpload" required>
      </div>

            
      <div class="mb-3">
        <label for="Price" class="form-label">Price</label>
        <input type="text" class="form-control" placeholder="Price" v-model="price" required>
      </div>
      <div style="display: flex; justify-content: space-between;">
  <button v-if="isEditing" type="button" @click="cancelEdit" class="btn btn-secondary">Cancel</button>
  <button v-if="isEditing" type="submit" @click.prevent="updateItem" class="btn btn-danger" style="margin-right: 150px;">Update</button>
  <button v-else type="submit" @click.prevent="save" class="btn btn-success">Save</button>
</div>

    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      name: '',
      description: '',
      brand: '',
      model: '',
      quantity: '',
      partsImage: null,
      price: '',
      itemId: null,
      sid: '',
    };
  },
  // methods: {
  //   handleImageChange(event) {
  //     this.image = event.target.files[0];
  //   },
    
  //   async save() {
  //   try {
  //       const formData = this.createFormData();

  //       // Save operation
  //       const response = await axios.post('save', formData, {
  //           headers: {
  //               'Content-Type': 'multipart/form-data',
  //           },
  //       });

  //       console.log(response.data);

  //       // Remove the current item from the table
  //       if (this.itemId) {
  //           this.info = this.info.filter(item => item.id !== this.itemId);
  //       }

  //       // Reset itemId after saving changes
  //       this.itemId = null;

  //       // Reset the form fields
  //       this.resetForm();
  //       this.isEditing = false;

  //       // Emit an event to notify the parent component about the data update
  //       this.$emit('data-saved');

  //       // ... handle other responses or actions as needed
  //   } catch (error) {
  //       console.error(error);
  //   }
  

  methods: {
    async save() {
          try {
    // Generate a unique image name


    // Create FormData object
    const formData = new FormData();
    formData.append('name', this.name);
    formData.append('description', this.description);
    formData.append('brand', this.brand);
    formData.append('model', this.model);
    formData.append('quantity', this.quantity);
    formData.append('image', this.partsImage, this.partsImage.name);
    formData.append('price', this.price);


    // Save the room data to the database
    const room = await axios.post("save", formData);

    console.log("Room saved successfully:", room);

    // Clear the form after successful submission
    this.name = "";
    this.description = "";
    this.brand = "";
    this.model = "";
    this.quantity = "";
    this.partsImage = null;
    this.price = "";

    // Refresh the data in the admin view
    // this.$emit("refreshData");
  } catch (error) {
    console.error("Error saving room:", error);
    // You can display an error message to the user
  }

},

  handleImageUpload(event) {
      this.partsImage = event.target.files[0];
  },
  getBase64Image(file) {
      return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result.split(',')[1]);
      reader.onerror = (error) => reject(error);
      reader.readAsDataURL(file);
    });
  },


async updateItem() {
    try {
      // console.log(this.itemId);
        const formData = this.createFormData();
        console.log(formData);
        // Update operation
        const response = await axios.post(`updateItem/${this.sid}`,{
          'name': this.name,
          'description': this.description,
          'brand': this.brand,
          'model': this.model,
          'quantity': this.quantity,
          'image': this.image,
          'price': this.price,
        },
        {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        console.log(response.data);

        // Reset the form fields
        this.resetForm();
        this.isEditing = false;

        // Emit an event to notify the parent component about the data update
        this.$emit('data-save');

        // ... handle other responses or actions as needed
    } catch (error) {
        console.error(error);
    }
},

cancelEdit() {
      this.resetForm();
      this.isEditing = false;
    },


    editItem(info) {
      // Clear the form fields and reset editing status
      this.resetForm();
      this.isEditing = false;
    },
    createFormData() {
      const formData = new FormData();
      // formData.append('id', this.id);
      formData.append('name', this.name);
      formData.append('description', this.description);
      formData.append('brand', this.brand);
      formData.append('model', this.model);
      formData.append('quantity', this.quantity);
      formData.append('image', this.image);
      formData.append('price', this.price);

      return formData;
    },
    resetForm() {
      // Reset your form fields
      this.name = '';
      this.description = '';
      this.brand = '';
      this.model = '';
      this.quantity = '';
      this.image = null;
      this.price = '';
    },
  },
};
</script>
  
  <style scoped>
  .bg-dark-blue {
  background-color: rgb(74, 94, 106)}
  .sidebar {
    height: 100%;
  }
  
  @media (min-width: 768px) {
    /* Adjust the height for larger screens */
    .sidebar {
      height: 80vh;
    }
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
  .sidebar-container {
  height: 0vh; /* 100% of the viewport height */
  display: flex;
  flex-direction: column;
}

.sidebar {
  height: 100%; /* Occupy full height of the container */
}
  
  </style>
  