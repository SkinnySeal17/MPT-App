# 🚀 Complete Deployment Guide for Movement Performance Training Website

## 📋 Table of Contents
1. [What You Need](#what-you-need)
2. [Quick Start (Easiest Method)](#quick-start-easiest-method)
3. [Mac Setup Instructions](#mac-setup-instructions)
4. [Windows Setup Instructions](#windows-setup-instructions)
5. [Running Your Website](#running-your-website)
6. [Making Changes to Your Website](#making-changes-to-your-website)
7. [Troubleshooting](#troubleshooting)
8. [Getting Help](#getting-help)

---

## 🎯 What You Need

### Required Software (Free Downloads)
1. **Java 21** - The programming language your website uses
2. **Node.js** - For the website's frontend
3. **Git** - To manage your code (optional but recommended)

### What This Website Includes
- ✅ **Frontend**: Beautiful, responsive website with booking system
- ✅ **Backend**: Server that handles data and bookings
- ✅ **Database**: Stores all your customer information
- ✅ **Admin Panel**: Manage bookings, packages, and testimonials
- ✅ **Booking System**: Customers can book training sessions
- ✅ **Contact Forms**: Easy communication with customers

---

## 🚀 Quick Start (Easiest Method)

### Step 1: Download Required Software

#### Download Java 21
1. Go to: https://adoptium.net/
2. Click "Download" for Java 21 (LTS)
3. Choose Windows x64 installer
4. Run the installer and follow the instructions
5. **Important**: Make sure to check "Set JAVA_HOME" during installation

#### Download Node.js
1. Go to: https://nodejs.org/
2. Download the LTS version (recommended)
3. Run the installer and follow the instructions
4. **Important**: Make sure to check "Add to PATH" during installation

### Step 2: Download Your Website
1. Download the website files as a ZIP file
2. Extract the ZIP file to a folder:
   - **Windows**: `C:\mpt-website\`
   - **Mac**: `~/Desktop/mpt-website/` or `~/Documents/mpt-website/`

### Step 3: Start Your Website

#### For Windows Users:
1. Open Command Prompt (Press Windows + R, type `cmd`, press Enter)
2. Navigate to your website folder:
   ```cmd
   cd C:\mpt-website
   ```
3. Run the setup script:
   ```cmd
   setup.bat
   ```
4. Start your website:
   ```cmd
   start-both.bat
   ```

#### For Mac Users:
1. Open Terminal (Press Cmd + Space, type "Terminal", press Enter)
2. Navigate to your website folder:
   ```bash
   cd ~/Desktop/mpt-website
   ```
3. Make scripts executable and run setup:
   ```bash
   chmod +x *.sh
   ./setup.sh
   ```
4. Start your website:
   ```bash
   ./start-both.sh
   ```

### Step 4: Access Your Website
Open your web browser and go to: `http://localhost:3000`

**🎉 Congratulations! Your website is now running!**

---

## 🍎 Mac Setup Instructions

### Installing Java 21 on Mac

1. **Download Java 21**:
   - Visit: https://adoptium.net/
   - Select "Temurin 21 (LTS)"
   - Choose macOS (ARM64 for M1/M2 Macs, x64 for Intel Macs)
   - Download the PKG installer

2. **Install Java 21**:
   - Run the downloaded PKG file
   - Follow the installation wizard
   - **CRITICAL**: The installer will automatically set up JAVA_HOME
   - Complete the installation

3. **Verify Installation**:
   - Open Terminal (Cmd + Space, type "Terminal")
   - Type: `java -version`
   - You should see "openjdk version 21.x.x"

### Installing Node.js on Mac

1. **Download Node.js**:
   - Visit: https://nodejs.org/
   - Download the LTS version (Long Term Support)
   - Choose the macOS Installer (.pkg)

2. **Install Node.js**:
   - Run the downloaded PKG file
   - Follow the installation wizard
   - **CRITICAL**: The installer will automatically add Node.js to PATH
   - Complete the installation

3. **Verify Installation**:
   - Open Terminal
   - Type: `node --version`
   - You should see a version number like "v18.x.x"

### Setting Up Your Website on Mac

1. **Download Website Files**:
   - Download the complete website as a ZIP file
   - Extract to a folder like `~/Desktop/mpt-website/`

2. **Install Website Dependencies**:
   - Open Terminal
   - Navigate to your website folder:
     ```bash
     cd ~/Desktop/mpt-website
     ```
   - Make scripts executable:
     ```bash
     chmod +x *.sh
     ```
   - Install frontend dependencies:
     ```bash
     ./setup.sh
     ```

---

## 🪟 Windows Setup Instructions

### Installing Java 21

1. **Download Java 21**:
   - Visit: https://adoptium.net/
   - Select "Temurin 21 (LTS)"
   - Choose your operating system (Windows)
   - Download the MSI installer

2. **Install Java 21**:
   - Run the downloaded MSI file
   - Follow the installation wizard
   - **CRITICAL**: Check "Set JAVA_HOME variable"
   - **CRITICAL**: Check "Add to PATH"
   - Complete the installation

3. **Verify Installation**:
   - Open Command Prompt
   - Type: `java -version`
   - You should see "openjdk version 21.x.x"

### Installing Node.js

1. **Download Node.js**:
   - Visit: https://nodejs.org/
   - Download the LTS version (Long Term Support)
   - Choose the Windows Installer (.msi)

2. **Install Node.js**:
   - Run the downloaded MSI file
   - Follow the installation wizard
   - **CRITICAL**: Check "Add to PATH"
   - Complete the installation

3. **Verify Installation**:
   - Open Command Prompt
   - Type: `node --version`
   - You should see a version number like "v18.x.x"

### Setting Up Your Website

1. **Download Website Files**:
   - Download the complete website as a ZIP file
   - Extract to a folder like `C:\mpt-website\`

2. **Install Website Dependencies**:
   - Open Command Prompt
   - Navigate to your website folder:
     ```cmd
     cd C:\mpt-website
     ```
   - Install frontend dependencies:
     ```cmd
     cd frontend
     npm install
     cd ..
     ```

---

## 🌐 Running Your Website

### Method 1: Using Scripts (Recommended)

#### For Windows Users:
1. Double-click `start-both.bat`
2. Wait for both windows to open
3. Open your browser to `http://localhost:3000`

#### For Mac Users:
1. Open Terminal in your website folder
2. Run: `./start-both.sh`
3. Wait for both servers to start
4. Open your browser to `http://localhost:3000`

### Method 2: Manual Start

#### For Windows Users:
1. **Start Backend**:
   - Double-click `start-backend.bat`
   - Wait for "Started MptApplication" message

2. **Start Frontend**:
   - Double-click `start-frontend.bat`
   - Wait for "webpack compiled" message

#### For Mac Users:
1. **Start Backend**:
   - Open Terminal and run: `./start-backend.sh`
   - Wait for "Started MptApplication" message

2. **Start Frontend**:
   - Open new Terminal and run: `./start-frontend.sh`
   - Wait for "webpack compiled" message

3. **Access Website**:
   - Open browser to `http://localhost:3000`

### Method 3: Command Line

#### For Windows Users:
1. Open Command Prompt in your website folder
2. Start backend: `mvnw.cmd spring-boot:run`
3. Open new Command Prompt
4. Start frontend: `cd frontend && npm start`

#### For Mac Users:
1. Open Terminal in your website folder
2. Start backend: `./mvnw spring-boot:run`
3. Open new Terminal
4. Start frontend: `cd frontend && npm start`

---

## ✏️ Making Changes to Your Website

### Updating Content
1. **Text Changes**: Edit files in `frontend/src/pages/`
2. **Images**: Replace images in `frontend/public/`
3. **Styling**: Edit CSS files in `frontend/src/`

### Adding New Features
1. **Backend Changes**: Edit Java files in `src/main/java/`
2. **Frontend Changes**: Edit React files in `frontend/src/`
3. **Database Changes**: Edit files in `src/main/resources/`

### After Making Changes
1. **Frontend Changes**: Refresh your browser
2. **Backend Changes**: Restart the backend server
3. **Database Changes**: Restart both servers

---

## 🔧 Troubleshooting

### Common Issues and Solutions

#### "Java not found" Error
**Problem**: Command Prompt says Java is not recognized
**Solution**:
1. Restart your computer after installing Java
2. Check if JAVA_HOME is set:
   ```cmd
   echo %JAVA_HOME%
   ```
3. If empty, set it manually:
   ```cmd
   set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.x.x.x-hotspot
   ```

#### "Node not found" Error
**Problem**: Command Prompt says Node is not recognized
**Solution**:
1. Restart your computer after installing Node.js
2. Check if Node is in PATH:
   ```cmd
   node --version
   ```
3. If not working, reinstall Node.js with "Add to PATH" checked

#### Website Won't Load
**Problem**: Browser shows "This site can't be reached"
**Solution**:
1. Make sure both servers are running
2. Check the correct URL: `http://localhost:3000`
3. Try refreshing the page
4. Check if any antivirus is blocking the connection

#### Port Already in Use
**Problem**: Error about port 3000 or 8080 being in use
**Solution**:
1. Close all Command Prompt windows
2. Wait 30 seconds
3. Try starting again
4. If still failing, restart your computer

#### Database Errors
**Problem**: Website loads but data doesn't appear
**Solution**:
1. Check if backend is running (should show "Started MptApplication")
2. Restart the backend server
3. Check the console for error messages

### Getting More Help

#### Check Logs
1. **Backend Logs**: Look at the Command Prompt running the backend
2. **Frontend Logs**: Look at the Command Prompt running the frontend
3. **Browser Logs**: Press F12 in your browser, go to Console tab

#### Common Error Messages
- **"Port 8080 already in use"**: Another program is using the port, restart your computer
- **"Module not found"**: Run `npm install` in the frontend folder
- **"JAVA_HOME not set"**: Java installation issue, reinstall Java
- **"Cannot find module"**: Missing dependencies, run `npm install`

---

## 📞 Getting Help

### Before Asking for Help
1. ✅ Check if Java 21 is installed: `java -version`
2. ✅ Check if Node.js is installed: `node --version`
3. ✅ Try restarting your computer
4. ✅ Try running the batch files again
5. ✅ Check the troubleshooting section above

### When You Need Help
1. **Take a screenshot** of any error messages
2. **Note down** what you were trying to do
3. **Check** if both servers are running
4. **Include** your operating system (Windows 10/11)

### Contact Information
- **Email**: chloebarrettraining@icloud.com
- **Phone**: 04 98 471 509
- **Location**: Birtinya, QLD 4575

---

## 🎯 What's Next?

### Your Website Features
Once running, your website includes:

1. **Home Page**: Welcome visitors with your training services
2. **Services Page**: Showcase your training packages
3. **Booking System**: Customers can book sessions online
4. **Gallery**: Display photos of your training sessions
5. **Testimonials**: Show customer reviews
6. **Contact Page**: Easy way for customers to reach you
7. **Admin Panel**: Manage bookings and content

### Customizing Your Website
1. **Update Contact Information**: Edit `frontend/src/pages/Contact.js`
2. **Change Prices**: Edit `src/main/java/com/mpt/mpt/MainController.java`
3. **Add New Services**: Edit the services section in the same file
4. **Update Images**: Replace files in `frontend/public/`

### Going Live (Optional)
When you're ready to make your website public:
1. **Domain Name**: Purchase a domain (e.g., mpt-training.com)
2. **Web Hosting**: Use services like Vercel, Netlify, or Heroku
3. **Database Hosting**: Use services like Railway, Render, or AWS

---

## 📝 Important Notes

- **Keep Your Computer On**: The website only runs while your computer is on
- **Regular Backups**: Make copies of your website files regularly
- **Updates**: Keep Java and Node.js updated for security
- **Security**: Don't share your admin passwords

**🎉 You now have a fully functional website for Movement Performance Training!**

---

*Last Updated: September 2024*
*Version: 1.0*
