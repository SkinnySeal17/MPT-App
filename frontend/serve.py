#!/usr/bin/env python3
"""
Simple HTTP server for React apps with client-side routing support.
Handles all routes by serving index.html for non-file requests.
"""

import http.server
import socketserver
import os
import urllib.parse
from pathlib import Path

class ReactHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Parse the URL
        parsed_path = urllib.parse.urlparse(self.path)
        path = parsed_path.path
        
        # Check if the path is a file that exists
        file_path = Path('build') / path.lstrip('/')
        
        if file_path.exists() and file_path.is_file():
            # Serve the file normally
            super().do_GET()
        else:
            # For all other routes, serve index.html
            self.path = '/index.html'
            super().do_GET()
    
    def end_headers(self):
        # Add CORS headers for development
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

def run_server(port=8000):
    """Run the server on the specified port."""
    os.chdir('build')  # Change to build directory
    
    with socketserver.TCPServer(("", port), ReactHandler) as httpd:
        print(f"🚀 React server running on http://localhost:{port}")
        print(f"📱 All routes will be handled by React Router")
        print(f"🛑 Press Ctrl+C to stop the server")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n👋 Server stopped!")

if __name__ == "__main__":
    run_server()
