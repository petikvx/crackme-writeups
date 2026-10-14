#!/usr/bin/env python3
from typing import Any
from http.server import BaseHTTPRequestHandler, HTTPServer
from logging import basicConfig, INFO, info

class S(BaseHTTPRequestHandler):
    def _set_response(self) -> None:
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self) -> None:
        info("GET request,\nHeaders:\n%s\n", str(self.headers))
        self._set_response()
        self.wfile.write(b"SILLY!!")

# pyrefly: ignore [implicit-any-parameter]
def run(server_class=HTTPServer, handler_class=S, port=5566) -> None:
    basicConfig(level=INFO)
    server_address = ('', port)
    httpd: HTTPServer | Any = server_class(server_address, handler_class)
    info('Starting httpd...\n')
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    info('Stopping httpd...\n')

if __name__ == '__main__':
    run()
