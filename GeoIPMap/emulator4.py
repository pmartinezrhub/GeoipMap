#json example data from api
#{'status': 'success', 'country': 'United Kingdom', 'countryCode': 'GB', 'region': 'ENG', 'regionName': 'England', 'city': 'Ilford', 'zip': 'IG6',
# 'lat': 51.5877, 'lon': 0.0784, 'timezone': 'Europe/London', 'isp': 'Jisc Services Limited', 'org': 'Hertfordshire Internet Training Project', 'as': 'AS786 Jisc Services Limited', 'query': '212.121.29.229'}

#{'deviceID': 'emulator3_fakevdev', 'lat': '42.891665', 'lon': '-8.533984'}


#/bin/python
import requests
import random 
from time import sleep

deviceID = "emulator4_f4k3vd3v"
#42.891665, -8.533984
lat = 42.891665
lon = -8.533984
url = "http://192.168.0.13:8088"
url = "http://192.168.0.130:8088"
url = "http://mamut.nsupdate.info:8088"

while True:
    #res = requests.post('https://68975a3e13650be08630b26c6f9a1a24.m.pipedream.net/', data = {'IP':ip_random})
    data = (deviceID + ":" + str(lat) + ":" + str(lon))
    print("sendindg data to : " + url + " " + str(data))
    try:
        requests.post(url, data) 
    except Exception as e:
        print(str(e))
    #walking person should advance 0.0005
    random_move_lat =  round(random.uniform(-0.00005, 0.00005), 4)
    random_move_lng =  round(random.uniform(-0.00005, 0.00005), 4)
    lon = round(lon + random_move_lng, 4)
    lat = round(lat - 0.00005, 4)
    
    sleep(20)
