;; Auto-generated. Do not edit!


(when (boundp 'executive::Waypoint)
  (if (not (find-package "EXECUTIVE"))
    (make-package "EXECUTIVE"))
  (shadow 'Waypoint (find-package "EXECUTIVE")))
(unless (find-package "EXECUTIVE::WAYPOINT")
  (make-package "EXECUTIVE::WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude Waypoint.msg.html


(defclass executive::Waypoint
  :super ros::object
  :slots (_latitude _longitude _waypoint_number _is_last ))

(defmethod executive::Waypoint
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:waypoint_number __waypoint_number) 0)
    ((:is_last __is_last) nil)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _waypoint_number (round __waypoint_number))
   (setq _is_last __is_last)
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
  (:is_last
   (&optional (__is_last :null))
   (if (not (eq __is_last :null)) (setq _is_last __is_last)) _is_last)
  (:serialization-length
   ()
   (+
    ;; float32 _latitude
    4
    ;; float32 _longitude
    4
    ;; int32 _waypoint_number
    4
    ;; bool _is_last
    1
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
     ;; bool _is_last
       (if _is_last (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _is_last
     (setq _is_last (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get executive::Waypoint :md5sum-) "9a56c7b6ec935796a4257037b2c62ee0")
(setf (get executive::Waypoint :datatype-) "executive/Waypoint")
(setf (get executive::Waypoint :definition-)
      "float32 latitude
float32 longitude
int32 waypoint_number
bool is_last
")



(provide :executive/Waypoint "9a56c7b6ec935796a4257037b2c62ee0")


