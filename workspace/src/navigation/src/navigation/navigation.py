#! /usr/bin/python3


import rospy
from geometry_msgs.msg import Pose


class Navigation:

    def __init__(self):
        self.is_reached = False


    def handle_pose(self, pose):
        self.pose = pose
    

    def handle_collision_info(self, collision_info):
        self.collision_info = collision_info
    
    
    def handle_waypoint(self, waypoint):
        self.next_waypoint = waypoint



def main():

    frequency = 10

    rospy.init_node("navigation_node")
    timer = rospy.Rate(frequency)

    navigator = Navigation()


    pose_subscriber = rospy.Subscriber('pose', Pose, navigator.handle_pose)
    collision_subscriber = rospy.Subscriber("collision_alert", CollisionInfo, navigator.handle_collision_info)
    waypoint_subscriber = rospy.Subscriber("waypoint", Waypoint, navigator.handle_waypoint)

    motor_speed_publisher = rospy.Publisher("motor_speed", MotorSpeed, queue_size=1)
    reached_waypoint_publisher = rospy.Publisher("waypoint_reached", WaypointReached, queue_size=1)

    while not rospy.is_shutdown():

        # do tha nav stuff

        motor_speed = MotorSpeed()
        motor_speed.left_speed = something
        motor_speed.right_speed = something_else

        motor_speed_publisher.publish(motor_speed)

        if self.is_reached:
            waypoint_reached = WaypointReached()
            waypoint_reached.latitude = self.next_waypoint.latitude
            waypoint_reached.longitude = self.next_waypoint.longitude
            waypoint_reached.waypoint_number = self.next_waypoint.waypoint_number
            reached_waypoint_publisher.publish(waypoint_reached)

        timer.sleep()

