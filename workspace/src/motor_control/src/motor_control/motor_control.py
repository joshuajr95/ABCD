#! /usr/bin/python3


import rospy




# set the motor speed (to be implemented)
def setMotorSpeed(motor_speed):
	pass



def main():
	
	#initialize motor control node
	rospy.init_node("motor_control_node")
	
	
	motor_speed_subscriber = rospy.Subscriber("motor_speed", MotorSpeed, setMotorSpeed)
	
	rospy.spin()
