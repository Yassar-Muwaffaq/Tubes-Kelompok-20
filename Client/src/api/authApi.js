import axios from "axios";

export const AuthApi = {
  // REGISTER
  signup(data) {
    return axios.post("/auth/signup", data);
  },

  // LOGIN
  login(data) {
    return axios.post("/auth/login", data);
  },

  // GET PROFILE
  getProfile(userId) {
    return axios.get(`/profile/${userId}`);
  },

  // UPDATE PROFILE
  updateProfile(userId, payload) {
    return axios.put(`/profile/${userId}`, payload);
  }
};
