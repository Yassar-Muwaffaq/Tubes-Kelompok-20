import axios from 'axios'
const API_URL = import.meta.env.VITE_API_BASE_URL //just incase aja butuh

export const CatApi = {
  getAll: () => axios.get('/cats'),
  add: (data) => axios.post('/add-cat', data),
}

