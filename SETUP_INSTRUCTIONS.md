# Movement Performance Training - Setup Instructions

## 🚀 Quick Start

### Prerequisites
- Java 11 or higher
- Node.js 16 or higher
- Maven 3.6 or higher

### Backend Setup (Java Spring Boot)

1. **Navigate to the project root directory**
   ```bash
   cd /path/to/ppt-app
   ```

2. **Start the backend server**
   ```bash
   # Windows
   start-backend.bat
   
   # Linux/Mac
   ./start-backend.sh
   
   # Or manually
   mvn spring-boot:run
   ```

3. **Verify backend is running**
   - Open http://localhost:8080/api/test
   - You should see: `{"message":"Backend is working!","status":"success"}`

### Frontend Setup (React)

1. **Navigate to frontend directory**
   ```bash
   cd frontend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the frontend server**
   ```bash
   # Windows
   start-frontend.bat
   
   # Linux/Mac
   ./start-frontend.sh
   
   # Or manually
   npm start
   ```

4. **Verify frontend is running**
   - Open http://localhost:3000
   - You should see the Movement Performance Training website

## 🔧 Features Implemented

### ✅ Backend Features
- **Authentication System**: Admin login with username/password
- **API Endpoints**: RESTful APIs for all functionality
- **File Upload**: Support for image and video uploads
- **CORS Support**: Cross-origin requests enabled
- **Database Integration**: JPA/Hibernate with H2 database

### ✅ Frontend Features
- **Responsive Design**: Mobile-friendly interface
- **Admin Dashboard**: Complete content management system
- **Booking System**: Online consultation booking
- **File Upload**: Image and video upload functionality
- **API Integration**: Full frontend-backend communication

### ✅ UI/UX Improvements
- **Logo Size**: Increased logo size for better visibility
- **Color Coordination**: Improved text visibility on booking and admin pages
- **Content Updates**: Changed from water sports to movement training focus
- **Form Styling**: Enhanced form inputs with better contrast

## 🔐 Admin Access

### Login Credentials
- **Username**: `admin`
- **Password**: `admin`
- **URL**: http://localhost:3000/admin

### Admin Features
- Dashboard with statistics
- Gallery management
- Services management
- Testimonials management
- Bookings management
- Content upload (images and videos)

## 📱 Testing the Application

### 1. Test Backend Endpoints
```bash
# Run the test script
node test-backend.js
```

### 2. Test Frontend-Backend Integration
1. Open http://localhost:3000
2. Navigate to the booking page
3. Fill out the consultation form
4. Submit and verify the booking is created

### 3. Test Admin Functionality
1. Go to http://localhost:3000/admin
2. Login with admin/admin
3. Test the upload functionality
4. Verify all admin features work

## 🐛 Troubleshooting

### Backend Issues
- **Port 8080 in use**: Change port in `src/main/resources/application.properties`
- **Database errors**: Check H2 console at http://localhost:8080/h2-console
- **CORS errors**: Verify `@CrossOrigin` annotations are present

### Frontend Issues
- **Port 3000 in use**: React will automatically suggest port 3001
- **API connection errors**: Verify backend is running on port 8080
- **Build errors**: Run `npm install` to ensure all dependencies are installed

### Common Solutions
1. **Clear browser cache** if you see old content
2. **Restart both servers** if changes aren't reflected
3. **Check console logs** for detailed error messages
4. **Verify file permissions** for upload functionality

## 📁 Project Structure

```
ppt-app/
├── src/main/java/com/mpt/mpt/          # Backend Java code
│   ├── AuthController.java             # Authentication endpoints
│   ├── AdminController.java            # Admin management endpoints
│   ├── BookingController.java          # Booking endpoints
│   └── MainController.java             # Main API endpoints
├── frontend/                           # React frontend
│   ├── src/
│   │   ├── components/                 # Reusable components
│   │   ├── pages/                      # Page components
│   │   ├── services/                   # API services
│   │   └── config/                     # Configuration
│   └── public/                         # Static assets
└── test-backend.js                     # Backend testing script
```

## 🎯 Next Steps

1. **Customize Content**: Update text, images, and branding
2. **Add Real Database**: Replace H2 with PostgreSQL/MySQL
3. **Implement Real Authentication**: Add JWT tokens and user management
4. **Add Email Notifications**: Send booking confirmations
5. **Deploy to Production**: Use services like Heroku, AWS, or Vercel

## 📞 Support

If you encounter any issues:
1. Check the console logs for error messages
2. Verify all prerequisites are installed
3. Ensure both servers are running
4. Check the troubleshooting section above

The application is now fully functional with frontend-backend communication, admin login, and content upload capabilities!
