# 🏄‍♀️ Movement Performance Training - Complete Website Solution

A professional, full-stack web application for Movement Performance Training, featuring a modern React frontend and robust Spring Boot backend with integrated database management.

## ✨ What This Website Includes

- 🎨 **Beautiful Frontend**: Modern, responsive React website
- ⚡ **Powerful Backend**: Spring Boot API with Java 21
- 🗄️ **Database Management**: H2 database with sample data
- 📅 **Booking System**: Complete customer booking management
- 👨‍💼 **Admin Panel**: Easy content and booking management
- 📱 **Mobile Responsive**: Works perfectly on all devices
- 🚀 **Ready to Deploy**: Easy setup and deployment options

## 🚀 Quick Start (3 Easy Steps)

### Step 1: Download Required Software
- **Java 21**: Download from [adoptium.net](https://adoptium.net/)
- **Node.js**: Download from [nodejs.org](https://nodejs.org/)

### Step 2: Run Setup
1. Download this project as a ZIP file
2. Extract to a folder (e.g., `C:\mpt-website\`)
3. Double-click `setup.bat` to install dependencies

### Step 3: Start Your Website
- **Easiest**: Double-click `start-both.bat`
- **Manual**: Run `start-backend.bat` then `start-frontend.bat`
- **Open**: Go to `http://localhost:3000` in your browser

**🎉 That's it! Your website is now running!**

> 📖 **Need detailed instructions?** See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for complete setup guide for non-technical users.

## 🏗️ Project Structure

```
ppt-app/
├── src/                          # Spring Boot Backend
│   ├── main/
│   │   ├── java/com/mpt/mpt/
│   │   │   ├── MptApplication.java      # Main Spring Boot application
│   │   │   ├── BookingController.java   # Booking API endpoints
│   │   │   ├── MainController.java      # Main API endpoints
│   │   │   ├── HealthController.java    # Health check endpoints
│   │   │   ├── WebController.java       # Web page serving
│   │   │   ├── TestController.java      # Test endpoints
│   │   │   ├── entity/                  # JPA entities
│   │   │   ├── repository/              # Data repositories
│   │   │   └── service/                 # Business logic services
│   │   └── resources/
│   │       ├── application.properties   # Spring configuration
│   │       ├── schema.sql              # Database schema
│   │       └── data.sql                # Sample data
│   └── test/                          # Test files
├── frontend/                        # React Frontend
│   ├── src/
│   │   ├── components/               # Reusable React components
│   │   ├── pages/                    # Page components
│   │   ├── services/                 # API service classes
│   │   ├── config/                   # Configuration files
│   │   └── App.js                    # Main App component
│   ├── public/                       # Static assets
│   └── package.json                  # Frontend dependencies
├── pom.xml                          # Maven configuration
└── README.md                        # This file
```

## 🔧 Configuration

### Backend Configuration
- **Port**: 8080
- **Database**: H2 (file-based, located in `./data/mpt-db`)
- **CORS**: Configured for `http://localhost:3000` and `http://localhost:3001`
- **H2 Console**: Enabled at `http://localhost:8080/h2-console`

### Frontend Configuration
- **Port**: 3000
- **API Base URL**: `http://localhost:8080`
- **Development Server**: React development server with hot reload

## 📚 API Endpoints

### Main Endpoints
- `GET /api/test` - Test endpoint
- `GET /api/health` - Health check
- `GET /api/packages` - Get all packages
- `GET /api/services` - Get all services
- `GET /api/testimonials` - Get all testimonials
- `GET /api/gallery` - Get gallery items

### Booking Endpoints
- `GET /api/bookings` - Get all bookings
- `POST /api/bookings/create` - Create new booking
- `GET /api/bookings/{id}` - Get booking by ID
- `PUT /api/bookings/{id}` - Update booking
- `DELETE /api/bookings/{id}` - Delete booking

### Web Endpoints
- `GET /` - Main website
- `GET /admin` - Admin panel
- `GET /debug` - Debug information

## 🗄️ Database Schema

The application uses H2 database with the following tables:
- **bookings**: Customer booking information
- **packages**: Training packages and pricing
- **services**: Available services
- **testimonials**: Customer testimonials

## 🎨 Frontend Features

- **Responsive Design**: Mobile-first approach
- **Modern UI**: Clean and professional interface
- **Component-Based**: Reusable React components
- **State Management**: Local state with React hooks
- **API Integration**: Seamless backend communication

## 🔧 Development

### Running Tests
```bash
# Backend tests
mvn test

# Frontend tests
cd frontend
npm test
```

### Building for Production
```bash
# Build frontend
cd frontend
npm run build

# Build backend (includes frontend build)
mvn clean package
```

### Database Management
- Access H2 Console: `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:file:./data/mpt-db`
- Username: `sa`
- Password: `password`

## 🚀 Features

### Customer Features
- Browse training packages and services
- View gallery and testimonials
- Book training sessions
- Contact form submission

### Admin Features
- View all bookings
- Manage packages and services
- Approve testimonials
- System monitoring

## 🛠️ Troubleshooting

### Common Issues

1. **Port Already in Use**
   - Backend: Change port in `src/main/resources/application.properties`
   - Frontend: Use `npm start -- --port 3001`

2. **Database Connection Issues**
   - Ensure H2 database files are not locked
   - Check database path in `application.properties`

3. **CORS Issues**
   - Verify CORS configuration in `MptApplication.java`
   - Check frontend API base URL

4. **Java Version Issues**
   - Ensure Java 21 is installed and set as JAVA_HOME
   - Verify Maven is using correct Java version

### Logs
- Backend logs: Check console output
- Frontend logs: Check browser console
- Database logs: Available in H2 console

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

For support and questions:
- Email: chloebarrettraining@icloud.com
- Phone: 04 98 471 509
- Location: Birtinya, QLD 4575

---

**Note**: This application is configured for localhost development only. All deployment-related files have been removed for a clean development experience.