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
      const endpoint = 'auth';

      this.axios.post(this.url + endpoint, {
        email: this.email,
        password: this.password,
      })
      .then((response) => {
        console.log(response.data);
        this.token = response.data.token;
      })
      .catch((error) => {
        console.error(error);
      });
    },
    getUsers() {
      const endpoint = 'users';

      this.axios.get(this.url + endpoint, {
        headers: {
          Authorization: 'Bearer ' + this.token,
        },
      })
      .then((response) => {
        this.users = response.data;
      })
      .catch((error) => {
        console.error(error);
      });
    },
    logout() {
      const endpoint = 'auth';

      this.axios.delete(this.url + endpoint, {
        headers: {
          Authorization: 'Bearer ' + this.token,
        },
      })
      .then(() => {
        this.token = '';
        this.users = [];
      })
      .catch((error) => {
        console.error(error);
      });
    }
  },
}
</script>