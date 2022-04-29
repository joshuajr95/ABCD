;; Auto-generated. Do not edit!


(when (boundp 'navigation::WaypointReached)
  (if (not (find-package "NAVIGATION"))
    (make-package "NAVIGATION"))
  (shadow 'WaypointReached (find-package "NAVIGATION")))
(unless (find-package "NAVIGATION::WAYPOINTREACHED")
  (make-package "NAVIGATION::WAYPOINTREACHED"))

(in-package "ROS")
;;//! \htmlinclude WaypointReached.msg.html


(defclass navigation::WaypointReached
  :super ros::object
  :slots (_latitude _longitude _waypoint_number ))

(defmethod navigation::WaypointReached
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:waypoint_number __waypoint_number) 0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _waypoint_number (round __waypoint_number))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:waypoint_number
   (&optional __waypoint_number)
   (if __waypoint_number (setq _waypoint_number __waypoint_number)) _waypoint_number)
  (:serialization-length
   ()
   (+
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; int32 _waypoint_number
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _waypoint_number
       (write-long _waypoint_number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _latitude
     (setq _latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longitude
     (setq _longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _waypoint_number
     (setq _waypoint_number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get navigation::WaypointReached :md5sum-) "ae1ddeee9499ffebaac8e88a62b4a24e")
(setf (get navigation::WaypointReached :datatype-) "navigation/WaypointReached")
(setf (get navigation::WaypointReached :definition-)
      "float32 latitude
float32 longitude
int32 waypoint_number
")



(provide :navigation/WaypointReached "ae1ddeee9499ffebaac8e88a62b4a24e")


