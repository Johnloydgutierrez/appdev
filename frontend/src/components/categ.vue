<template>
    <div class="sidebar bg-dark-blue text-light p-4">
        <h3>Add New Product</h3>
        <form @submit.prevent="save">
          
          <div class="mb-3">
            <label for="productName" class="form-label">ProductName</label>
            
            <input type="text" class="form-control" placeholder="productName" v-model="productName" required>
          </div>
          
          <div class="mb-3">
            
            <label for="description" class="form-label">description</label>
            <input type="text" class="form-control" placeholder="description" v-model="description" required>
          </div>
    
                
          <div class="mb-3">
            <label for="category" class="form-label">category</label>
            <input type="text" class="form-control" placeholder="category" v-model="category" required>
          </div>

          <div class="mb-3">
            <label for="quantity" class="form-label">quantity</label>
            <input type="text" class="form-control" placeholder="quantity" v-model="quantity" required>
          </div>

          
          <div class="mb-3">
            <label for="image" class="form-label">Image</label>
            <input type="file" id="image" class="form-control" @change="handleImageUpload" required>
          </div>
                
          <div class="mb-3">
            <label for="price" class="form-label">price</label>
            <input type="text" class="form-control" placeholder="price" v-model="price" required>
          </div>
    
          
          <div style="display: flex; justify-content: space-between;">
      <button v-if="isEditing" type="button" @click="cancelEdit" class="btn btn-secondary">Cancel</button>
      <button v-if="isEditing" type="submit" @click.prevent="updateI" class="btn btn-danger" style="margin-right: 150px;">Update</button>
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
          productName: '',
          description: '',
          category: '',
          quantity: '',
          categImage: '',
          price: '',
          itemId: null,
          sid: '',
        };
      },
      // methods: {
      //   handleImageChange(event) {
      //     this.categImage = event.target.files[0];
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
        // Generate a unique categImage productName
    
    
        // Create FormData object
        const formData = new FormData();
        formData.append('productName', this.productName);
        formData.append('description', this.description);
        formData.append('category', this.category);
        formData.append('quantity', this.quantity);
        formData.append('categImage', this.categImage);
        formData.append('price', this.price);
    
    
        // Save the room data to the database
        const room = await axios.post("categsave", formData);
    
        console.log("Room saved successfully:", room);
    
        // Clear the form after successful submission
        this.productName = "";
        this.description = "";
        this.category = "";
        this.quantity = "";
        this.categImage = "";
        this.price = "";
    
        this.$emit('data-saved');
          this.getInfo(id);
      console.log(productName,description,category,quantity,categImage,price)
      } catch (error) {
        console.error("Error saving room:", error);
        // You can display an error message to the user
      }
    
    },
    
      handleImageUpload(event) {
          this.categImage = event.target.files[0];
      },
      getBase64Image(file) {
          return new Promise((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => resolve(reader.result.split(',')[1]);
          reader.onerror = (error) => reject(error);
          reader.readAsDataURL(file);
        });
      },
    
    
    async updateI() {
        try {
          // console.log(this.itemId);
            const formData = this.createFormData();
            console.log(formData);
            // Update operation
            const response = await axios.post(`updateI/${this.sid}`,{
              'productName': this.productName,
              'description': this.description,
              'category': this.category,
              'quantity': this.quantity,
              'categImage': this.categImage,
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
          formData.append('productName', this.productName);
          formData.append('description', this.description);
          formData.append('category', this.category);
          formData.append('quantity', this.quantity);
          formData.append('categImage', this.categImage);
          formData.append('price', this.price);
    
          return formData;
        },
        resetForm() {
          // Reset your form fields
          this.productName = '';
          this.description = '';
          this.category = '';
          this.model = '';
          this.quantity = '';
          this.categImage = '';
          this.price = '';
        },
      },
    };
    </script>
      
      <style scoped>
      .bg-dark-blue {
      background-color: rgb(5, 22, 90)}
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
      