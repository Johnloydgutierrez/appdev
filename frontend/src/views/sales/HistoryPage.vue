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
    <v-card
      flat
      title="Product History"
    >
      <template v-slot:text>
        <v-text-field
          v-model="search"
          label="Search"
          prepend-inner-icon="mdi-magnify"
          single-line
          variant="outlined"
          hide-details
        ></v-text-field>
      </template>
  
      <v-data-table
        :headers="headers"
        :items="desserts"
        :search="search"
      ></v-data-table>
    </v-card>
  </template>
 <script>
 import axios from 'axios'
   export default {
     data () {
       return {
         quantityModal: false,
     selectedProduct: null,
     quantityToAdd: 0,
     VoidToAdd: 0,
         search: '',
         upc: null,
      auditData: null,
         headers: [
           {
             align: 'start',
             key: 'upc',
             sortable: false,
             title: 'UPC',
           },
           { key: 'name', title: 'Name' },
           { key: 'description', title: 'Description' },
           { key: 'oldQuantity', title: 'Old Quantity' },
           { key: 'quantity', title: 'Quantity' },
           { key: 'type', title: 'type' },
         ],
         desserts: [],
       }
     },
     
  mounted() {
    // Access the UPC parameter passed in the route
    this.upc = this.$route.params.upc;
    this.getAudit();
  },
     
     methods:{
       async getAudit(){
        const data = await axios.get(`api/audit/${this.upc}`);
         this.desserts = data.data;
       }
     }
   }
 </script>