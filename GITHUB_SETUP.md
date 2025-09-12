# 🚀 GitHub Repository Setup Guide

## 📋 Overview
This guide will help you set up your GitHub repository and make your Movement Performance Training website accessible to others.

## 🎯 What This Guide Covers
- Setting up a GitHub repository
- Uploading your code
- Making the website accessible to others
- Sharing the repository with collaborators

---

## 🏗️ Step 1: Create GitHub Repository

### Option A: Using GitHub Website (Recommended for beginners)

1. **Go to GitHub**:
   - Visit: https://github.com
   - Sign in to your account (or create one if needed)

2. **Create New Repository**:
   - Click the "+" icon in the top right corner
   - Select "New repository"
   - Repository name: `mpt-app`
   - Description: `Movement Performance Training - Professional Website`
   - Set to **Public** (so others can access it)
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)
   - Click "Create repository"

### Option B: Using GitHub CLI (For advanced users)

```bash
# Install GitHub CLI first, then:
gh repo create skinnyseal17/mpt-app --public --description "Movement Performance Training - Professional Website"
```

---

## 📤 Step 2: Upload Your Code

### Method 1: Using GitHub Desktop (Easiest)

1. **Download GitHub Desktop**:
   - Go to: https://desktop.github.com/
   - Download and install GitHub Desktop

2. **Clone Repository**:
   - Open GitHub Desktop
   - Click "Clone a repository from the Internet"
   - Enter: `https://github.com/skinnyseal17/mpt-app.git`
   - Choose a local path (e.g., `C:\Users\YourName\mpt-app`)
   - Click "Clone"

3. **Copy Your Files**:
   - Copy all your website files into the cloned folder
   - Overwrite any existing files

4. **Commit and Push**:
   - In GitHub Desktop, you'll see all your files listed
   - Add a commit message: "Initial commit - Complete MPT website"
   - Click "Commit to main"
   - Click "Push origin" to upload to GitHub

### Method 2: Using Command Line

1. **Initialize Git** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Complete MPT website"
   ```

2. **Add Remote Repository**:
   ```bash
   git remote add origin https://github.com/skinnyseal17/mpt-app.git
   git branch -M main
   git push -u origin main
   ```

### Method 3: Using GitHub Website (Drag & Drop)

1. **Go to Your Repository**:
   - Visit: https://github.com/skinnyseal17/mpt-app

2. **Upload Files**:
   - Click "uploading an existing file"
   - Drag and drop all your website files
   - Add commit message: "Initial commit - Complete MPT website"
   - Click "Commit changes"

---

## 🔗 Step 3: Make Repository Accessible

### Make Repository Public

1. **Go to Repository Settings**:
   - Visit: https://github.com/skinnyseal17/mpt-app
   - Click "Settings" tab

2. **Change Visibility**:
   - Scroll down to "Danger Zone"
   - Click "Change repository visibility"
   - Select "Make public"
   - Type repository name to confirm
   - Click "I understand, change repository visibility"

### Add Repository Description

1. **Edit Repository**:
   - Click the gear icon next to "About"
   - Add description: "🏄‍♀️ Movement Performance Training - Professional full-stack website with React frontend and Spring Boot backend"
   - Add website URL: `http://localhost:3000` (for local development)
   - Add topics: `react`, `spring-boot`, `java`, `website`, `training`, `fitness`

---

## 👥 Step 4: Share with Others

### Share Repository Link

Your repository will be accessible at:
```
https://github.com/skinnyseal17/mpt-app
```

### Create a README for Others

The repository already includes:
- `README.md` - Main project documentation
- `DEPLOYMENT_GUIDE.md` - Complete setup instructions
- `QUICK_START.md` - 5-minute setup guide
- `PROJECT_SUMMARY.md` - Technical overview

### Add Collaborators (Optional)

1. **Go to Repository Settings**:
   - Click "Settings" tab
   - Click "Manage access" in the left sidebar

2. **Invite Collaborators**:
   - Click "Invite a collaborator"
   - Enter their GitHub username or email
   - Choose permission level (usually "Write" for full access)
   - Click "Add [username] to this repository"

---

## 📱 Step 5: Mobile Responsiveness

Your website is already fully mobile responsive and includes:

### Mobile Features
- **Responsive Design**: Works on all screen sizes
- **Touch-Friendly**: Optimized for touch interactions
- **Fast Loading**: Optimized for mobile networks
- **Cross-Platform**: Works on iOS, Android, and desktop

### Testing Mobile Responsiveness
1. **Desktop Testing**:
   - Resize your browser window
   - Use browser developer tools (F12)
   - Test different screen sizes

2. **Mobile Testing**:
   - Access `http://localhost:3000` from your phone
   - Use the same WiFi network as your computer
   - Test all features and navigation

---

## 🚀 Step 6: Deployment Options (Future)

### Free Hosting Options

1. **Frontend (React)**:
   - **Vercel**: https://vercel.com
   - **Netlify**: https://netlify.com
   - **GitHub Pages**: Built into GitHub

2. **Backend (Spring Boot)**:
   - **Railway**: https://railway.app
   - **Render**: https://render.com
   - **Heroku**: https://heroku.com

### Domain Name (Optional)
- Purchase a domain like `mpt-training.com`
- Point it to your hosted website
- Add SSL certificate for security

---

## 📞 Step 7: Support Others

### For Repository Users

When others access your repository, they should:

1. **Read the Documentation**:
   - Start with `QUICK_START.md`
   - Follow `DEPLOYMENT_GUIDE.md` for detailed setup

2. **System Requirements**:
   - Java 21 (for backend)
   - Node.js (for frontend)
   - Git (for downloading)

3. **Quick Setup**:
   ```bash
   # Download repository
   git clone https://github.com/skinnyseal17/mpt-app.git
   cd mpt-app
   
   # Windows
   setup.bat
   start-both.bat
   
   # Mac
   chmod +x *.sh
   ./setup.sh
   ./start-both.sh
   ```

### Support Channels
- **GitHub Issues**: For bug reports and feature requests
- **Email**: chloebarrettraining@icloud.com
- **Phone**: 04 98 471 509

---

## ✅ Step 8: Verify Everything Works

### Test Checklist

- [ ] Repository is public and accessible
- [ ] All files are uploaded correctly
- [ ] README displays properly
- [ ] Others can clone the repository
- [ ] Website runs on localhost:3000
- [ ] Mobile responsiveness works
- [ ] All features function correctly

### Final Repository Structure
```
mpt-app/
├── README.md                    # Main documentation
├── DEPLOYMENT_GUIDE.md          # Setup instructions
├── QUICK_START.md               # Quick start guide
├── PROJECT_SUMMARY.md           # Technical overview
├── GITHUB_SETUP.md              # This file
├── setup.bat / setup.sh         # Setup scripts
├── start-both.bat / start-both.sh # Start scripts
├── pom.xml                      # Maven configuration
├── mvnw / mvnw.cmd              # Maven wrapper
├── src/                         # Backend source code
└── frontend/                    # React frontend
```

---

## 🎉 Congratulations!

Your Movement Performance Training website is now:
- ✅ **Publicly accessible** on GitHub
- ✅ **Cross-platform compatible** (Windows & Mac)
- ✅ **Mobile responsive** for all devices
- ✅ **Easy to set up** with comprehensive guides
- ✅ **Professional quality** with modern design

**Repository URL**: https://github.com/skinnyseal17/mpt-app

**Next Steps**:
1. Share the repository link with others
2. Test the setup on different devices
3. Consider hosting for public access
4. Add custom domain if desired

---

*Last Updated: September 2024*
*Version: 1.0*
