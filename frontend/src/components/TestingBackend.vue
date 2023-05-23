<template>
  <div>
    <button @click="login">Login</button>
    <div>
      {{ token }}
    </div>
    <button @click="getUsers">Get Users</button>
    <ul>
      <li v-for="user in users">
        {{ user.email }}
      </li>
    </ul>
    <button @click="logout">Logout</button>
  </div>
</template>

<script>
import  authService  from '../services/authService.js';
import  userSevice  from '../services/userService.js';

export default {
  data() {
    return {
      email: 'anthonymartin20@gmail.com',
      password: '2601tony',
      url: 'http://localhost:3000/',
      token: '',
      users: []
    }
  },

  methods: {
    async login() {
      try {
        const { data } = await authService.login( this.email, this.password );

        this.token = data.token;
      } catch (error) {
        console.error(error);
      }
    },
    async getUsers() {
      if(!this.token) return;

      try {
        const { data } = await userSevice.index( this.token );

        this.users = data;
      } catch (error) {
        console.error(error);
      }
    },
    async logout() {
      if(!this.token) return;

      try {
        await authService.logout(this.token);

        this.token = '';
        this.users = [];
      } catch (error) {
        console.error(error);
      }
    }
  },
}
</script>