#! /usr/bin/python3


import rospy
import numpy as np
import math
from geopy import distance

from geometry_msgs.msg import Pose
from gps.msg import gps_data
from compass.msg import CompassBearing
from navigation.msg import MotorSpeed


def yaw_to_quaternion(angle):
	quaternion = Quaternion()
	quaternion.w = math.cos( yaw / 2.0 )
	quaternion.x = 0.0
	quaternion.y = 0.0
	quaternion.z = math.sin( yaw / 2.0 )
	return quaternion


def quaternion_to_yaw(quaternion):
	yaw = math.atan2(2.0*(quaternion.y*quaternion.z + quaternion.w*quaternion.x), quaternion.w*quaternion.w - quaternion.x*quaternion.x - quaternion.y*quaternion.y + quaternion.z*quaternion.z)
	return yaw


class EKF_Localization:
	
	# mu0 and sigma0 must be numpy array and ndarray, respectively
	# L is the width of the robot (from one tread to the other),
	# and r is the wheel radius
	def __init__(self, mu0, sigma0, L, r, alpha, gps_accuracy, mag_accuracy, zero_point):
		self.mu = mu0
		self.sigma = sigma0
		self.L = L
		self.r = r
		self.alpha = alpha
		self.zero_point = zero_point
		self.gpsdata = None

		# stores the compass readings received
		self.compass_bearings = []
		
		
		self.speeds = MotorSpeed()
		self.speeds.left_speed = 0.0
		self.speeds.right_speed = 0.0
		

		self.Q = np.zeros((3,3))
		
		for i in range(2):
			for j in range(2):
				self.Q[i][j] = gps_accuracy*gps_accuracy
		
		self.Q[2][2] = mag_accuracy*mag_accuracy

		


	# callback function to handle published GPS data
	def handle_GPS(self, gpsdata):
		self.gpsdata = gpsdata


	# callback function to handle published compass bearing data
	def handle_compass(self, compass_bearing):
		self.compass_bearings.append(compass_bearing)
	

	# callback function to handle published motor speed data
	def handle_motor_speed(motor_speed):
		self.speeds = motor_speed

	
	def step(self, dt):
		g = np.zeros(3)
		g[0] = (self.r*dt/2.0)*(self.speeds.left_speed + self.speeds.right_speed)*math.cos(self.mu[2])
		g[1] = (self.r*dt/2.0)*(self.speeds.left_speed + self.speeds.right_speed)*math.sin(self.mu[2])
		g[2] = (self.r*dt/self.L)*(self.speeds.right_speed - self.speeds.left_speed)

		mu_bar = self.mu + g
		
		# initialize state variable Jacobian, G
		G = np.array([[1, 0, -(self.r*dt/2.0)*(self.speeds.left_speed + \
				self.speeds.right_speed)*math.sin(self.mu[2])], \
				[0, 1, (self.r*dt/2.0)*(self.speeds.left_speed + \
				self.speeds.right_speed)*math.cos(self.mu[2])], [0, 0, 1]])
		
		# initialize motion variable Jacobian, V
		V = np.zeros((3,2))
		V[0][0] = (self.r*dt/2.0)*math.cos(self.mu[2])
		V[0][1] = (self.r*dt/2.0)*math.cos(self.mu[2])
		V[1][0] = (self.r*dt/2.0)*math.sin(self.mu[2])
		V[1][1] = (self.r*dt/2.0)*math.sin(self.mu[2])
		V[2][0] = -(self.r*dt)/self.L
		V[2][1] = (self.r*dt)/self.L

		M = np.zeros((2,2))
		M[0][0] = self.alpha*self.speeds.left_speed*self.speeds.left_speed + \
				self.alpha*self.speeds.right_speed*self.speeds.right_speed
		
		M[1][1] = self.alpha*self.speeds.left_speed*self.speeds.left_speed + \
				self.alpha*self.speeds.right_speed*self.speeds.right_speed
		
		sigma_bar = np.matmul(G, np.matmul(self.sigma, np.transpose(G)))
		sigma_bar += np.matmul(V, np.matmul(M, np.transpose(V)))


		# measurement update
		if self.gpsdata is not None and len(compass_bearing) > 0:

			z = np.zeros(3)
			z[0] = self.gpsdata.longitude
			z[1] = self.gpsdata.latitude
			z[2] = sum(self.compass_bearings)/len(compass_bearings)
			
			
			C_inv = np.zeros((3,3))
			C_inv[0][0] = distance.distance((self.zero_point.latitude,self.gpsdata.longitude), self.zero_point).km*1000.0
			C_inv[1][1] = distance.distance((self.gpsdata.latitude, self.zero_point.longitude), self.zero_point).km*1000.0
			C_inv[2][2] = 1

			C = np.linalg.inv(C_inv)

			# compute Kalman gain
			temp = np.matmul(C, np.matmul(sigma_bar, np.transpose(C))) + self.Q
			K = np.matmul(sigma_bar, np.matmul(np.transpose(C), temp))

			# compute next mu
			temp = z - np.dot(C, mu_bar)
			mu_bar += np.matmul(K, temp)

			# compute next sigma
			identity = np.identity((3,3))
			temp = identity - np.matmul(K,C)
			sigma_bar = np.matmul(temp, sigma_bar)

		else:
			pass
		
		self.mu = mu_bar
		self.sigma = sigma_bar
		
		self.compass_bearing = []
		
		




def main():
	
	frequency = 2
	
	rospy.init_node("localization_node")
	timer = rospy.Rate(frequency)
	
	mu0 = np.zeros(3)
	sigma0 = np.identity(3)
	
	zero_point = gps_data()
	zero_point.latitude = 43.12597001153724
	zero_point.longitude = -77.63038777363798
	
	localizer = EKF_Localization(mu0, sigma0, 0.5, 0.002554, 0.01, 2.0, 5.0, zero_point)
	
	gps_subscriber = rospy.Subscriber('gps_data', gps_data, localizer.handle_GPS)
	compass_subscriber = rospy.Subscriber('CompassBearing', CompassBearing, localizer.handle_compass)
	motion_subscriber = rospy.Subscriber('motor_speed', MotorSpeed, localizer.handle_motor_speed)
	pose_publisher = rospy.Publisher('pose', Pose, queue_size=1)
	
	print("Running...")
	while not rospy.is_shutdown():
		
		# computes the localization update
		localizer.step(float(1/frequency))
		
		pose = Pose()
		pose.position.x = localizer.mu[0]
		pose.position.y = localizer.mu[1]
		pose.orientation = yaw_to_quaternion(localizer.mu[2])
		
		pose_publisher.publish(pose)
		
		timer.sleep()
		
		
		
		
		
		
