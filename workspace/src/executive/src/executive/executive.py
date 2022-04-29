#! /usr/bin/python3

import rospy
from executive.msg import Waypoint



class Executive:
    
    def __init__(self, goal):
        self.goal = goal
        self.current_waypoint = 0
    
    # add waypoint generation code here
    def generate_waypoints(self):
        pass
    
    def handle_GPS(self, gpsdata):
        if self.starting_pos is None:
            self.starting_pos = gpsdata
            self.generate_waypoints()
    
    
    def get_next_waypoint(self):
        self.current_waypoint += 1
        return waypoints[current_waypoint]


    def handle_waypoint_reached(self, waypoint_reached):
        self.waypoint_reached = True
    



def main():

    frequency = 2

    rospy.init_node("executive_node")
    timer = rospy.Rate(frequency)

    executive = Executive()

    gps_subscriber = rospy.Subscriber("gps", gps_data, executive.handle_GPS)
    reached_waypoint_subscriber = rospy.Subscriber("waypoint_reached", WaypointReached, executive.handle_waypoint_reached)
    waypoint_publisher = rospy.Publisher("waypoint", Waypoint, queue_size=1)

    while not rospy.is_shutdown():
        if executive.waypoint_reached:
            next_waypoint = executive.get_next_waypoint()
            waypoint_publisher.publish(next_waypoint)


