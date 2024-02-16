import machine 
from machine import Pin 
import umail 
import network 
from time import sleep 
import random  

OTP = "" 
ssid = 'R18' 
password = '12345678910' 
sender_email = 'put your email here' 
sender_name = 'Door Lock' 
sender_app_password = 'put your app password here' 
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
     "email" : "kksurendran104@gmail.com"}
    ]

def add_user(dict):
    pass
    
def delete_user(dict):
    pass

def connect_wifi(ssid, password): 
  station = network.WLAN(network.STA_IF) 
  station.active(True) 
  try: 
    station.connect(ssid, password) 
    while not station.isconnected(): 
        print("Connecting...")         
    print("connected") 
  except: 
    print("connection failed") 
 
def send_otp(recipient_email):
  global OTP
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
 
def otp_verify(n=0): 
    global OTP 
    print("OTP sent ! ") 
    sleep(3) 
    n = 3 
    while n!=0: 
        received_OTP= input("Enter otp ")     
         
        if received_OTP==OTP: 
                print("OTP verified") 
                return 
        elif received_OTP!=OTP: 
            print("Incorrect OTP") 
            n -= 1

def validate_user(username):
    global recipient_email
    recipient_email = ""
    for user in users:
        if username == user["username"] and username != "admin":
            recipient_email = user["email"]
            return True
                
    return False
        
    


connect_wifi(ssid, password) 
 
while True: 
    print("Welcome !! ")
    username = input("Please enter your username !! ")
    if validate_user(username):
        send_otp(recipient_email)
        otp_verify()
    if username == "admin":
        pass # add admin logic here 
    else:
        print("Username does not exist !")
        break
    


