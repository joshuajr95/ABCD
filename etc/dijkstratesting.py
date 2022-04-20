#from turtle import end_fill
#from gettext import find
from gettext import find
import dijkstra
from geopy import distance
import compassbearing

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

def getLocation():
    id = input('what is the id of your current location?\n')
    #lat = input('what is your latitude?\n')
    #long = input('what is your longitude?\n')
    return id

def getDestination():
    id = input('what is the id of your destination?\n')
    #lat = input('what is your desired latitude?\n')
    #long = input('what is your desired longitude?\n')
    return id

def getClosestIntersection(coord, intersections):
    i=1 #closest intersection id
    return i

def findIntersection(intersections, id, data):
    for intersect in intersections:
        #print(intersect[id])
        if intersect[id] == data:
            return intersect

def getCompass(coord1, coord2):
    print("okay")

def planTrip(graph, intersections):
    currentLoc = getLocation() # get current location of the bot
    destination = getDestination() #should location be an intersection or an coordinate
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

def takeTrip(path, intersections):
    print("Your path is: ")
    for i in range(len(path)-1):
        intersect1 = findIntersection(intersections, "id", path[i])
        intersect2 = findIntersection(intersections, "id", path[i+1])
        compass = compassbearing.calculate_initial_compass_bearing(intersect1["coord"], intersect2["coord"])
        print(intersect1["id"] + ", " + str(compass) + " degrees to ")
    print("destination: " + intersect2["id"])

def main():
    graph = dijkstra.Graph() # create a graph object
    intersections = list() # object to store intersection data
    read_vertices(graph, intersections, 'ur.txt') # fill graph object with data from file
    # text file must list all intersections before all edges
    path = planTrip(graph, intersections)
    takeTrip(path, intersections)
    '''
    S, T, A, B, C, D, E, F, G = nodes = list("STABCDEFG")

    graph = dijkstra.Graph()
    graph.add_edge(S, A, 4)
    graph.add_edge(S, B, 3)
    graph.add_edge(S, D, 7)
    graph.add_edge(A, C, 1)
    graph.add_edge(B, S, 3)
    graph.add_edge(B, D, 4)
    graph.add_edge(C, E, 1)
    graph.add_edge(C, D, 3)
    graph.add_edge(D, E, 1)
    graph.add_edge(D, T, 3)
    graph.add_edge(D, F, 5)
    graph.add_edge(E, G, 2)
    graph.add_edge(G, E, 2)
    graph.add_edge(G, T, 3)
    graph.add_edge(T, F, 5)


    dijkstra = dijkstra.DijkstraSPF(graph, S)

    print("%-5s %-5s" % ("label", "distance"))
    for u in nodes:
        print("%-5s %8d" % (u, dijkstra.get_distance(u)))
        '''
main()