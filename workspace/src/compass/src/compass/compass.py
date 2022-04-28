#! /usr/bin/python3


import rospy
import py_qmc5883l
from compass.msg import CompassBearing


# Create a magnetometer to get robot compass bearings
def init_magnetometer():
	sensor = py_qmc5883l.QMC5883L() # Create a magnetometer object

	# Changes slightly depending on time and place. 
	sensor.declination = 11.24 # Set for Rochester, NY on 04/26/2022
	
	return sensor # Returns the sensor object instance. 
	

# Reads the compass bearing from the magnetometer.
def read_magnetometer(sensor):
	return sensor.get_bearing()



def main():
	frequency = 10
	
	rospy.init_node("compass_node")
	
	timer = rospy.Rate(frequency)
	
	compass_bearing_publisher = rospy.Publisher("compass_bearing", CompassBearing, queue_size=1)
	
	compass = init_magnetometer()
	
	while not rospy.is_shutdown():
		
		# read compass (magnetometer) sensor data
		mag_data = read_magnetometer(compass)
		print(f"mag data is {mag_data}")
		
		bearing = CompassBearing()
		# fill compass bearing structure
		bearing.bearing = mag_data
		
		
		compass_bearing_publisher.publish(bearing)
		
		timer.sleep()
	
