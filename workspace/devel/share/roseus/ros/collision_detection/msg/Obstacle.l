;; Auto-generated. Do not edit!


(when (boundp 'collision_detection::Obstacle)
  (if (not (find-package "COLLISION_DETECTION"))
    (make-package "COLLISION_DETECTION"))
  (shadow 'Obstacle (find-package "COLLISION_DETECTION")))
(unless (find-package "COLLISION_DETECTION::OBSTACLE")
  (make-package "COLLISION_DETECTION::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html


(defclass collision_detection::Obstacle
  :super ros::object
  :slots (_distance _priority ))

(defmethod collision_detection::Obstacle
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:priority __priority) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _priority (float __priority))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:priority
   (&optional __priority)
   (if __priority (setq _priority __priority)) _priority)
  (:serialization-length
   ()
   (+
    ;; float64 _distance
    8
    ;; float64 _priority
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _priority
       (sys::poke _priority (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _priority
     (setq _priority (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get collision_detection::Obstacle :md5sum-) "ebfa18843f7e523990e60f4721176d31")
(setf (get collision_detection::Obstacle :datatype-) "collision_detection/Obstacle")
(setf (get collision_detection::Obstacle :definition-)
      "float64 distance
float64 priority
")



(provide :collision_detection/Obstacle "ebfa18843f7e523990e60f4721176d31")


