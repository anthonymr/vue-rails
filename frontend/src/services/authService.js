import Service from './Service.js';

const resource = 'auth';

export default {
  login(email, password) {
    return Service.post(resource, {email, password});
  },

  logout(token) {
    return Service.delete(resource, {
        headers: {
          Authorization: 'Bearer ' + token,
        },
      });
  }
}