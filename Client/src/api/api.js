<<<<<<< HEAD
import axios from "axios";
const api = axios.create({
  baseURL: "http://localhost:5000/api", // Sesuaikan port backend
  headers: { "Content-Type": "application/json" }
});
export default api;
=======
import axios from 'axios'
const API_URL = import.meta.env.VITE_API_BASE_URL //just incase aja

export const CatApi = {
  getAll: () => axios.get('/cats'),
  add: (data) => axios.post('/add-cat', data),
}


>>>>>>> 494cb00548449884cfd4b65249dd6f8b89415332
