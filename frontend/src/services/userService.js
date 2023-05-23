import Service from './Service.js';

const resource = 'users';

export default {
  index(token) {
    return Service.get(resource, {
      headers: {
        Authorization: 'Bearer ' + token,
      },
    });
  },
}