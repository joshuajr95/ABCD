import serial               #import serial pacakge
from time import sleep

ser = serial.Serial ("/dev/ttyS0", 9600)

spd_left = 50
spd_right = -spd_left
try:
    while(True):
        dl = spd_left.to_bytes(1, 'big', signed=True) # Cast the speed value into a byte
        dr = spd_right.to_bytes(1, 'big', signed=True)
    
        print("Transmitting: " + str(dl) + " - " + str(dr) + " (note that these are signed bytes printed as chars. '2' is ASCII 50, 'xce' is -50)")
        data = str(dl + dr) # Concatenate bytes into a single 2 character string
    
        ser.write(bytes(data, 'utf-8')) # Transmit the speed as a single utf-8 encoded 2-byte string over UART
    
        spd_left *= -1 # Flip the speed value to reverse
        spd_right = -spd_left
        sleep(1) # Wait
except KeyboardInterrupt:
        print("Measurement stopped by User")