#!/usr/bin/env python3
"""OpenStage - tiny static server with caching disabled.

Serves index.html (and assets) so every refresh always loads the latest version.
Run:  python3 serve.py   then open  http://localhost:4321/index.html
Override the port with the PORT environment variable.
"""
import http.server
import socketserver
import os

PORT = int(os.environ.get("PORT", "4321"))
os.chdir(os.path.dirname(os.path.abspath(__file__)))


class NoCacheHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")
        super().end_headers()

    def log_message(self, *args):
        pass


socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("", PORT), NoCacheHandler) as httpd:
    print(f"OpenStage running at http://localhost:{PORT}/index.html  (Ctrl+C to stop)")
    httpd.serve_forever()
