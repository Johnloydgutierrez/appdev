<template>
      <nav class="navbar navbar-expand-lg navbar-dark bg-black">
  <div class="container">
    <router-link to="/products" class="navbar-brand bg-black">
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 20 19">
<path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
</svg>Back</router-link>  
    <div class="collapse navbar-collapse" id="navbarNav">   
    </div>
  </div>
</nav>
    <!-- ... existing code ... -->
    <v-data-table
      :headers="headers"
      :items="desserts"
      :search="search"
    >
      <template v-slot:item="{ item }">
        <tr>
          <td>{{ item.upc }}</td>
          <td>{{ item.name }}</td>
          <td>{{ item.description }}</td>
          <td>{{ item.quantity }}</td>
          <td>{{ item.price }}</td>
          <td>{{ item.category }}</td>
          <td>
            <v-btn @click="openQuantityModal(item)">
              Add Quantity
            </v-btn>
            <br>
            <router-link :to="{ path: '/history/' + item.upc }" class="button">Audit</router-link>
          </td>
        </tr>
      </template>
    </v-data-table>
  
    <!-- Quantity Modal -->
    <v-dialog v-model="quantityModal" max-width="400">
      <v-card>
        <v-card-title>Add Quantity</v-card-title>
        <v-card-text>
          <!-- Your quantity input field and other necessary fields go here -->
          <v-text-field v-model="quantityToAdd" label="Quantity"></v-text-field>
        </v-card-text>
        <v-card-actions>
          <v-btn @click="addQuantity">Add</v-btn>
          <v-btn @click="closeQuantityModal">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </template>
  
    <script>
    import axios from 'axios'
      export default {
        data () {
          return {
            quantityModal: false,
        selectedProduct: null,
        quantityToAdd: 0,
            search: '',
            headers: [
              {
                align: 'start',
                key: 'upc',
                sortable: false,
                title: 'UPC',
              },
              { key: 'name', title: 'Name' },
              { key: 'description', title: 'Description' },
              { key: 'quantity', title: 'Current Stocks' },
              { key: 'price', title: 'Price' },
              { key: 'cateogry', title: 'Category' },
            ],
            desserts: [],
          }
        },
        created(){
          this.getProducts();
        },
        methods:{
          openQuantityModal(item) {
        this.selectedProduct = item;
        this.quantityToAdd = 0;
        this.quantityModal = true;
      },
  
      closeQuantityModal() {
        this.selectedProduct = null;
        this.quantityToAdd = 0;
        this.quantityModal = false;
      },
      async addQuantity() {
        const updatedProduct = { ...this.selectedProduct };
        updatedProduct.quantity += parseInt(this.quantityToAdd);
        await axios.post('api/updateQuantity', {
          upc: updatedProduct.upc,
          quantity: this.quantityToAdd,
        });
        const index = this.desserts.findIndex((product) => product.upc === updatedProduct.upc);
        this.getProducts();
        this.closeQuantityModal();
      },
          async getProducts(){
            const data = await axios.get('api/getProducts');
            this.desserts = data.data;
          }
        }
      }
    </script>