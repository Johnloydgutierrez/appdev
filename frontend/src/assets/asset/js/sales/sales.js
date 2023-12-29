new Vue({
    el: '#app',
    data: {
      quantity: 0,
      price: 0
    },
    computed: {
      totalAmount: function () {
        return this.quantity * this.price;
      }
    }
  });