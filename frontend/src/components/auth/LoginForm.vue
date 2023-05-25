<template>
  <section class="form-container">
    <vue-basic-alert ref="alert" />

    <form @submit.prevent="login">
      <div>
        <label for="email">email</label>
        <input type="email" id="email" v-model="email" autocomplete="email" />
      </div>

      <div>
        <label for="password">password</label>
        <input type="password" id="password" v-model="password" autocomplete="current-password" />
      </div>

      <div>
        <button type="submit" :disabled="submitting">Login</button>
      </div>
    </form>
  </section>
</template>

<script>
import  authService  from '../../services/authService.js';

export default {
  name: 'LoginForm',

  data() {
    return {
      email: '',
      password: '',
      authService,
      submitting: false
    }
  },

  methods: {
    login() {
      if(!this.email || !this.password) {
        return this.$refs.alert.showAlert(
          'error', 
          'Missing Credentials', 
          'Please enter your email and password'
        );
      }

      this.submitting = true;

      this.authService.login(this.email, this.password)
        .then(({ data }) => {
          console.log(data.token);
          this.submitting = false;
          this.$router.push({ name: 'home' });
        })
        .catch(error => {
          this.submitting = false;

          if(error?.response?.data?.errors?.length){
            return this.$refs.alert.showAlert(
              'error', 
              'Invalid Credentials', 
              error.response.data.errors[0]
            );
          }

          this.$refs.alert.showAlert('error', error.code, error.message);
        });
    }
  }
}
</script>