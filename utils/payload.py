from base64 import b64encode
from random import random
from cayennelpp import LppFrame

def around(val):
   return round(val + random() - 0.5, 1)

def main():
   frame = LppFrame()
   
   frame.add_temperature(0, around(-4.1))
   frame.add_accelerometer(1, 1.234, -1.234, 0)
   frame.add_humidity(3, around(34.5))
   frame.add_pressure(4, around(1014.1))
   frame.add_gyrometer(5, -12, 27, 47)

   buffer = bytes(frame)
   print(b64encode(buffer))

if __name__ == "__main__":
   main()
