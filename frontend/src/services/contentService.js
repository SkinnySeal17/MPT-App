import apiService from './api';

class ContentService {
  // Get all website content
  async getAllContent() {
    try {
      return await apiService.get('/content/all');
    } catch (error) {
      console.error('Error fetching content:', error);
      throw error;
    }
  }

  // Update website content
  async updateContent(contentData) {
    try {
      return await apiService.post('/content/update', contentData);
    } catch (error) {
      console.error('Error updating content:', error);
      throw error;
    }
  }

  // Upload background image
  async uploadBackgroundImage(file) {
    try {
      const formData = new FormData();
      formData.append('file', file);
      
      const response = await fetch(`${apiService.baseURL}/api/content/background/upload`, {
        method: 'POST',
        body: formData,
      });
      
      const data = await response.json();
      
      if (!response.ok) {
        throw new Error(data.message || 'Upload failed');
      }
      
      return data;
    } catch (error) {
      console.error('Error uploading background image:', error);
      throw error;
    }
  }

  // Upload gallery item
  async uploadGalleryItem(file, title, category) {
    try {
      return await apiService.uploadFile('/content/gallery/upload', file, { title, category });
    } catch (error) {
      console.error('Error uploading gallery item:', error);
      throw error;
    }
  }

  // Upload video
  async uploadVideo(file, title, description) {
    try {
      return await apiService.uploadFile('/content/videos/upload', file, { title, description });
    } catch (error) {
      console.error('Error uploading video:', error);
      throw error;
    }
  }

  // Get gallery items
  async getGallery() {
    try {
      return await apiService.get('/content/gallery');
    } catch (error) {
      console.error('Error fetching gallery:', error);
      throw error;
    }
  }

  // Get videos
  async getVideos() {
    try {
      return await apiService.get('/content/videos');
    } catch (error) {
      console.error('Error fetching videos:', error);
      throw error;
    }
  }
}

export default new ContentService();
