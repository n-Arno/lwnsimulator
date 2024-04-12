from base64 import b64encode
from random import random
from cayennelpp import LppFrame

def around(val):
   return round(val + random() - 0.5, 1)

def main():
   frame = LppFrame()
   
   frame.add_temperature(0, around(15.0))
   frame.add_humidity(1, around(49.0))
   frame.add_pressure(2, around(1035.0))
   frame.add_accelerometer(3, 1.5, -1.5, 1.5) # to trigger a real movement

   buffer = bytes(frame)
   print(b64encode(buffer))

if __name__ == "__main__":
   main()
