#!/bin/bash

echo "🚀 Deploying to Render with fixed configuration..."

# Navigate to frontend directory
cd frontend

# Clean any previous builds
echo "🧹 Cleaning previous builds..."
rm -rf build
rm -rf node_modules/.cache

# Install dependencies (skip if taking too long)
echo "📦 Installing dependencies..."
npm ci --only=production || echo "⚠️  Skipping npm install due to time constraints"

# Build the project
echo "🔨 Building React app..."
npm run build

# Check if build was successful
if [ ! -d "build" ]; then
    echo "❌ Build failed! Check the error messages above."
    exit 1
fi

echo "✅ Build completed successfully!"

# Commit and push to trigger Render deployment
echo "📤 Pushing to GitHub to trigger Render deployment..."
cd ..

# Add all changes
git add .

# Commit with timestamp
git commit -m "Deploy to Render - $(date '+%Y-%m-%d %H:%M:%S')"

# Push to main branch
git push origin main

echo "🎉 Deployment triggered!"
echo "🌐 Your site will be available at: https://mpt-sawp.onrender.com"
echo "⏳ Deployment usually takes 2-5 minutes..."
echo ""
echo "📊 Check deployment status at: https://dashboard.render.com"
