#! /usr/bin/python3


import rospy
from collision_detection.msg import CollisionInfo, Obstacle
from distance_sensor.msg import Distance


class CollisionDetection:
	
	def __init__(self, range_max=10):
		self.range_max = range_max

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
		obstacle_center.distance = self.distances.distance_center
		obstacle_center.priority = 1/self.distances.distance_center

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

	while not rospy.is_shutdown():

		collisions = detector.detect()

		alert_publisher.publish(collision)

		timer.sleep()

