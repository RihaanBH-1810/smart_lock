import machine 
from machine import Pin 
import umail 
import network 
from time import sleep 
import random  

OTP = "" 
ssid = 'R18' 
password = '12345678910' 
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
     "email" : "kksurendran104@gmail.com"}
    ]

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
 
def otp_verify(n=0): 
    global OTP 
    print("OTP sent ! ") 
    sleep(3) 
    n = 3 
    while n!=0: 
        received_OTP= input("Enter otp : ")     
         
        if received_OTP==OTP: 
                print("OTP verified") 
                return 
        elif received_OTP!=OTP: 
            print("Incorrect OTP") 
            n -= 1

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
        
    
connect_wifi(ssid, password) 
 
while True: 
    print("Welcome !! ")
    username = input("Please enter your username !! ")
    if validate_user(username):
        send_otp(recipient_email, username)
        otp_verify()
    elif username == "admin":
        if validate_user(username, True):
            send_otp(recipient_email, username)
            otp_verify()
            print("Admin pannel")
            mode = input("Enter A if you want to add user, Enter D if you want to delete a user : ")
            if mode == "A" or mode == "a":
                add_user()
            elif mode == "D" or mode == "d":
                delete_user()
            else:
                print("Invalid entry")            
    else:
        print("Username does not exist !")
        break
    





