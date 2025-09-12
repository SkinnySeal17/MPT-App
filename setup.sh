#!/bin/bash

echo "========================================"
echo "   Movement Performance Training Setup"
echo "========================================"
echo

echo "Checking system requirements..."
echo

# Check Java
echo "Checking Java installation..."
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    echo "Please install Java 21 from: https://adoptium.net/"
    echo "Make sure to add Java to your PATH"
    exit 1
else
    echo "✅ Java is installed"
fi

# Check Node.js
echo "Checking Node.js installation..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed or not in PATH"
    echo "Please install Node.js from: https://nodejs.org/"
    echo "Make sure to add Node.js to your PATH"
    exit 1
else
    echo "✅ Node.js is installed"
fi

echo
echo "Installing frontend dependencies..."
cd frontend
npm install
if [ $? -ne 0 ]; then
    echo "❌ Failed to install frontend dependencies"
    exit 1
fi
cd ..

echo
echo "✅ Setup completed successfully!"
echo
echo "You can now run your website using:"
echo "   - ./start-both.sh (recommended)"
echo "   - ./start-backend.sh + ./start-frontend.sh (manual)"
echo
echo "Your website will be available at: http://localhost:3000"
echo
