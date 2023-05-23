<template>
  <div>
    <button @click="login">Login</button>
    <button @click="getUsers" v-if="token">Get Users</button>
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
    login() {
      authService.login( this.email, this.password )
      .then( ({ data }) => this.token = data.token )
      .catch( error => console.error(error) );
    },

    getUsers() {
      if(!this.token) return;

      userSevice.index( this.token )
        .then( ({ data }) => this.users = data )
        .catch( error => console.error(error) );
    },

    logout() {
      if(!this.token) return;

      authService.logout(this.token)
      .then( () => this.clearData() )
      .catch( error => console.error(error) );
    },

    clearData() {
      this.token = '';
      this.users = [];
    }
  },
}
</script>