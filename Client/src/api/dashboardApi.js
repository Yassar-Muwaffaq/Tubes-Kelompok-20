import axios from "axios";

const UPLOAD_URL = "http://localhost:5000/uploads/";

export const DashboardApi = {
    // Ambil data laporan
    async getReports() {
        const res = await axios.get("/reports");

        if (!res.data.success) return res;

        // Tambahkan full URL gambar laporan
        const reports = res.data.data.map(r => ({
            ...r,
            image_url: r.image ? UPLOAD_URL + r.image : null
        }));

        return {
            data: {
                success: true,
                data: reports
            }
        };
    },

    // Ambil data user
    async getUsers() {
        const res = await axios.get("/users");

        if (!res.data.success) return res;

        // Tambahkan full URL gambar profile user
        const users = res.data.data.map(u => ({
            ...u,
            profile_image_url: u.profile_image
                ? UPLOAD_URL + u.profile_image
                : null
        }));

        return {
            data: {
                success: true,
                data: users
            }
        };
    },

    // Helper untuk bikin URL upload
    getImageUrl(filename) {
        return filename ? UPLOAD_URL + filename : null;
    }
};
