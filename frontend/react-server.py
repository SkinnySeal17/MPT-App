#!/usr/bin/env python3
"""
Simple HTTP server for React Router compatibility
Handles client-side routing by serving index.html for all routes
"""

import http.server
import socketserver
import os
import urllib.parse

class ReactRouterHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Parse the URL
        parsed_path = urllib.parse.urlparse(self.path)
        path = parsed_path.path
        
        # List of routes that should serve index.html
        react_routes = [
            '/admin',
            '/about', 
            '/contact',
            '/services',
            '/resources',
            '/privacy',
            '/terms',
            '/faqs',
            '/booking',
            '/gallery'
        ]
        
        # Special handling for admin route
        if path == '/admin':
            # Serve the advanced admin HTML content directly
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            
            # Read and serve advanced-admin.html content
            try:
                with open('build/advanced-admin.html', 'rb') as f:
                    self.wfile.write(f.read())
            except FileNotFoundError:
                self.wfile.write(b'<h1>Admin page not found</h1>')
            return
        
        # Check if this is a React route
        if path in react_routes:
            # Serve index.html for React routes
            self.path = '/index.html'
            return http.server.SimpleHTTPRequestHandler.do_GET(self)
        
        # For all other requests, serve files normally
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

if __name__ == "__main__":
    PORT = 8000
    
    # Change to the build directory
    os.chdir('build')
    
    with socketserver.TCPServer(("", PORT), ReactRouterHandler) as httpd:
        print(f"🚀 React Router Server running on http://localhost:{PORT}")
        print(f"📁 Serving files from: {os.getcwd()}")
        print(f"🔧 Admin panel: http://localhost:{PORT}/admin")
        print(f"🏠 Home page: http://localhost:{PORT}/")
        print("Press Ctrl+C to stop the server")
        httpd.serve_forever()
