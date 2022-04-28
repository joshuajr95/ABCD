#! /usr/bin/python3


import rospy



# callback function to handle published GPS data
def handle_GPS(gps_data):
	pass


# callback function to handle published compass bearing data
def handle_compass(compass_bearing):
	pass
	

# callback function to handle published motor speed data
def handle_motor_speed(motor_speed):
	pass





def main():
	
	frequency = 2
	
	rospy.init_node("localization_node")
	
	timer = rospy.Rate(frequency)
	
	gps_subscriber = rospy.Subscriber('gps_data', gps_data, handle_GPS)
	compass_subscriber = rospy.Subscriber('CompassBearing', CompassBearing, handle_compass)
	motion_subscriber = rospy.subscriber('motor_speed', MotorSpeed, handle_motor_speed)
	pose_publisher = rospy.publisher('pose', geometry_msgs/Pose)
	
	while not rospy.is_shutdown():
		
		# computes the localization update
		compute_EKF_update()
		
		pose = Pose()
		# fill the pose message
		
		pose_publisher.publish(pose)
		
		timer.sleep()
		
		
		
		
		
		
