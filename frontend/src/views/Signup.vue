<template>
      <div class="background-container">
    <!-- Your content goes here -->
    
      <!-- Your container content -->
    
  
  <div class="container">
    <div class="container-fluid h-100 d-flex align-items-center justify-content-center">
      <v-sheet width="300" class="mx-auto solid-container">
        <img src="https://prof562e926-pic5.ysjianzhan.cn/upload/3002.png" alt="Logo" class="logo-image mb-4">
        <v-form fast-fail @submit.prevent="register">
          <div v-if="message === 'error'" class="error-message">Invalid response</div>
  
          <v-text-field v-model="username" label="Username" outlined :color="rayColor"></v-text-field>
          <v-text-field v-model="password" label="Password" type="password" outlined :color="rayColor"></v-text-field>
          <v-text-field v-model="passwordConfirm" label="Password Confirm" type="password" outlined :color="rayColor"></v-text-field>
  
          <div v-if="message === 'passwordMismatch'" class="error-message">Passwords do not match</div>
  
          <v-btn type="submit" block class="mt-3" color="info">Submit</v-btn>
          <router-link to="/" class="d-block mt-2">
  <v-btn color="red" block>
    Already have an account.
  </v-btn>
</router-link>


        </v-form>
      </v-sheet>
    </div>
</div>
</div>
  </template>
  
  <script>
  import router from '@/router';
  import axios from 'axios';
  
  export default {
    data() {
      return {
        username: '',
        password: '',
        passwordConfirm: '',
        message: [],
        rayColor: 'green',
      };
    },
    methods: {
      async register() {
        if (this.password === this.passwordConfirm) {
          const data = await axios.post("register", {
            username: this.username,
            password: this.password,
          });
  
          this.message = data.data.msg;
  
          if (data.data.msg === 'okay') {
            alert("Registered successfully");
            router.push('/');
          }
        } else {
          this.message = "passwordMismatch";
        }
      },
    },
  };
  </script>
  
  <style scoped>
  .solid-container {
    background-color: #fff;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  }
  
  .logo-image {
    max-width: 100%;
    height: auto;
    margin-bottom: 20px;
  }
  
  * {
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-weight: 300;
  }
  
  .error-message {
    color: red;
    margin-top: 10px;
  }
  
  /* Custom color for ray (outlined text field) */
  .theme--light.v-text-field--outlined:not(.v-text-field--dense):not(.v-text-field--textarea) {
    border-color: rgb(31, 202, 31);
  }
  
  /* Adjusted color for the button */
  .orange-button {
    color: #fff;
    background-color: orange;
  }

  .background-container {
  background-image: url('https://i.ibb.co/fGhjxKM/nwowbg.jpg');
  background-size: cover;
}

.container {
  /* Your container styles go here */
  padding: 20px;
  border-radius: 10px;
  /* Other styles */
}
  </style>
  