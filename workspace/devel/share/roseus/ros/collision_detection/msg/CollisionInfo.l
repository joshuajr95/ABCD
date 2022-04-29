;; Auto-generated. Do not edit!


(when (boundp 'collision_detection::CollisionInfo)
  (if (not (find-package "COLLISION_DETECTION"))
    (make-package "COLLISION_DETECTION"))
  (shadow 'CollisionInfo (find-package "COLLISION_DETECTION")))
(unless (find-package "COLLISION_DETECTION::COLLISIONINFO")
  (make-package "COLLISION_DETECTION::COLLISIONINFO"))

(in-package "ROS")
;;//! \htmlinclude CollisionInfo.msg.html


(defclass collision_detection::CollisionInfo
  :super ros::object
  :slots (_left _center _right ))

(defmethod collision_detection::CollisionInfo
  (:init
   (&key
    ((:left __left) (instance collision_detection::Obstacle :init))
    ((:center __center) (instance collision_detection::Obstacle :init))
    ((:right __right) (instance collision_detection::Obstacle :init))
    )
   (send-super :init)
   (setq _left __left)
   (setq _center __center)
   (setq _right __right)
   self)
  (:left
   (&rest __left)
   (if (keywordp (car __left))
       (send* _left __left)
     (progn
       (if __left (setq _left (car __left)))
       _left)))
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:right
   (&rest __right)
   (if (keywordp (car __right))
       (send* _right __right)
     (progn
       (if __right (setq _right (car __right)))
       _right)))
  (:serialization-length
   ()
   (+
    ;; collision_detection/Obstacle _left
    (send _left :serialization-length)
    ;; collision_detection/Obstacle _center
    (send _center :serialization-length)
    ;; collision_detection/Obstacle _right
    (send _right :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; collision_detection/Obstacle _left
       (send _left :serialize s)
     ;; collision_detection/Obstacle _center
       (send _center :serialize s)
     ;; collision_detection/Obstacle _right
       (send _right :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; collision_detection/Obstacle _left
     (send _left :deserialize buf ptr-) (incf ptr- (send _left :serialization-length))
   ;; collision_detection/Obstacle _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; collision_detection/Obstacle _right
     (send _right :deserialize buf ptr-) (incf ptr- (send _right :serialization-length))
   ;;
   self)
  )

(setf (get collision_detection::CollisionInfo :md5sum-) "a174fa88f0c00f2e81e61d98593bf57f")
(setf (get collision_detection::CollisionInfo :datatype-) "collision_detection/CollisionInfo")
(setf (get collision_detection::CollisionInfo :definition-)
      "Obstacle left
Obstacle center
Obstacle right
================================================================================
MSG: collision_detection/Obstacle
float64 distance
float64 priority
")



(provide :collision_detection/CollisionInfo "a174fa88f0c00f2e81e61d98593bf57f")


