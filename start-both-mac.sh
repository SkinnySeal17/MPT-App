#!/bin/bash

# Movement Performance Training - Start Both Backend and Frontend for Mac
echo "🚀 Starting Movement Performance Training - Full Application..."

# Function to cleanup background processes
cleanup() {
    echo ""
    echo "🛑 Shutting down servers..."
    if [ ! -z "$BACKEND_PID" ]; then
        kill $BACKEND_PID 2>/dev/null
    fi
    if [ ! -z "$FRONTEND_PID" ]; then
        kill $FRONTEND_PID 2>/dev/null
    fi
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Start backend in background
echo "🔧 Starting backend server..."
./start-backend-mac.sh &
BACKEND_PID=$!

# Wait a bit for backend to start
echo "⏳ Waiting for backend to start..."
sleep 10

# Start frontend in background
echo "⚛️  Starting frontend server..."
./start-frontend-mac.sh &
FRONTEND_PID=$!

echo ""
echo "✅ Both servers are starting up!"
echo "   Backend: http://localhost:8080"
echo "   Frontend: http://localhost:3000"
echo "   Admin: http://localhost:3000/admin (admin/admin)"
echo ""
echo "Press Ctrl+C to stop both servers"

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
