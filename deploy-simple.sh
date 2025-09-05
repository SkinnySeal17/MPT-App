#!/bin/bash

echo "🚀 Deploying Simple Website to GitHub Pages..."
echo "=============================================="

# Copy the simple website to the frontend build directory
cp simple-website.html frontend/build/index.html

# Navigate to frontend directory
cd frontend

# Set homepage for GitHub Pages
npm pkg set homepage="https://sujal715.github.io/ppt-app"

# Build the project
echo "📦 Building project..."
npm run build

# Add all changes
git add .

# Commit changes
git commit -m "Deploy simple website to fix white screen issue"

# Push to GitHub
echo "🌐 Pushing to GitHub..."
git push ppt-app main

echo "✅ Deployment complete!"
echo "🔗 Your website will be available at: https://sujal715.github.io/ppt-app"
echo "⏰ It may take 2-3 minutes for GitHub Pages to update"
echo ""
echo "📋 Next steps:"
echo "1. Go to: https://github.com/sujal715/ppt-app/settings/pages"
echo "2. Make sure GitHub Pages is enabled"
echo "3. Set source to 'Deploy from a branch' → 'main' → '/ (root)'"
echo "4. Your website will be live!"
