#!/bin/bash

echo "🔧 Building for local development..."

# Update homepage for local development
sed -i '' 's/"homepage": "https:\/\/sujal715.github.io\/mpt"/"homepage": "."/' package.json

# Build the project
npm run build

echo "✅ Local build complete!"
echo "🌐 Start local server: cd build && python3 -m http.server 8000"
echo "📱 Visit: http://localhost:8000"
