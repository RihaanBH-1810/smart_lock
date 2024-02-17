import network
import socket
import ujson

WIFI_SSID = "R18"
WIFI_PASS = "12345678910"


def connect_wifi():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print("Connecting to WiFi...")
        wlan.connect(WIFI_SSID, WIFI_PASS)
        while not wlan.isconnected():
            pass
    print("Connected:", wlan.ifconfig()[0])

def handle_request(conn):
    request = conn.recv(1024).decode()
    method, path, _ = request.split(" ", 2)
    if method == "GET":
        response = process_get_request(path)
    elif method == "POST":
        response = process_post_request(path, request)
    else:
        response = "HTTP/1.0 405 Method Not Allowed\r\n\r\n"
    conn.sendall(response.encode())
    conn.close()

def process_get_request(path):
    if path == "/find_lock":
        return "HTTP/1.0 200 OK\r\n\r\n" + "connected"
    else:
        return "HTTP/1.0 404 Not Found\r\n\r\n"

def process_post_request(path, request):
    try:
        data = ujson.loads(request.split("\r\n\r\n", 1)[1])
    except ValueError:
        return "HTTP/1.0 400 Bad Request\r\n\r\nInvalid JSON syntax"

    if path == "/username":
        print(data)
        return "HTTP/1.0 200 OK\r\n\r\nOK"
    elif path == "/otp":
        print(data)
        return "HTTP/1.0 200 OK\r\n\r\nOTP received"
    else:
        return "HTTP/1.0 404 Not Found\r\n\r\n"


def main():
    connect_wifi()
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(("", 80))
    s.listen(5)
    print("Server listening on port 80")
    while True:
        conn, addr = s.accept()
        print("Connected by", addr)
        handle_request(conn)

if __name__ == "__main__":
    main()


