#! /usr/bin/python3


import rospy
import numpy as np
from geometry_msgs.msg import Pose
from gps.msg import gps_data
from compass.msg import CompassBearing


def yaw_to_quaternion(angle):
	pass


def quaternion_to_yaw(quaternion):
	pass


class EKF_Localization:
	
	# mu0 and sigma0 must be numpy array and ndarray, respectively
	def __init__(self, mu0, sigma0, ):
		self.mu = mu0
		self.sigma = sigma0


	# callback function to handle published GPS data
	def handle_GPS(self, gpsdata):
		self.gpsdata = gpsdata


	# callback function to handle published compass bearing data
	def handle_compass(self, compass_bearing):
		self.compass_bearing = compass_bearing
	

	# callback function to handle published motor speed data
	def handle_motor_speed(motor_speed):
		self.speeds = motor_speed

	
	def step(self, dt):
		
		if self.speeds is not None:
			# calculate motion update
			pass
		else:
			pass
		
		if self.compass_bearing is not None and self.gpsdata is not None:
			# calculate measurement update
			pass
		else:
			pass
		
		
		self.compass_bearing = None
		self.gpsdata = None
		
		




def main():
	
	frequency = 2
	
	rospy.init_node("localization_node")
	
	timer = rospy.Rate(frequency)
	
	gps_subscriber = rospy.Subscriber('gps_data', gps_data, handle_GPS)
	compass_subscriber = rospy.Subscriber('CompassBearing', CompassBearing, handle_compass)
	motion_subscriber = rospy.subscriber('motor_speed', MotorSpeed, handle_motor_speed)
	pose_publisher = rospy.publisher('pose', geometry_msgs/Pose)
	
	mu0 = None
	sigma0 = None
	
	localizer = EKF_Localization(mu0, sigma0)
	

	while not rospy.is_shutdown():
		
		# computes the localization update
		localizer.step(float(1/frequency))
		
		pose = Pose()
		pose.position.x = localizer.mu[0]
		pose.position.y = localizer.mu[1]
		pose.orientation = yaw_to_quaternion(localizer.mu[2])
		
		pose_publisher.publish(pose)
		
		timer.sleep()
		
		
		
		
		
		
