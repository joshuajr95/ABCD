;; Auto-generated. Do not edit!


(when (boundp 'distance_sensor::Distance)
  (if (not (find-package "DISTANCE_SENSOR"))
    (make-package "DISTANCE_SENSOR"))
  (shadow 'Distance (find-package "DISTANCE_SENSOR")))
(unless (find-package "DISTANCE_SENSOR::DISTANCE")
  (make-package "DISTANCE_SENSOR::DISTANCE"))

(in-package "ROS")
;;//! \htmlinclude Distance.msg.html


(defclass distance_sensor::Distance
  :super ros::object
  :slots (_distance_front _distance_left _distance_right ))

(defmethod distance_sensor::Distance
  (:init
   (&key
    ((:distance_front __distance_front) 0.0)
    ((:distance_left __distance_left) 0.0)
    ((:distance_right __distance_right) 0.0)
    )
   (send-super :init)
   (setq _distance_front (float __distance_front))
   (setq _distance_left (float __distance_left))
   (setq _distance_right (float __distance_right))
   self)
  (:distance_front
   (&optional __distance_front)
   (if __distance_front (setq _distance_front __distance_front)) _distance_front)
  (:distance_left
   (&optional __distance_left)
   (if __distance_left (setq _distance_left __distance_left)) _distance_left)
  (:distance_right
   (&optional __distance_right)
   (if __distance_right (setq _distance_right __distance_right)) _distance_right)
  (:serialization-length
   ()
   (+
    ;; float64 _distance_front
    8
    ;; float64 _distance_left
    8
    ;; float64 _distance_right
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance_front
       (sys::poke _distance_front (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_left
       (sys::poke _distance_left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_right
       (sys::poke _distance_right (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance_front
     (setq _distance_front (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_left
     (setq _distance_left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_right
     (setq _distance_right (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get distance_sensor::Distance :md5sum-) "0cdc47dfe636ccbe1ecabbc8b3b2dd90")
(setf (get distance_sensor::Distance :datatype-) "distance_sensor/Distance")
(setf (get distance_sensor::Distance :definition-)
      "float64 distance_front
float64 distance_left
float64 distance_right

")



(provide :distance_sensor/Distance "0cdc47dfe636ccbe1ecabbc8b3b2dd90")


