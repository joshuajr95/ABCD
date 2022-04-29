#! /usr/bin/python3

import rospy
from gettext import find
import dijkstra
from geopy import distance
#import compassbearing

from executive.msg import Waypoint
from navigation.msg import WaypointReached
from gps.msg import gps_data



def findIntersection(intersections, id, data):
    for intersect in intersections:
        #print(intersect[id])
        if intersect[id] == data:
            return intersect



def read_vertices(graph, intersections, fileName):
    source = open(fileName, 'r')
    for line in source:
        words = line.split()
        if words[0] == 'i':
            # intersection entry, store in dictionaries in list
            # file is i, intersect, lat, long   
            entry = {
                "id": words[1],
                "lat": words[2],
                "long": words[3],
                "coord": (float(words[2]), float(words[3]))
            }
            intersections.append(entry)
        if words[0] == 'r':
            # edge entry, calculate distance from intersections data and store into graph
            # file is (r, id, intersect1, intersect2)
            # graph is (intersect1, intersect2, length)
            for i in intersections:
                if i["id"] == words[2]:
                    start = i["coord"]
                if i["id"] == words[3]:
                    end = i["coord"]
            dist = distance.distance(start, end).miles
            graph.add_edge(words[2], words[3], dist)
            #print(words[2], end='/')
    source.close()


def planTrip(graph, intersections):
    currentLoc = "i1" # get current location of the bot
    destination = "i19" #should location be an intersection or an coordinate
    #step one is go to closest intersection
    iStart = findIntersection(intersections, "id", currentLoc) #getClosestIntersection(currentLoc, intersections)
    iEnd = findIntersection(intersections, "id", destination) #getClosestIntersection(destination, intersections)

    #print(iStart)
    #print(iEnd)

    dij = dijkstra.DijkstraSPF(graph, iStart["id"]) 

    #for u in intersections:
        #print("%s %s" % (u["id"], dij.get_distance(u["id"])))
    path = dij.get_path(iEnd["id"]) #list of nodes
    return path



class Executive:
    
    def __init__(self, graph, intersections, path):
        self.graph = graph
        self.intersections = intersections
        self.path = path
        self.current_waypoint = 0
        self.waypoint_reached = False
        
    '''
    # add waypoint generation code here
    def generate_waypoints(self, path):
        
        for id in path:
        	node = findIntersection(self.intersections
    '''
    
    def handle_GPS(self, gpsdata):
        if self.starting_pos is None:
            self.starting_pos = gpsdata
            self.generate_waypoints()
    
    
    def get_next_waypoint(self):
        self.current_waypoint += 1
        next_id = self.path[self.current_waypoint]
        next_node = findIntersection(self.intersections, "id", next_id)
        
        next_waypoint = Waypoint()
        next_waypoint.latitude = next_node["lat"]
        next_waypoint.longitude = next_node["long"]
        next_waypoint.self.current_waypoint
        
        if self.current_waypoint == len(self.path) - 1:
            next_waypoint.is_last = True
        else:
            next_waypoint.is_last = False
        
        return next_waypoint

    def handle_waypoint_reached(self, waypoint_reached):
        self.waypoint_reached = True
    




def main():

    frequency = 2

    rospy.init_node("executive_node")
    timer = rospy.Rate(frequency)
    
    graph = dijkstra.Graph() # create a graph object
    intersections = list() # object to store intersection data
    read_vertices(graph, intersections, '/home/ubuntu/ur_limited.txt') # fill graph object with data from file
    path = planTrip(graph, intersections)

    executive = Executive(graph, intersections, path)

    gps_subscriber = rospy.Subscriber("gps", gps_data, executive.handle_GPS)
    reached_waypoint_subscriber = rospy.Subscriber("waypoint_reached", WaypointReached, executive.handle_waypoint_reached)
    waypoint_publisher = rospy.Publisher("waypoint", Waypoint, queue_size=1)
    
    print("Running...")

    while not rospy.is_shutdown():
        if executive.waypoint_reached:
            next_waypoint = executive.get_next_waypoint()
            waypoint_publisher.publish(next_waypoint)


