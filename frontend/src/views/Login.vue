<template>
  <div class="background-container flex">
    <div class="container">
      <div class="container-fluid d-flex align-items-center justify-content-center vh-100">
        <div class="v-container theme-container">
          <img src="https://prof562e926-pic5.ysjianzhan.cn/upload/3002.png" alt="Logo" class="logo-image mb-4">
          <v-sheet width="300" class="mx-auto">
            <v-form @submit.prevent="login">
              <div v-if="message === 'error'" class="error-message">Invalid response</div>

              <v-text-field
                v-model="username"
                label="Username"
                outlined
                :color="black"
              ></v-text-field>

              <v-text-field
                v-model="password"
                label="Password"
                :type="showPassword ? 'text' : 'password'"
                outlined
                :color="black"
              >
                <template v-slot:append-inner>
                  <v-icon @click="togglePasswordVisibility">{{ showPassword ? 'mdi-eye' : 'mdi-eye-off' }}</v-icon>
                </template>
              </v-text-field>

          <v-btn type="submit" block class="mt-3" color="info">Login</v-btn>
          <router-link to="/signup" class="d-block mt-2">
  <v-btn color="red" block>
    Don't have an account?
  </v-btn>
</router-link>


        </v-form>
      </v-sheet>
    </div>
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
      message: '',
      rayColor: 'green',
      showPassword: false,
    };
  },
  methods: {
    async login() {
      // console.log('okay naman')
      try {
        const { data } = await axios.post('login', {
          username: this.username,
          password: this.password,
        });

        this.message = data.msg;

        if (data.msg === 'okay') {
          sessionStorage.setItem('jwt', data.token);
          router.push('/Nhome');
        }
      } catch (error) {
        console.error('An error occurred during login:', error);
        this.message = 'error';
      }
    },
    togglePasswordVisibility() {
      this.showPassword = !this.showPassword;
    },
  },
};
</script>

<style scoped>
/* Add your component-specific styles here */
.logo-image {
  max-width: 100%;
  height: auto;
}

.theme-container {
  background-color: rgb(255, 255, 255);
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 0 20px rgba(41, 33, 33, 0.2);
}

.error-message {
  color: red;
  margin-top: 10px;
}

/* Custom color for ray (outlined text field) */
.theme--light.v-text-field--outlined:not(.v-text-field--dense):not(.v-text-field--textarea) {
  border-color: rgb(45, 202, 45);
}

.v-btn--contained.orange {
  color: #fff;
  background-color: orange;
}

.background-container {
  background-image: url('https://i.ibb.co/fGhjxKM/nwowbg.jpg');
  width: 1600x;
  height: 900x;
}

.container {
  padding: 20px;
  border-radius: 10px;
}
</style>

