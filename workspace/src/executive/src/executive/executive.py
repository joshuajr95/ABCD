#! /usr/bin/python3

import rospy
from executive.msg import Waypoint







def main():

    frequency = 2

    rospy.init_node("executive_node")
    timer = rospy.Rate(frequency)

    
