import serial

# Open uart port and return the created instance of the serial port
def init_motor():
	ser = serial.Serial("/dev/ttyS0", 
					baudrate=9600, 
					parity=serial.PARITY_NONE,
					stopbits=serial.STOPBITS_ONE, 
					bytesize=serial.EIGHTBITS,
     				write_timeout=0.1) 

	return ser # Return the serial object
	
	
# Transmits left and right drivetrain speed to the HERO dev board
def set_speed(ser, speed_left, speed_right): # Takes in serial object, as well as ints for left and right speed. 	
											 # Values NEED to fit in the range 1-255. Value 128 means stop. <128 is reverse. 
											 # Writing a value of zero (0) will be ignored by the HERO.
											 
	indicator_val = 1	
	#ser.flushOutput() # Clear output buffer before transmitting. Shouldn't be necessary tbh	
	
	ser.write(indicator_val.to_bytes(1, 'big'))
	ser.write(speed_left.to_bytes(1, 'big'))
	ser.write(speed_right.to_bytes(1, 'big'))
	
