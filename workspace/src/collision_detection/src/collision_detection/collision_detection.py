#! /usr/bin/python3


import rospy
from collision_detection.msg import CollisionInfo
from distance_sensor.msg import Distance

class CollisionDetection:
	
	def __init__(self):
		pass

	def handle_distances(self, distances):
		self.distances = distances
	
	# calculate collision likelihood
	def detect(self):
		pass




def main():
	
	frequency = 20
	detector = CollisionDetection()

	rospy.init_node("collision_detection_node")

	distance_subscriber = rospy.Subscriber("distance", Distance, detector.handle_distances)
	alert_publisher = rospy.Publisher("collision_alert", CollisionInfo, queue_size=1)

	timer = rospy.Rate(frequency)

	while not rospy.is_shutdown():

		collisions = detector.detect()

		alert_publisher.publish(collision)

		timer.sleep()

