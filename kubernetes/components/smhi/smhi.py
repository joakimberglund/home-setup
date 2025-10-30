#!/bin/python3

import time
from calendar import timegm
import requests
import sys

#coord = "62.406521, 17.362494"

if len(sys.argv) < 3:
  print("Usage: python coords.py <lat> <long> [--test [value]]", file=sys.stderr)
    sys.exit(1)
    
  # Parse latitude and longitude (first two args)
  try:
    lat = float(sys.argv[1])
    long = float(sys.argv[2])
  except ValueError:
    print("Error: lat and long must be valid numbers.", file=sys.stderr)
    sys.exit(1)

if len(sys.argv) > 3:
  if sys.argv[3] == '--test':
    test_is_set = True
    # If there's a value after --test
    if len(sys.argv) > 4:
      test_value = sys.argv[4]
    else:
      test_value = 'true'  # default when --test is used without value
 
def write_influxdb( out ):
  if test_is_set:
    print(out)
  else
    r = requests.post("http://influxdb:8086/write?db=smhi", data=out)

r = requests.get('http://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/f"{long}/{lat}"17.362494/lat/62.406521/data.json')
data = r.json()

for nr in  data["timeSeries"]:
  ltime = nr["validTime"]

  utc_time = time.strptime(ltime, "%Y-%m-%dT%H:%M:%SZ")
  epoch_time = timegm(utc_time)

  for param in nr["parameters"]:
    write_influxdb(param["name"] + ",unit=" + param["unit"] + " value=" + str(param["values"][0]) + " " + str(epoch_time) + "000000000")

