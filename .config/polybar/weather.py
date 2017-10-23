#!/usr/bin/env python

import urllib.request, json

city = "Boston"
api_key = "b5651dad3d9014e0cc1728e5a602ba8f"

weather = eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}".format(city, api_key)).read())[2:-1])

info = weather["weather"][0]["description"].capitalize()
temp = int((float(weather["main"]["temp"]) - 272.15) * 9 / 5 + 32)

print("%s %i °F" % (info, temp))
