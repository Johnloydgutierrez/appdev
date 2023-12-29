<template>
    
  <nav class="navbar navbar-expand-lg navbar-dark bg-black">
  <div class="container">
    <router-link to="/Admin" class="navbar-brand bg-black">
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 20 19">
<path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
</svg>Back</router-link>  
    <div class="collapse navbar-collapse" id="navbarNav">   
    </div>
  </div>
</nav>
<div class="mt-3 text-center"><h3>Sales Management</h3></div>
<div class="right-container">
        <saless/>
      </div>
      <div class="container-fluid bg-white">
      <div class="container-fluid pt-4 px-4">
        <button class="btn btn-primary generate mb-2" @click="generatePdf">
    Generate Report
</button>
              <div class="bg-light text-start rounded p-4">
                <h6 class="col mr-2">Ebike Sales</h6>
                <div class="table-responsive overflow-auto">
                      <table class="table text-start align-middle table-bordered table-hover mb-0">
                          <thead>
                              <tr class="text-dark">  
                                
                                  <th scope="col">Date</th>
                                  <th scope="col">Invoice ID</th>
                                 <th scope="col">Customer</th>
                                  <th scope="col">Category</th>
                                  <th scope="col">Product</th>
                                  <th scope="col">Qty. EBike</th>
                                  <th scope="col">Amt. Ebike</th>
                                  <th scope="col">Parts</th>
                                  <th scope="col">Qty. Parts</th>
                                  <th scope="col">Amt. Parts</th>
                                  <th scope="col">Total Amount</th>
                              </tr>
                          </thead>
                          <tbody>
                            <tr v-for="invoice in invoice" :key="invoice.id">
                              
        <td>{{ invoice.date }}</td>
        <td>{{ invoice.invoiceID }}</td>
        <td>{{ invoice.customer }}</td>
        <td>{{ invoice.category }}</td>
        <td>{{ invoice.product }}</td>
        <td>{{ invoice.quantity }}</td>
        <td>{{ invoice.totalAmount }}</td>
        <td>{{ invoice.parts }}</td>
        <td>{{ invoice.quantityp }}</td>
        <td>{{ invoice.totalAmountp }}</td>
        <td>{{ invoice.grandAmountp }}</td>
      </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              </div>

            </div>
</template>

<script>
import saless from '@/components/saless.vue';
import axios from 'axios';

export default {
  components: {
    saless,
  },
  data() {
    return {
      invoice: [],
    };
  },
  created() {
    this.getInvoice();
  },
  methods: {
    async getInvoice() {
      try {
        const inv = await axios.get('getInvoice');
        this.invoice = inv.data;
      } catch (error) {
        console.log(error);
      }
    },
    generatePdf() {
      fetch("http://localhost:8080/generatePdf", {
        method: "GET", // Use GET instead of POST if you're not sending any data
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then((response) => {
          if (!response.ok) {
          
          }
          return response.blob();
        })
        .then((blob) => {
          const url = window.URL.createObjectURL(new Blob([blob]));
          const link = document.createElement("a");
          link.href = url;
          link.setAttribute("download", "invoice.pdf");
          document.body.appendChild(link);
          link.click();
        })
        .catch((error) => {
          console.error("Error generating or loading PDF:", error);
        });
    },
  },
};
</script>

<style scoped>
.container-fluid {
  background-color: rgb(16, 41, 105); /* Set your desired green color code */
  padding: 20px; /* Adjust padding as needed */
}

/* Add any additional styles for the container */
</style>
