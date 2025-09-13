#!/bin/bash

# Movement Performance Training - Frontend Startup Script for Mac
echo "🚀 Starting Movement Performance Training Frontend..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16 or higher."
    echo "   You can install it using: brew install node"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

# Navigate to frontend directory
cd "$(dirname "$0")/frontend"

echo "📁 Current directory: $(pwd)"
echo "📦 Node.js version: $(node --version)"
echo "📦 npm version: $(npm --version)"

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install dependencies. Please check the errors above."
        exit 1
    fi
fi

# Start the React development server
echo "⚛️  Starting React development server..."
echo "   Frontend will be available at: http://localhost:3000"
echo "   Admin panel: http://localhost:3000/admin"
echo "   Login credentials: admin/admin"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

npm start
