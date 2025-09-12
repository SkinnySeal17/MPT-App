#!/bin/bash

echo "========================================"
echo "   Starting React Frontend"
echo "========================================"
echo

# Check if Node.js is available
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed or not in PATH"
    echo "Please install Node.js from: https://nodejs.org/"
    echo "Make sure to add Node.js to your PATH"
    exit 1
fi

echo "✅ Node.js found"
echo

# Check if frontend dependencies are installed
if [ ! -d "frontend/node_modules" ]; then
    echo "Installing frontend dependencies..."
    cd frontend
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install frontend dependencies"
        exit 1
    fi
    cd ..
    echo "✅ Dependencies installed"
    echo
fi

echo "Frontend will be available at: http://localhost:3000"
echo
echo "Starting frontend server..."
echo "(This may take 30-60 seconds on first run)"
echo

cd frontend
npm start

if [ $? -ne 0 ]; then
    echo
    echo "❌ Failed to start frontend server"
    echo "Please check the error messages above"
    exit 1
fi

echo
echo "Frontend server stopped"
