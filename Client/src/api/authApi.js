// src/api/authApi.js
import axios from "axios"

export const AuthApi = {
  // ambil user profile
  getProfile(userId) {
    return axios.get(`/profile/${userId}`);
  },

  // update user profile
  updateProfile(userId, payload) {
    return axios.put(`/profile/${userId}`, payload);
  },

  // login
  login(data) {
    return axios.post("/auth/login", data);
  }
};

