import machine
from machine import Pin
import umail
import network
from time import sleep
import random 

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
  new_otp = str(random.getrandbits(16))
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
            
                       

OTP = ""
#your wifi name and password
ssid = ''
password = ''

#sender
sender_email = 'homwworks5@gmail.com'
sender_name = 'monkey'
sender_app_password = 'tvxl jxji dinz bsit'

#recipient mail
recipient_email = ""

email_subject ='Door Lock OTP'
name = "User"

connect_wifi(ssid, password)

while True:
    print("Sending otp :")
    OTP = send_otp(recipient_email)
    otp_verify()
    
                    
               
                
