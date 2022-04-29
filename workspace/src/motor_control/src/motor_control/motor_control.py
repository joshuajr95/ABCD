#! /usr/bin/python3

import rospy
import serial
from navigation.msg import MotorSpeed


class MotorControl:

	# Open uart port and return the created instance of the serial port
	def init_motor(self):
		ser = serial.Serial("/dev/ttyS0", 
					baudrate=9600, 
					parity=serial.PARITY_NONE,
					stopbits=serial.STOPBITS_ONE, 
					bytesize=serial.EIGHTBITS,
     				write_timeout=0.1) 

		self.ser # Return the serial object

	def __init__(self):
		self.init_motor()
		
	
	def set_speed(self, speed_left, speed_right): # Takes in serial object, as well as ints for left and right speed. 	
											 # Values NEED to fit in the range 1-255. Value 128 means stop. <128 is reverse. 
											 # Writing a value of zero (0) will be ignored by the HERO.
											 
		indicator_val = 1	
		#ser.flushOutput() # Clear output buffer before transmitting. Shouldn't be necessary tbh	
		
		self.ser.write(indicator_val.to_bytes(1, 'big'))
		self.ser.write(speed_left.to_bytes(1, 'big'))
		self.ser.write(speed_right.to_bytes(1, 'big'))
	

	# set the motor speed (to be implemented)
	def setMotorSpeed(self, motor_speed):
		self.set_speed(motor_speed.left_speed, motor_speed.right_speed)



def main():
	
	#initialize motor control node
	rospy.init_node("motor_control_node")
	controller = MotorControl()
	
	motor_speed_subscriber = rospy.Subscriber("motor_speed", MotorSpeed, controller.setMotorSpeed)
	
	rospy.spin()
	
	
