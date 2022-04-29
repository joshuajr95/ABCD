#! /usr/bin/python3


import rospy
from collision_detection.msg import CollisionInfo, Obstacle
from distance_sensor.msg import Distance
from geometry_msgs.msg import Pose


class CollisionDetection:
	
	def __init__(self, range_max=250):
		self.range_max = range_max
		self.distances = Distance()
		self.distances.distance_left = self.range_max
		self.distances.distance_front = self.range_max
		self.distances.distance_right = self.range_max
		
		self.pose = Pose()

	def handle_distances(self, distances):
		self.distances = distances
	
	def handle_pose(self, pose):
		self.pose = pose

	# calculate collision likelihood
	def detect(self):
		
		obstacles = CollisionInfo()

		obstacle_left = Obstacle()
		obstacle_left.distance = self.distances.distance_left
		obstacle_left.priority = 1/self.distances.distance_left

		obstacle_right = Obstacle()
		obstacle_right.distance = self.distances.distance_right
		obstacle_right.priority = 1/self.distances.distance_right

		obstacle_center = Obstacle()
		obstacle_center.distance = self.distances.distance_front
		obstacle_center.priority = 1/self.distances.distance_front

		obstacles.left = obstacle_left
		obstacles.center = obstacle_center
		obstacles.right = obstacle_right

		return obstacles






def main():
	
	frequency = 20
	detector = CollisionDetection()

	rospy.init_node("collision_detection_node")
	timer = rospy.Rate(frequency)

	distance_subscriber = rospy.Subscriber("distance", Distance, detector.handle_distances)
	pose_subscriber = rospy.Subscriber("pose", Pose, detector.handle_pose)
	alert_publisher = rospy.Publisher("collision_alert", CollisionInfo, queue_size=1)

	print("Running...")
	while not rospy.is_shutdown():

		collisions = detector.detect()

		alert_publisher.publish(collisions)

		timer.sleep()

