// Mock API Service for immediate functionality
class MockApiService {
  static async request(endpoint, options = {}) {
    // Simulate network delay
    await new Promise(resolve => setTimeout(resolve, 100));
    
    console.log(`Mock API call: ${endpoint}`, options);
    
    // Mock responses based on endpoint
    switch (endpoint) {
      case '/api/test':
        return {
          message: "Backend is working!",
          status: "success"
        };
        
      case '/api/auth/login':
        const body = JSON.parse(options.body || '{}');
        if (body.username === 'admin' && body.password === 'admin') {
          return {
            success: true,
            message: "Login successful",
            token: "demo-token-" + Date.now(),
            user: {
              id: 1,
              username: "admin",
              role: "admin"
            }
          };
        } else {
          throw new Error("Invalid credentials");
        }
        
      case '/api/content/all':
        return {
          success: true,
          data: {
            content: {
              heroTitle: "Transform Your Movement Performance",
              heroSubtitle: "Experience world-class movement training methodologies backed by scientific research and proven results.",
              aboutTitle: "Movement Performance Training",
              aboutDescription: "MPT specializes in movement performance training, helping athletes and fitness enthusiasts improve their movement quality, efficiency, and performance."
            },
            backgroundImage: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1920&h=1080&fit=crop"
          }
        };
        
      case '/api/content/update':
        return {
          success: true,
          message: "Content updated successfully"
        };
        
      case '/api/content/background/upload':
        return {
          success: true,
          message: "Background image updated successfully",
          data: {
            imageUrl: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1920&h=1080&fit=crop&t=" + Date.now()
          }
        };
        
      case '/api/content/gallery/upload':
        return {
          success: true,
          message: "Gallery item uploaded successfully",
          data: {
            id: Date.now(),
            title: "New Item",
            category: "training",
            imageUrl: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop&t=" + Date.now()
          }
        };
        
      case '/api/content/videos/upload':
        return {
          success: true,
          message: "Video uploaded successfully",
          data: {
            id: Date.now(),
            title: "New Video",
            description: "Video description",
            videoUrl: "https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4",
            thumbnailUrl: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=300&fit=crop"
          }
        };
        
      default:
        return {
          success: true,
          message: "Mock response for " + endpoint
        };
    }
  }
  
  static async get(endpoint) {
    return this.request(endpoint, { method: 'GET' });
  }
  
  static async post(endpoint, data) {
    return this.request(endpoint, {
      method: 'POST',
      body: JSON.stringify(data)
    });
  }
  
  static async put(endpoint, data) {
    return this.request(endpoint, {
      method: 'PUT',
      body: JSON.stringify(data)
    });
  }
  
  static async uploadFile(endpoint, file) {
    return this.request(endpoint, {
      method: 'POST',
      body: JSON.stringify({
        filename: file.name,
        size: file.size,
        type: file.type
      })
    });
  }
}

export default MockApiService;
