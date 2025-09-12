#!/bin/bash

echo "🚀 Building for production deployment..."

# Update homepage for GitHub Pages
sed -i '' 's/"homepage": "."/"homepage": "https:\/\/sujal715.github.io\/mpt"/' package.json

# Build the project
npm run build

echo "✅ Production build complete!"
echo "🌐 Ready for deployment to GitHub Pages"
