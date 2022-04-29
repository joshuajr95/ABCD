import py_qmc5883l

# Create a magnetometer to get robot compass bearings
def init_Magnetometer():
	sensor = py_qmc5883l.QMC5883L() # Create a magnetometer object

	# Changes slightly depending on time and place. 
	sensor.declination = 11.24 # Set for Rochester, NY on 04/26/2022
	
	return sensor # Returns the sensor object instance. 
	

# Reads the compass bearing from the magnetometer.
def read_magnetometer(sensor):
	return sensor.get_bearing()


if __name__ == '__main__':
    try:
        sensor = init_Magnetometer()
        while(True):
            bearing = read_magnetometer(sensor)
            print("Bearing: " + str(bearing))
            sleep(10)
    except KeyboardInterrupt:
        print("Measurement stopped by User")
