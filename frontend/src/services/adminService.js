import apiService from './api';

class AdminService {
  // Get admin dashboard data
  async getDashboardData() {
    return await apiService.get('/admin/dashboard');
  }

  // Get system statistics
  async getSystemStats() {
    return await apiService.get('/admin/stats');
  }

  // Get user management data
  async getUsers() {
    return await apiService.get('/admin/users');
  }

  // Update user role
  async updateUserRole(userId, role) {
    return await apiService.put(`/admin/users/${userId}/role`, { role });
  }

  // Delete user
  async deleteUser(userId) {
    return await apiService.delete(`/admin/users/${userId}`);
  }

  // Upload gallery item
  async uploadGalleryItem(file, title, category) {
    return await apiService.uploadFile('/admin/gallery/upload', file, { title, category });
  }

  // Upload video
  async uploadVideo(file, title, description) {
    return await apiService.uploadFile('/admin/videos/upload', file, { title, description });
  }
}

export default new AdminService();
