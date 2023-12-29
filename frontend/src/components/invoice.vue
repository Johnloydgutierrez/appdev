<template>
    <div id="app">
      <div>
        <div v-if="salesTransactionNumber">
          Sales Transaction Number: <b>{{ salesTransactionNumber }}</b>
        </div>
        <div>Total Price: <b>{{ totalSalesPrice.toFixed(2) }}</b></div>
    
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in tableData" :key="index">
              <td>{{ item.name }}</td>
              <td>{{ item.price }}</td>
              <td>{{ item.quantity }}</td>
              <td>{{ item.quantity * item.price }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    
      <div>
        <label for="inputText">Fixed Input Text</label>
        <input
          type="text"
          id="inputText"
          v-model="inputText"
          @keydown.enter="handleEnterKey"
          @keydown.ctrl.enter.prevent="handleSales"
        />
      </div>
    
      <div v-if="showProductModal">
        <div class="modal" @click="showProductModal = false">
          <div class="modal-content" style="max-width: 600px;">
            <div class="modal-header">
              <h2 class="headline">Products List</h2>
            </div>
            <div class="modal-body">
              <label for="productFilter">Filter Products</label>
              <input
                type="text"
                id="productFilter"
                v-model="productFilter"
                @input="filterProducts"
                ref="productFilterInput"
              />
    
              <ul style="max-height: 300px; overflow-y: auto;">
                <li v-for="(product, index) in filteredProductList" :key="index">
                  <div>
                    <div>{{ product.name + "  -   " + product.price }}</div>
                    <div>{{ product.description }}</div>
                  </div>
                  <div>
                    <button @click="selectProduct(product.upc)">Select</button>
                  </div>
                </li>
              </ul>
            </div>
            <div class="modal-footer">
              <button @click="showProductModal = false">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    </template>
  
  <script>
import axios from 'axios';

export default {
  data() {
    return {
      productFilter: '',
      inputText: '',
      salesTransactionNumber: null,
      tableData: [],
      quantity:'',
      upc:'',
      showProductModal: false,
      productList: [],
    };
  },
  computed:{
    tableHeaders() {
      return [
        { text: 'Product Name', value: 'name' },
        { text: 'Price', value: 'price' },
        { text: 'Quantity', value: 'quantity' },
        { text: 'Subtotal', value: 'subtotal' }, 
      ];
    },
    filteredProductList() {
      const filterText = this.productFilter.toLowerCase();
      return this.productList.filter(product =>
        product.name.toLowerCase().includes(filterText)
      );
    },
    totalSalesPrice() {
      return this.tableData.reduce((total, item) => total + item.subtotal, 0);
    },
  },
  created(){
    this.salesTransactionNumber = this.generateRandomKey();
    this.getSales();
  },
  watch: {
    showProductModal: 'showProductModalChanged',
  },
  methods: {
    async showProductModalChanged() {
      if (this.showProductModal) {
        await this.$nextTick();
        this.$refs.productFilterInput.focus();
      }
    },


    selectProduct(upc) {
      this.inputText = upc;
      this.showProductModal = false;
    },
    generateRandomKey() {
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      const length = 8;
      let result = '';
      for (let i = 0; i < length; i++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        result += characters.charAt(randomIndex);
      }
      return result;
    },
    async getSales(){
      const sales = await axios.get(`api/sales/${this.salesTransactionNumber}`);
      this.tableData = sales.data.map(item => ({
        ...item,
        subtotal: item.quantity * item.price,
      }));
      

      
    },
    async handleSales() {
      const sales = await axios.get(`api/setsales/${this.salesTransactionNumber}`);
      this.salesTransactionNumber = this.generateRandomKey();
      this.getSales();
    },
    async handleEnterKey() {
      if (this.inputText.includes('@')) {
        const parts = this.inputText.split('@');
        console.log('Split parts:', parts);
        this.quantity = parts[0];
        this.upc = parts[1];
      } else {
        this.upc = this.inputText;
        this.quantity = '1';
      }
      const st = await axios.post('api/isales', {
        quantity: this.quantity,
        upc: this.upc,
        orderID: this.salesTransactionNumber,
      });
      if (st.data === 'no_result') {
        const d = await axios.get('api/products');
        this.productList= d.data;
        this.showProductModal = true;
        console.log(this.productList);
      } else {
        this.inputText = '';
        this.getSales();
      }
    },
  },
};
</script>
  
