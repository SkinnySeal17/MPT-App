#!/bin/bash

# Movement Performance Training - Backend Startup Script for Mac
echo "🚀 Starting Movement Performance Training Backend..."

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 11 or higher."
    echo "   You can install it using: brew install openjdk@11"
    exit 1
fi

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven is not installed. Please install Maven."
    echo "   You can install it using: brew install maven"
    exit 1
fi

# Navigate to project root
cd "$(dirname "$0")"

echo "📁 Current directory: $(pwd)"
echo "☕ Java version: $(java -version 2>&1 | head -n 1)"
echo "🔨 Maven version: $(mvn -version | head -n 1)"

# Clean and compile
echo "🧹 Cleaning and compiling..."
mvn clean compile

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed. Please check the errors above."
    exit 1
fi

# Start the Spring Boot application
echo "🌟 Starting Spring Boot application..."
echo "   Backend will be available at: http://localhost:8080"
echo "   API test endpoint: http://localhost:8080/api/test"
echo "   Admin login: admin/admin"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

mvn spring-boot:run
