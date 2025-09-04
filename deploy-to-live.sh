#!/bin/bash

echo "🚀 Deploying MPT Website to Live Server..."

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📁 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit - MPT website"
fi

# Check if remote exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔗 Please add your GitHub repository as remote origin:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
    echo "   Then run this script again."
    exit 1
fi

# Build the frontend
echo "🔨 Building frontend..."
cd frontend
npm run build
cd ..

# Commit changes
echo "📝 Committing changes..."
git add .
git commit -m "Deploy to live server - $(date)"

# Push to GitHub
echo "⬆️ Pushing to GitHub..."
git push origin main

echo "✅ Deployment initiated!"
echo ""
echo "🌐 Your live website will be available at:"
echo "   Frontend: https://mpt-frontend.onrender.com"
echo "   Backend: https://mpt-backend.onrender.com"
echo "   Admin: https://mpt-frontend.onrender.com/admin"
echo ""
echo "⏳ Deployment takes 5-10 minutes. Check Render dashboard for status."
echo ""
echo "📋 Next steps:"
echo "   1. Go to https://render.com"
echo "   2. Connect your GitHub repository"
echo "   3. Render will automatically deploy using render.yaml"
echo "   4. Set up environment variables in Render dashboard"
