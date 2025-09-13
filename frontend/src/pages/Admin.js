import React, { useState, useEffect } from 'react';
import authService from '../services/authService';
import contentService from '../services/contentService';
import { galleryService } from '../services/galleryService';
import { servicesService } from '../services/servicesService';
import { testimonialsService } from '../services/testimonialsService';
import { bookingsService } from '../services/bookingsService';
import adminService  from '../services/adminService';
import { packagesService } from '../services/packagesService';
import './Admin.css';

const Admin = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [activeTab, setActiveTab] = useState('dashboard');
  const [uploadData, setUploadData] = useState({
    title: '',
    description: '',
    category: 'training',
    file: null
  });
  const [contentData, setContentData] = useState({
    heroTitle: '',
    heroSubtitle: '',
    aboutTitle: '',
    aboutDescription: ''
  });
  const [backgroundFile, setBackgroundFile] = useState(null);

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await authService.login({ username, password });
      if (response.success) {
        setIsLoggedIn(true);
        setUsername('');
        setPassword('');
        console.log('Login successful:', response);
        // Load current content
        await loadContent();
      } else {
        alert(`Login failed: ${response.message}`);
      }
    } catch (error) {
      console.error('Login error:', error);
      alert(`Login failed: ${error.message}`);
    }
  };

  const loadContent = async () => {
    try {
      const response = await contentService.getAllContent();
      if (response.success && response.data.content) {
        setContentData(response.data.content);
      }
    } catch (error) {
      console.error('Error loading content:', error);
    }
  };

  const handleContentUpdate = async (e) => {
    e.preventDefault();
    try {
      const response = await contentService.updateContent(contentData);
      if (response.success) {
        alert('Content updated successfully!');
      } else {
        alert(`Update failed: ${response.message}`);
      }
    } catch (error) {
      alert(`Update failed: ${error.message}`);
    }
  };

  const handleBackgroundUpload = async (e) => {
    e.preventDefault();
    if (!backgroundFile) {
      alert('Please select a background image');
      return;
    }

    try {
      const response = await contentService.uploadBackgroundImage(backgroundFile);
      if (response.success) {
        alert('Background image updated successfully!');
        setBackgroundFile(null);
      } else {
        alert(`Upload failed: ${response.message}`);
      }
    } catch (error) {
      alert(`Upload failed: ${error.message}`);
    }
  };

  const handleLogout = async () => {
    try {
      await authService.logout();
      setIsLoggedIn(false);
      setActiveTab('dashboard');
    } catch (error) {
      console.error('Logout error:', error);
      // Still logout locally even if backend call fails
      setIsLoggedIn(false);
      setActiveTab('dashboard');
    }
  };

  const handleFileUpload = async (e) => {
    e.preventDefault();
    if (!uploadData.file) {
      alert('Please select a file to upload');
      return;
    }

    try {
      if (uploadData.file.type.startsWith('video/')) {
        await adminService.uploadVideo(uploadData.file, uploadData.title, uploadData.description);
        alert('Video uploaded successfully!');
      } else {
        await adminService.uploadGalleryItem(uploadData.file, uploadData.title, uploadData.category);
        alert('Image uploaded successfully!');
      }
      
      // Reset form
      setUploadData({
        title: '',
        description: '',
        category: 'training',
        file: null
      });
    } catch (error) {
      alert(`Upload failed: ${error.message}`);
    }
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    setUploadData(prev => ({ ...prev, file }));
  };

  if (!isLoggedIn) {
    return (
      <div className="admin-login">
        <div className="login-container">
          <div className="login-header">
            <div className="admin-logo">
              <div className="admin-logo-icon">🌊</div>
              <h1>Admin Dashboard</h1>
            </div>
            <p>Login to manage your website content</p>
          </div>
          
          <form className="login-form" onSubmit={handleLogin}>
            <div className="form-group">
              <label htmlFor="username">Username</label>
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>
            
            <div className="form-group">
              <label htmlFor="password">Password</label>
              <input
                type="password"
                id="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            
            <button type="submit" className="login-btn">Login</button>
          </form>
          
          <div className="login-info">
            <p><strong>Admin Login:</strong></p>
            <p>Use your backend admin credentials</p>
            <p>Contact your system administrator</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="admin-dashboard">
      <div className="admin-header">
        <div className="admin-header-content">
          <div className="admin-brand">
            <div className="admin-brand-icon">🌊</div>
            <h1>Admin Dashboard</h1>
          </div>
          <button className="logout-btn" onClick={handleLogout}>
            Logout
          </button>
        </div>
      </div>

      <div className="admin-content">
        <div className="admin-sidebar">
          <nav className="admin-nav">
            <button
              className={`nav-item ${activeTab === 'dashboard' ? 'active' : ''}`}
              onClick={() => setActiveTab('dashboard')}
            >
              📊 Dashboard
            </button>
            <button
              className={`nav-item ${activeTab === 'gallery' ? 'active' : ''}`}
              onClick={() => setActiveTab('gallery')}
            >
              🖼️ Gallery Management
            </button>
            <button
              className={`nav-item ${activeTab === 'services' ? 'active' : ''}`}
              onClick={() => setActiveTab('services')}
            >
              🎯 Services Management
            </button>
            <button
              className={`nav-item ${activeTab === 'testimonials' ? 'active' : ''}`}
              onClick={() => setActiveTab('testimonials')}
            >
              💬 Testimonials
            </button>
            <button
              className={`nav-item ${activeTab === 'bookings' ? 'active' : ''}`}
              onClick={() => setActiveTab('bookings')}
            >
              📅 Bookings
            </button>
            <button
              className={`nav-item ${activeTab === 'upload' ? 'active' : ''}`}
              onClick={() => setActiveTab('upload')}
            >
              📤 Upload Content
            </button>
            <button
              className={`nav-item ${activeTab === 'content' ? 'active' : ''}`}
              onClick={() => setActiveTab('content')}
            >
              ✏️ Edit Content
            </button>
            <button
              className={`nav-item ${activeTab === 'background' ? 'active' : ''}`}
              onClick={() => setActiveTab('background')}
            >
              🖼️ Background Image
            </button>
          </nav>
        </div>

        <div className="admin-main">
          {activeTab === 'dashboard' && (
            <div className="dashboard-overview">
              <h2>Dashboard Overview</h2>
              <div className="stats-grid">
                <div className="stat-card">
                  <h3>Total Gallery Items</h3>
                  <p className="stat-number">24</p>
                  <p className="stat-label">Images & Videos</p>
                </div>
                <div className="stat-card">
                  <h3>Active Services</h3>
                  <p className="stat-number">6</p>
                  <p className="stat-label">Training Programs</p>
                </div>
                <div className="stat-card">
                  <h3>Testimonials</h3>
                  <p className="stat-number">12</p>
                  <p className="stat-label">Customer Reviews</p>
                </div>
                <div className="stat-card">
                  <h3>Recent Bookings</h3>
                  <p className="stat-number">8</p>
                  <p className="stat-label">This Week</p>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'gallery' && (
            <div className="gallery-management">
              <div className="section-header">
                <h2>Gallery Management</h2>
                <button className="add-btn">+ Add New Item</button>
              </div>
              
              <div className="gallery-grid">
                <div className="gallery-item">
                  <img src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200&h=200&fit=crop" alt="Gallery Item" />
                  <div className="gallery-item-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="gallery-item">
                  <img src="https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=200&h=200&fit=crop" alt="Gallery Item" />
                  <div className="gallery-item-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="gallery-item">
                  <img src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200&h=200&fit=crop" alt="Gallery Item" />
                  <div className="gallery-item-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="gallery-item">
                  <img src="https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=200&h=200&fit=crop" alt="Gallery Item" />
                  <div className="gallery-item-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'services' && (
            <div className="services-management">
              <div className="section-header">
                <h2>Services Management</h2>
                <button className="add-btn">+ Add New Service</button>
              </div>
              
              <div className="services-list">
                <div className="service-item">
                  <h3>Kitesurfing Training</h3>
                  <p>Comprehensive kitesurfing lessons for all skill levels</p>
                  <div className="service-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="service-item">
                  <h3>Hydrofoil Training</h3>
                  <p>Master the art of hydrofoiling with expert instructors</p>
                  <div className="service-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="service-item">
                  <h3>Wing Foil Training</h3>
                  <p>Discover the exciting world of wing foiling</p>
                  <div className="service-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'testimonials' && (
            <div className="testimonials-management">
              <div className="section-header">
                <h2>Testimonials Management</h2>
                <button className="add-btn">+ Add New Testimonial</button>
              </div>
              
              <div className="testimonials-list">
                <div className="testimonial-item">
                  <div className="testimonial-content">
                    <p>"im happy"</p>
                    <span className="testimonial-author">- Customer 1</span>
                  </div>
                  <div className="testimonial-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
                <div className="testimonial-item">
                  <div className="testimonial-content">
                    <p>"me too"</p>
                    <span className="testimonial-author">- Customer 2</span>
                  </div>
                  <div className="testimonial-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Delete</button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'bookings' && (
            <div className="bookings-management">
              <div className="section-header">
                <h2>Bookings Management</h2>
                <button className="add-btn">+ Add New Booking</button>
              </div>
              
              <div className="bookings-list">
                <div className="booking-item">
                  <div className="booking-info">
                    <h3>John Doe</h3>
                    <p>Movement Training - Beginner</p>
                    <p>Date: Dec 15, 2024</p>
                    <p>Status: Confirmed</p>
                  </div>
                  <div className="booking-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Cancel</button>
                  </div>
                </div>
                <div className="booking-item">
                  <div className="booking-info">
                    <h3>Jane Smith</h3>
                    <p>Performance Training - Intermediate</p>
                    <p>Date: Dec 18, 2024</p>
                    <p>Status: Pending</p>
                  </div>
                  <div className="booking-actions">
                    <button className="edit-btn">Edit</button>
                    <button className="delete-btn">Cancel</button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'upload' && (
            <div className="upload-management">
              <div className="section-header">
                <h2>Content Upload</h2>
                <p>Upload images and videos for your training content</p>
              </div>
              
              <form onSubmit={handleFileUpload} className="upload-form">
                <div className="form-group">
                  <label htmlFor="title">Title *</label>
                  <input
                    type="text"
                    id="title"
                    value={uploadData.title}
                    onChange={(e) => setUploadData(prev => ({ ...prev, title: e.target.value }))}
                    required
                    placeholder="Enter content title"
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="description">Description</label>
                  <textarea
                    id="description"
                    value={uploadData.description}
                    onChange={(e) => setUploadData(prev => ({ ...prev, description: e.target.value }))}
                    placeholder="Enter content description"
                    rows="3"
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="category">Category</label>
                  <select
                    id="category"
                    value={uploadData.category}
                    onChange={(e) => setUploadData(prev => ({ ...prev, category: e.target.value }))}
                  >
                    <option value="training">Training</option>
                    <option value="facility">Facility</option>
                    <option value="equipment">Equipment</option>
                    <option value="testimonial">Testimonial</option>
                  </select>
                </div>

                <div className="form-group">
                  <label htmlFor="file">File *</label>
                  <input
                    type="file"
                    id="file"
                    accept="image/*,video/*"
                    onChange={handleFileChange}
                    required
                  />
                  <small>Supported formats: Images (JPG, PNG, GIF) and Videos (MP4, MOV, AVI)</small>
                </div>

                <button type="submit" className="upload-btn">
                  📤 Upload Content
                </button>
              </form>
            </div>
          )}

          {activeTab === 'content' && (
            <div className="content-management">
              <div className="section-header">
                <h2>Edit Website Content</h2>
                <p>Update the text content displayed on your website</p>
              </div>
              
              <form onSubmit={handleContentUpdate} className="content-form">
                <div className="form-group">
                  <label htmlFor="heroTitle">Hero Title *</label>
                  <input
                    type="text"
                    id="heroTitle"
                    value={contentData.heroTitle}
                    onChange={(e) => setContentData(prev => ({ ...prev, heroTitle: e.target.value }))}
                    required
                    placeholder="Enter hero title"
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="heroSubtitle">Hero Subtitle *</label>
                  <textarea
                    id="heroSubtitle"
                    value={contentData.heroSubtitle}
                    onChange={(e) => setContentData(prev => ({ ...prev, heroSubtitle: e.target.value }))}
                    required
                    placeholder="Enter hero subtitle"
                    rows="3"
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="aboutTitle">About Section Title *</label>
                  <input
                    type="text"
                    id="aboutTitle"
                    value={contentData.aboutTitle}
                    onChange={(e) => setContentData(prev => ({ ...prev, aboutTitle: e.target.value }))}
                    required
                    placeholder="Enter about title"
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="aboutDescription">About Description *</label>
                  <textarea
                    id="aboutDescription"
                    value={contentData.aboutDescription}
                    onChange={(e) => setContentData(prev => ({ ...prev, aboutDescription: e.target.value }))}
                    required
                    placeholder="Enter about description"
                    rows="4"
                  />
                </div>

                <button type="submit" className="update-btn">
                  💾 Update Content
                </button>
              </form>
            </div>
          )}

          {activeTab === 'background' && (
            <div className="background-management">
              <div className="section-header">
                <h2>Background Image Management</h2>
                <p>Upload and manage the background image for your website</p>
              </div>
              
              <form onSubmit={handleBackgroundUpload} className="background-form">
                <div className="form-group">
                  <label htmlFor="backgroundFile">Background Image *</label>
                  <input
                    type="file"
                    id="backgroundFile"
                    accept="image/*"
                    onChange={(e) => setBackgroundFile(e.target.files[0])}
                    required
                  />
                  <small>Supported formats: JPG, PNG, GIF. Recommended size: 1920x1080px</small>
                </div>

                <button type="submit" className="upload-btn">
                  🖼️ Update Background Image
                </button>
              </form>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Admin; 