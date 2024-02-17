import network
import socket
import ujson
import machine 
from machine import Pin 
import umail 
import network 
from time import sleep 
import random
from servo import Servo

servo = Servo(machine.Pin(12))
OTP = "" 
WIFI_SSID = "R18"
WIFI_PASS = "12345678910"
sender_email = 'homwworks5@gmail.com' 
sender_name = 'Door Lock' 
sender_app_password = 'tvxl jxji dinz bsit ' 
recipient_email = ""
email_subject ='Door Lock OTP' 
name = ""

users = [
    {"username" : "admin",
     "email" : "Rihaan1810@gmail.com"},
    {"username" : "keerthan",
     "email" : "tkthulasimandiram@gmail.com"},
    {"username" : "Shravya",
     "email" : "ksshrav2005@gmail.com"},
    {"username" : "KK surendran",
     "email" : "kksurendran104@gmail.com"},
    {"username" : "A",
     "email" : "aayushman345@gmail.com"}
    ]




def send_otp(recipient_email, username):
  global OTP
  global name 
  name = username
  new_otp = str(random.getrandbits(16))
  OTP = new_otp
  body = "Dear "+name+","+"\n"+"\n"+"Your OTP is "+new_otp+"." 
  smtp = umail.SMTP('smtp.gmail.com', 465, ssl=True)  
  smtp.login(sender_email, sender_app_password) 
  smtp.to(recipient_email) 
  smtp.write("From:" + sender_name + "<"+ sender_email+">\n") 
  smtp.write("Subject:" + email_subject + "\n") 
  smtp.write(body) 
  smtp.send() 
  smtp.quit() 
  return new_otp 
 
def otp_verify(otp): 
    global OTP
    if otp == OTP:
        return True
    else:
        return False
        

def validate_user(username, admin_mode=False):
    global recipient_email
    recipient_email = ""
    for user in users:
        if username == user["username"] and username != "admin" and admin_mode == False:
            recipient_email = user["email"]
            return True
        if username == user["username"] and username == "admin" and admin_mode == True:
            recipient_email = user["email"]
            return True
                
    return False


def add_user():
    global users
    new_user = str(input("Enter the new username : "))
    for user in users:
        if new_user == user["username"]:
            print("Username already exists !!")
            return
        if new_user_email == user["email"]:
            print("email is already bieng used by someone please use a different one !")
            return
        
    new_user_email = str(input("Enter the email address"))
    
    for user in users:
        if new_user_email == user["email"]:
            print("email is already bieng used by someone please use a different one !")
            return            
      
    users.append({"username" : new_user, "email" : new_user_email})
    
def delete_user():
    global users 
    delete_user = str(input("Enter the username of the user to be deleted : "))
    if delete_user == "admin":
        print("You cannot delete admin")
    for i, user in enumerate(users):
        if delete_user == user["username"]:
            users.pop(i)
            return 
    print("User does not exist !! ")   

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
        username = data["username"]
        if validate_user(username):
            print(f"sending to {username}")
            send_otp(recipient_email, username)
            
        return "HTTP/1.0 200 OK\r\n\r\nOK"
    elif path == "/otp":
        otp = data["otp"]
        if otp_verify:
            servo.write_angle(degrees = 0)
            sleep(10)
            servo.write_angle(degrees = 90)
        else:
            print("wrong otp")
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


