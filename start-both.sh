#!/bin/bash

echo "========================================"
echo "   Starting Full Stack Application"
echo "========================================"
echo

# Check system requirements
echo "Checking system requirements..."

# Check Java
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    echo "Please install Java 21 from: https://adoptium.net/"
    echo "Make sure to add Java to your PATH"
    exit 1
fi

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed or not in PATH"
    echo "Please install Node.js from: https://nodejs.org/"
    echo "Make sure to add Node.js to your PATH"
    exit 1
fi

echo "✅ All requirements met"
echo

# Install frontend dependencies if needed
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

echo "Backend will be available at: http://localhost:8080"
echo "Frontend will be available at: http://localhost:3000"
echo "Admin Panel will be available at: http://localhost:8080/admin"
echo

echo "Starting backend server in background..."
if [ -f "./mvnw" ]; then
    ./mvnw spring-boot:run &
else
    mvn spring-boot:run &
fi

BACKEND_PID=$!

echo "Waiting for backend to start..."
sleep 10

echo "Starting frontend server..."
cd frontend
npm start &
FRONTEND_PID=$!

echo
echo "✅ Both services are starting..."
echo
echo "IMPORTANT:"
echo "- Wait for both servers to show 'Started' messages"
echo "- Backend: Look for 'Started MptApplication'"
echo "- Frontend: Look for 'webpack compiled'"
echo "- Then open your browser to: http://localhost:3000"
echo
echo "To stop the servers, press Ctrl+C"
echo

# Wait for user to stop
wait
