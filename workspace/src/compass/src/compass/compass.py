#! /usr/bin/python3


import rospy




# add function(s) to get compass data here



def main():
	frequency = 10
	
	rospy.init_node("compass_node")
	
	timer = rospy.Rate(frequency)
	
	compass_bearing_publisher = rospy.Publisher("compass_bearing", CompassBearing)
	
	while not rospy.is_shutdown():
		
		# read compass (magnetometer) sensor data
		
		bearing = CompassBearing()
		# fill compass bearing structure
		
		compass_bearing_publisher.publish(bearing)
		
		timer.sleep()
	
