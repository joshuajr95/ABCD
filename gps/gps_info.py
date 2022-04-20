'''
GPS Interfacing with Raspberry Pi using Pyhton
http://www.electronicwings.com
'''
import serial               #import serial pacakge
from time import sleep
import webbrowser           #import package for opening link in browser
import sys                  #import system package

def GPS_Info(NMEA_buff):
    lat_in_degrees = 0
    long_in_degrees = 0
    nmea_latitude = []
    nmea_longitude = []
    nmea_latitude = NMEA_buff[1]            #extract latitude from GPGGA string
    nmea_longitude = NMEA_buff[3]           #extract longitude from GPGGA string
    
    lat = float(nmea_latitude)              #convert string into float for calculation
    longi = float(nmea_longitude)           #convertr string into float for calculation
    
    lat_in_degrees = convert_to_degrees(lat)    #get latitude in degree decimal format
    long_in_degrees = convert_to_degrees(longi) #get longitude in degree decimal format
    
    return lat_in_degrees, long_in_degrees
    
#convert raw NMEA string into degree decimal format   
def convert_to_degrees(raw_value):
    decimal_value = raw_value/100.00
    degrees = int(decimal_value)
    mm_mmmm = (decimal_value - int(decimal_value))/0.6
    position = degrees + mm_mmmm
    position = "%.4f" %(position)
    return position
    

def init_GPS():
    gpgga_info = "$GPGGA,"
    ser = serial.Serial ("/dev/ttyACM0")    #Open port with baud rate
    return gpgga_info, ser
    

def read_GPS(encoding, ser):
    GPGGA_buffer = 0
    NMEA_buff = 0
    lat_in_degrees = 0
    long_in_degrees = 0
    #GPGGA_data_available = 0
    GPGGA_found = False
    
    #while True:
    #received_data = (str)(ser.readline())                   #read NMEA string received
    #GPGGA_data_available = received_data.find(encoding)   #check for NMEA GPGGA string                 
    while(not GPGGA_found):
        received_data = (str)(ser.readline())                   #read NMEA string received
        GPGGA_data_available = received_data.find(encoding)   #check for NMEA GPGGA string  

        if (GPGGA_data_available>0): # Uncomment and instead comment while loop to take the oldest sample in buffer.
            GPGGA_found = True
            GPGGA_buffer = received_data.split("$GPGGA,",1)[1]  #store data coming after "$GPGGA," string 
            NMEA_buff = (GPGGA_buffer.split(','))               #store comma separated data in buffer
            lat_in_degrees, long_in_degrees = GPS_Info(NMEA_buff)   #get time, latitude, longitude
            
    return lat_in_degrees, long_in_degrees

if __name__ == '__main__':
    try:
        gpgga_info, ser = init_GPS() # Init GPS. Returns serial object and the GPS encoding type
        while(True):
            lat_deg, lon_deg = read_GPS(gpgga_info, ser) # Query current position
            print("Latitude: " + str(lat_deg) + ", longitude: " + str(lon_deg))
            
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        