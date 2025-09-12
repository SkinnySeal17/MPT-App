#!/bin/bash

echo "🚀 Starting React Router compatible server..."

# Kill any existing servers
pkill -f "python3.*http.server" 2>/dev/null
pkill -f "serve.py" 2>/dev/null

# Start the server with proper React Router support
cd build

# Create a simple Python server that serves index.html for all routes
python3 -c "
import http.server
import socketserver
import os

class ReactHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Check if the path is a file that exists
        if os.path.exists(self.path[1:]) and os.path.isfile(self.path[1:]):
            super().do_GET()
        else:
            # For all other routes, serve index.html
            self.path = '/index.html'
            super().do_GET()

with socketserver.TCPServer(('', 8000), ReactHandler) as httpd:
    print('🚀 React server running on http://localhost:8000')
    print('📱 All routes will be handled by React Router')
    print('🛑 Press Ctrl+C to stop the server')
    httpd.serve_forever()
"
