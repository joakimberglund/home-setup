#!/bin/python3

import time
from calendar import timegm
import requests

coord = "62.406521, 17.362494"

def write_influxdb( out ):
  r = requests.post("http://influxdb:8086/write?db=smhi", data=out)
#  print(out)

r = requests.get('http://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/17.362494/lat/62.406521/data.json')

data = r.json()

for nr in  data["timeSeries"]:
  ltime = nr["validTime"]

  utc_time = time.strptime(ltime, "%Y-%m-%dT%H:%M:%SZ")
  epoch_time = timegm(utc_time)

  for param in nr["parameters"]:
    write_influxdb(param["name"] + ",unit=" + param["unit"] + " value=" + str(param["values"][0]) + " " + str(epoch_time) + "000000000")

