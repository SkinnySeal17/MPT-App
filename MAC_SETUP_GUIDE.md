# Movement Performance Training - Mac Setup Guide

## 🍎 Prerequisites for Mac

### 1. Install Homebrew (if not already installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Java 11 or higher
```bash
brew install openjdk@11
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### 3. Install Maven
```bash
brew install maven
```

### 4. Install Node.js and npm
```bash
brew install node
```

### 5. Verify installations
```bash
java -version
mvn -version
node --version
npm --version
```

## 🚀 Quick Start (Mac)

### Option 1: Start Both Servers Together
```bash
./start-both-mac.sh
```

### Option 2: Start Servers Separately

#### Start Backend Only
```bash
./start-backend-mac.sh
```

#### Start Frontend Only (in a new terminal)
```bash
./start-frontend-mac.sh
```

## 🔧 Manual Setup (if scripts don't work)

### Backend Setup
```bash
# Navigate to project root
cd /path/to/ppt-app

# Clean and compile
mvn clean compile

# Start backend
mvn spring-boot:run
```

### Frontend Setup (in a new terminal)
```bash
# Navigate to frontend directory
cd /path/to/ppt-app/frontend

# Install dependencies
npm install

# Start frontend
npm start
```

## 🌐 Access the Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8080
- **Admin Panel**: http://localhost:3000/admin
- **API Test**: http://localhost:8080/api/test

## 🔐 Admin Login

- **Username**: `admin`
- **Password**: `admin`

## ✨ Features Available

### ✅ Admin Panel Features
1. **Dashboard**: View statistics and overview
2. **Edit Content**: Update website text content dynamically
3. **Background Image**: Upload and change background images
4. **Upload Content**: Add images and videos to gallery
5. **Bookings Management**: View and manage bookings
6. **Gallery Management**: Manage image gallery
7. **Services Management**: Manage training services
8. **Testimonials**: Manage customer testimonials

### ✅ Dynamic Content
- Hero section title and subtitle
- About section content
- Background images
- Gallery images and videos
- All content updates in real-time

### ✅ Video Upload
- Upload videos through admin panel
- Videos appear on home page
- Support for MP4, MOV, AVI formats

## 🐛 Troubleshooting

### Backend Issues
```bash
# Check if port 8080 is in use
lsof -i :8080

# Kill process using port 8080
kill -9 $(lsof -t -i:8080)

# Check Java version
java -version

# Check Maven installation
mvn -version
```

### Frontend Issues
```bash
# Check if port 3000 is in use
lsof -i :3000

# Kill process using port 3000
kill -9 $(lsof -t -i:3000)

# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Common Mac Issues
1. **Permission denied**: Run `chmod +x *.sh` to make scripts executable
2. **Java not found**: Add Java to PATH in ~/.zshrc or ~/.bash_profile
3. **Port already in use**: Use `lsof -i :PORT` to find and kill processes
4. **Maven not found**: Install with `brew install maven`

## 📱 Testing the Application

### 1. Test Backend
```bash
curl http://localhost:8080/api/test
```

### 2. Test Frontend
Open http://localhost:3000 in your browser

### 3. Test Admin Login
1. Go to http://localhost:3000/admin
2. Login with admin/admin
3. Try updating content
4. Try uploading images/videos

### 4. Test Dynamic Content
1. Update content in admin panel
2. Refresh home page to see changes
3. Upload background image
4. Verify it appears on home page

## 🔄 Development Workflow

1. **Start both servers**: `./start-both-mac.sh`
2. **Make changes** to code
3. **Frontend auto-reloads** (React hot reload)
4. **Backend requires restart** for changes
5. **Test changes** in browser
6. **Use admin panel** to update content

## 📁 Project Structure
```
ppt-app/
├── src/main/java/com/mpt/mpt/     # Backend Java code
├── frontend/src/                  # Frontend React code
├── start-backend-mac.sh          # Mac backend script
├── start-frontend-mac.sh         # Mac frontend script
├── start-both-mac.sh             # Mac both servers script
└── MAC_SETUP_GUIDE.md            # This guide
```

## 🎯 Next Steps

1. **Customize Content**: Use admin panel to update text and images
2. **Add Real Database**: Replace in-memory storage with PostgreSQL
3. **Deploy**: Use services like Heroku, Vercel, or AWS
4. **Add Features**: Implement more admin functionality
5. **Styling**: Customize the design and branding

## 📞 Support

If you encounter issues:
1. Check the console logs for error messages
2. Verify all prerequisites are installed
3. Ensure both servers are running
4. Check the troubleshooting section above
5. Make sure ports 3000 and 8080 are available

The application is now fully functional with dynamic content management, admin login, and video upload capabilities!
