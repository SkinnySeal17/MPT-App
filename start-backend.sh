#!/bin/bash

echo "========================================"
echo "   Starting Spring Boot Backend"
echo "========================================"
echo

# Check if Java is available
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    echo "Please install Java 21 from: https://adoptium.net/"
    echo "Make sure to add Java to your PATH"
    exit 1
fi

echo "✅ Java found"
echo
echo "Backend will be available at: http://localhost:8080"
echo "H2 Console will be available at: http://localhost:8080/h2-console"
echo "Admin Panel will be available at: http://localhost:8080/admin"
echo
echo "Starting backend server..."
echo "(This may take 30-60 seconds on first run)"
echo

# Use Maven wrapper if available, otherwise use system Maven
if [ -f "./mvnw" ]; then
    ./mvnw spring-boot:run
else
    mvn spring-boot:run
fi

if [ $? -ne 0 ]; then
    echo
    echo "❌ Failed to start backend server"
    echo "Please check the error messages above"
    exit 1
fi

echo
echo "Backend server stopped"
