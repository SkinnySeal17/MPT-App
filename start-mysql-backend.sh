#!/bin/bash

echo "🚀 Starting MPT Backend with MySQL Database"
echo "==========================================="

# Kill any existing Java processes on port 8081
echo "🛑 Stopping existing backend..."
pkill -f "java.*MptApplication" 2>/dev/null
sleep 3

# Navigate to Spring Boot project
cd clean-spring-boot

# Check if MySQL is running
echo "🔍 Checking MySQL connection..."
if ! mysql -u root -ppassword -e "SELECT 1;" > /dev/null 2>&1; then
    echo "❌ MySQL is not running or connection failed"
    echo "💡 Run: ./setup-mysql.sh to set up MySQL"
    exit 1
fi

echo "✅ MySQL connection successful"

# Start Spring Boot application
echo "🚀 Starting Spring Boot application..."
./mvnw spring-boot:run -Dspring-boot.run.arguments="--server.port=8081" &

# Wait for application to start
echo "⏳ Waiting for application to start..."
sleep 15

# Test if application is running
if curl -s http://localhost:8081/api/bookings > /dev/null; then
    echo ""
    echo "🎉 Backend started successfully!"
    echo ""
    echo "📊 Backend Information:"
    echo "   URL: http://localhost:8081"
    echo "   API: http://localhost:8081/api/bookings"
    echo "   Database: MySQL (mpt_db)"
    echo ""
    echo "🔗 Test endpoints:"
    echo "   - GET  /api/bookings (list all bookings)"
    echo "   - POST /api/bookings/create (create booking)"
    echo "   - GET  /api/bookings/{id} (get specific booking)"
    echo "   - PUT  /api/bookings/{id} (update booking)"
    echo "   - DELETE /api/bookings/{id} (delete booking)"
    echo ""
    echo "🌐 Frontend can now connect to: http://localhost:8081"
    echo "📱 Visit: http://localhost:8000/admin-test.html to test"
else
    echo "❌ Backend failed to start"
    echo "📋 Check the logs above for errors"
    exit 1
fi
