import axios from "axios"

export const AuthApi = {
  signup(data) {
    return axios.post("/signup", data)
  },
  login(data) {
    return axios.post("/auth/login", data)
  }
}

