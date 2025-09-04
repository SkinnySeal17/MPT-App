#!/bin/bash

echo "🚀 Starting Java Spring Boot Backend..."

# Kill any existing Java processes on port 8081
lsof -ti:8081 | xargs kill -9 2>/dev/null

# Start Spring Boot on port 8081
cd clean-spring-boot
./mvnw spring-boot:run -Dspring-boot.run.arguments="--server.port=8081" &
BACKEND_PID=$!

echo "⏳ Waiting for backend to start..."
sleep 10

# Test if backend is running
if curl -s http://localhost:8081/api/bookings > /dev/null; then
    echo "✅ Java Backend is running on http://localhost:8081"
    echo "📊 API Endpoints:"
    echo "   - GET  /api/bookings (list all bookings)"
    echo "   - POST /api/bookings/create (create booking)"
    echo "   - GET  /h2-console (database console)"
    echo ""
    echo "🌐 Frontend can now connect to: http://localhost:8081"
else
    echo "❌ Backend failed to start"
    kill $BACKEND_PID 2>/dev/null
fi
