#! /usr/bin/python3


import rospy
import math
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Quaternion
from collision_detection.msg import CollisionInfo
from executive.msg import Waypoint
from gps.msg import gps_data
from navigation.msg import MotorSpeed
from navigation.msg import WaypointReached


def yaw_to_quaternion(yaw):
	quaternion = Quaternion()
	quaternion.w = math.cos( yaw / 2.0 )
	quaternion.x = 0.0
	quaternion.y = 0.0
	quaternion.z = math.sin( yaw / 2.0 )
	return quaternion


def quaternion_to_yaw(quaternion):
	yaw = math.atan2(2.0*(quaternion.y*quaternion.z + quaternion.w*quaternion.x), quaternion.w*quaternion.w - quaternion.x*quaternion.x - quaternion.y*quaternion.y + quaternion.z*quaternion.z)
	return yaw


class Navigation:

    def __init__(self):
        self.is_reached = False
        self.pose = Pose()
        self.pose.position.x = 0.0
        self.pose.position.y = 0.0
        self.pose.orientation = yaw_to_quaternion(0.0)
        
        self.gps_pos = gps_data()
        self.gps_pos.latitude = 0.0
        self.gps_pos.longitude = 0.0
        
        self.collision_info = CollisionInfo()
        
        self.next_waypoint = Waypoint()
        self.next_waypoint.latitude = 0.0
        self.next_waypoint.longitude = 0.0
        self.next_waypoint.waypoint_number = 0
        self.next_waypoint.is_last = False

    def handle_GPS(self, gpsdata):
        self.gps_pos = gpsdata

    def handle_pose(self, pose):
        self.pose = pose
    

    def handle_collision_info(self, collision_info):
        self.collision_info = collision_info
    
    
    def handle_waypoint(self, waypoint):
        self.next_waypoint = waypoint



# Takes in a specific bearing and uses the magnetometer to turn towards the desired heading
def turn_to_bearing(heading, target):
    tolerance = 10 # Must reach a heading within 10 degrees of target
    diff = abs(target - heading) # Degrees left to turn
    
    slow_speed = 30 # 128 +/- 32 (depending on forward or reverse)
    medium_speed = 60 # 128 +/- 64 
    high_speed = 90
    stop = 128 # Writing 128 to the hero will set speed to zero
    
    
    if(diff > tolerance):
        turn_left = False if diff > 180 else True # Determines most efficient turning direction

        if (diff < 30):
            spd_left = 128 - slow_speed if turn_left else 128 + slow_speed
            spd_right = 128 + slow_speed if turn_left else 128 - slow_speed
        elif (diff < 60):
            spd_left = 128 - medium_speed if turn_left else 128 + medium_speed
            spd_right = 128 + medium_speed if turn_left else 128 - medium_speed
        else:
            spd_left = 128 - high_speed if turn_left else 128 + high_speed
            spd_right = 128 + high_speed if turn_left else 128 - high_speed

        return (spd_left, spd_right) # Pass instructions to motor controllers
    else:
        return (stop, stop) # Stop after difference is within the tolerance   
    
    
def calculate_initial_compass_bearing(pointA, pointB):
    if (type(pointA) != tuple) or (type(pointB) != tuple):
        return 0
        #raise TypeError("Only tuples are supported as arguments")

    lat1 = math.radians(pointA[0])
    lat2 = math.radians(pointB[0])

    diffLong = math.radians(pointB[1] - pointA[1])

    x = math.sin(diffLong) * math.cos(lat2)
    y = math.cos(lat1) * math.sin(lat2) - (math.sin(lat1)
            * math.cos(lat2) * math.cos(diffLong))

    initial_bearing = math.atan2(x, y)

    # Now we have the initial bearing but math.atan2 return values
    # from -180?? to + 180?? which is not what we want for a compass bearing
    # The solution is to normalize the initial bearing as shown below
    initial_bearing = math.degrees(initial_bearing)
    compass_bearing = (initial_bearing + 360) % 360

    return compass_bearing



def main():

    frequency = 10

    rospy.init_node("navigation_node")
    timer = rospy.Rate(frequency)

    navigator = Navigation()


    pose_subscriber = rospy.Subscriber('pose', Pose, navigator.handle_pose)
    collision_subscriber = rospy.Subscriber("collision_alert", CollisionInfo, navigator.handle_collision_info)
    waypoint_subscriber = rospy.Subscriber("waypoint", Waypoint, navigator.handle_waypoint)
    gps_subscriber = rospy.Subscriber("gps_data", gps_data, navigator.handle_GPS)

    motor_speed_publisher = rospy.Publisher("motor_speed", MotorSpeed, queue_size=1)
    reached_waypoint_publisher = rospy.Publisher("waypoint_reached", WaypointReached, queue_size=1)

    print("Running...")
    while not rospy.is_shutdown():

        # do tha nav stuff
        cur_pos = (navigator.gps_pos.latitude, navigator.gps_pos.longitude)
        heading = quaternion_to_yaw(navigator.pose.orientation)
        bearing = calculate_initial_compass_bearing(cur_pos, (navigator.next_waypoint.latitude, navigator.next_waypoint.longitude))
        
        if(navigator.collision_info.left.distance < 50 or navigator.collision_info.right.distance < 50 or navigator.collision_info.center.distance < 75):
            spd_left, spd_right = (128, 128) # Stop movement
        elif(abs(heading - bearing) > 10):
            spd_left, spd_right = turn_to_bearing(heading, bearing)
        elif(not navigator.is_reached): # Stealing from line 67, is this right?
            spd_left, spd_right = (192, 192) # 50% speed forward
        else:
            spd_left, spd_right = (128, 128) # Stop movement
        

        motor_speed = MotorSpeed()
        motor_speed.left_speed = spd_left
        motor_speed.right_speed = spd_right

        motor_speed_publisher.publish(motor_speed)

        if navigator.is_reached:
            waypoint_reached = WaypointReached()
            waypoint_reached.latitude = self.next_waypoint.latitude
            waypoint_reached.longitude = self.next_waypoint.longitude
            waypoint_reached.waypoint_number = self.next_waypoint.waypoint_number
            reached_waypoint_publisher.publish(waypoint_reached)

        timer.sleep()


        
        
        

