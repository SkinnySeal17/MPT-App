# 🚀 Live Deployment Guide - MPT Website

## 📋 Overview
This guide will help you deploy your MPT website to a live server that works exactly like your localhost.

## 🎯 What You'll Get
- **Live Website:** `https://mpt-frontend.onrender.com`
- **Live Backend:** `https://mpt-backend.onrender.com`
- **Live Admin:** `https://mpt-frontend.onrender.com/admin`
- **Live Database:** MySQL hosted on Render

## 🚀 Quick Deployment Steps

### Step 1: Prepare GitHub Repository
```bash
# If you don't have a GitHub repo yet:
1. Go to https://github.com
2. Create a new repository named "mpt"
3. Copy the repository URL
```

### Step 2: Connect to GitHub
```bash
# In your project directory:
git init
git add .
git commit -m "Initial commit - MPT website"
git remote add origin https://github.com/YOUR_USERNAME/mpt.git
git push -u origin main
```

### Step 3: Deploy to Render
1. **Go to:** https://render.com
2. **Sign up/Login** with your GitHub account
3. **Click "New +"** → **"Blueprint"**
4. **Connect your GitHub repository**
5. **Render will automatically detect the `render.yaml` file**
6. **Click "Apply"** to start deployment

## ⚙️ Environment Variables Setup

After deployment, set these environment variables in Render dashboard:

### Backend Service Environment Variables:
```
SPRING_PROFILES_ACTIVE=prod
DATABASE_URL=jdbc:mysql://${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}
DB_USERNAME=${MYSQL_USER}
DB_PASSWORD=${MYSQL_PASSWORD}
ALLOWED_ORIGINS=https://mpt-frontend.onrender.com
```

## 🔧 Manual Deployment (Alternative)

If you prefer manual deployment:

### Frontend Deployment:
1. Go to Render Dashboard
2. Click "New +" → "Static Site"
3. Connect your GitHub repo
4. Set:
   - **Name:** `mpt-frontend`
   - **Build Command:** `cd frontend && npm install && npm run build`
   - **Publish Directory:** `frontend/build`

### Backend Deployment:
1. Click "New +" → "Web Service"
2. Connect your GitHub repo
3. Set:
   - **Name:** `mpt-backend`
   - **Build Command:** `cd clean-spring-boot && ./mvnw clean package -DskipTests`
   - **Start Command:** `cd clean-spring-boot && java -jar target/mpt-0.0.1-SNAPSHOT.jar`

### Database Setup:
1. Click "New +" → "PostgreSQL" (or MySQL)
2. Set:
   - **Name:** `mpt-database`
   - **Database:** `mpt_db`

## 🌐 Your Live URLs

After deployment, your website will be available at:

- **🏠 Main Website:** `https://mpt-frontend.onrender.com`
- **🔧 Admin Panel:** `https://mpt-frontend.onrender.com/admin`
- **📊 Backend API:** `https://mpt-backend.onrender.com`
- **📡 API Health:** `https://mpt-backend.onrender.com/api/health`

## 🔐 Admin Access
- **Username:** `admin`
- **Password:** `admin`

## 📱 Features Available Live
✅ **Full website with all pages**  
✅ **Booking system**  
✅ **Admin panel**  
✅ **MySQL database**  
✅ **Real-time data**  
✅ **Mobile responsive**  

## 🛠️ Troubleshooting

### If deployment fails:
1. Check Render logs for errors
2. Verify all environment variables are set
3. Ensure GitHub repository is public or connected properly
4. Check that `render.yaml` is in the root directory

### If admin panel doesn't work:
1. Verify the backend URL is correct
2. Check CORS settings
3. Ensure database is connected

## 📞 Support
- **Render Support:** https://render.com/docs
- **GitHub Issues:** Create an issue in your repository

## 🎉 Success!
Once deployed, your website will work exactly like localhost but accessible to anyone worldwide!
