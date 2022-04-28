#! /usr/bin/python3 
 
 
#Libraries
import RPi.GPIO as GPIO
import time
import rospy
from distance_sensor.msg import Distance
 

TRIGGER_FRONT = 17
ECHO_FRONT =  27

TRIGGER_LEFT = 12
ECHO_LEFT = 16

TRIGGER_RIGHT = 5
ECHO_RIGHT = 6
 
def distance(TRIG, ECHO):
    # set Trigger to HIGH
    GPIO.output(TRIG, True)
 
    # set Trigger after 0.01ms to LOW
    time.sleep(0.00001)
    GPIO.output(TRIG, False)
 
    StartTime = time.time()
    StopTime = time.time()
 
    # save StartTime
    while GPIO.input(ECHO) == 0:
        StartTime = time.time()
 
    # save time of arrival
    while GPIO.input(ECHO) == 1:
        StopTime = time.time()
 
    # time difference between start and arrival
    TimeElapsed = StopTime - StartTime
    # multiply with the sonic speed (34300 cm/s)
    # and divide by 2, because there and back
    distance = (TimeElapsed * 34300) / 2
 
    return distance
 
# Initializes three distance sensors
def init_sensors():
    # GPIO Mode (BOARD / BCM)
    GPIO.setmode(GPIO.BCM)
    
    # Set GPIO pins for front sensor
    GPIO.setup(TRIGGER_FRONT, GPIO.OUT)
    GPIO.setup(ECHO_FRONT, GPIO.IN)
    
    
    # Set GPIO pins for left sensor
    GPIO.setup(TRIGGER_LEFT, GPIO.OUT)
    GPIO.setup(ECHO_LEFT, GPIO.IN)
    
    # Set GPIO pins for right sensor
    GPIO.setup(TRIGGER_RIGHT, GPIO.OUT)
    GPIO.setup(ECHO_RIGHT, GPIO.IN)
 
 
# Helper function which calls distance to read each sensor
def read_sensors():
    dist_front = distance(TRIGGER_FRONT, ECHO_FRONT)
    dist_left = distance(TRIGGER_LEFT, ECHO_LEFT)
    dist_right = distance(TRIGGER_RIGHT, ECHO_RIGHT)
    
    return dist_front, dist_left, dist_right # Return tuple containing each distance reading

def main():
    # rate to read distance sensor does not need to be particularly fast
    distance_read_rate = 20

    # initialize the node and create the publisher and timer
    rospy.init_node("distance_sensor_node")
    distance_publisher = rospy.Publisher("distance", Distance, queue_size=1)
    timer = rospy.Rate(distance_read_rate)
    
    print("Running...")

    try:
        print("Before sensor init")
        init_sensors()
        print("After sensor init")
        while not rospy.is_shutdown():
            print("Before sensor read")
        	# read sensor data
            df, dl, dr = read_sensors()
            
            print("After sensor read")
            
            print(f"df is {df}, dl is {dl}, and dr is {dr}")
            
            # create and fill distance message to be published
            distances = Distance()
            distances.distance_front = df
            distances.distance_left = dl
            distances.distance_right = dr
            
            # publish distance 
            distance_publisher.publish(distances)
            
            timer.sleep()
 
    # Reset by pressing CTRL + C
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        GPIO.cleanup()
    
    

