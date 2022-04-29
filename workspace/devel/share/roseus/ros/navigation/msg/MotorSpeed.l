;; Auto-generated. Do not edit!


(when (boundp 'navigation::MotorSpeed)
  (if (not (find-package "NAVIGATION"))
    (make-package "NAVIGATION"))
  (shadow 'MotorSpeed (find-package "NAVIGATION")))
(unless (find-package "NAVIGATION::MOTORSPEED")
  (make-package "NAVIGATION::MOTORSPEED"))

(in-package "ROS")
;;//! \htmlinclude MotorSpeed.msg.html


(defclass navigation::MotorSpeed
  :super ros::object
  :slots (_left_speed _right_speed ))

(defmethod navigation::MotorSpeed
  (:init
   (&key
    ((:left_speed __left_speed) 0)
    ((:right_speed __right_speed) 0)
    )
   (send-super :init)
   (setq _left_speed (round __left_speed))
   (setq _right_speed (round __right_speed))
   self)
  (:left_speed
   (&optional __left_speed)
   (if __left_speed (setq _left_speed __left_speed)) _left_speed)
  (:right_speed
   (&optional __right_speed)
   (if __right_speed (setq _right_speed __right_speed)) _right_speed)
  (:serialization-length
   ()
   (+
    ;; int32 _left_speed
    4
    ;; int32 _right_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _left_speed
       (write-long _left_speed s)
     ;; int32 _right_speed
       (write-long _right_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _left_speed
     (setq _left_speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _right_speed
     (setq _right_speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get navigation::MotorSpeed :md5sum-) "a1bb444c72094386d869a17dd234b23b")
(setf (get navigation::MotorSpeed :datatype-) "navigation/MotorSpeed")
(setf (get navigation::MotorSpeed :definition-)
      "int32 left_speed
int32 right_speed

")



(provide :navigation/MotorSpeed "a1bb444c72094386d869a17dd234b23b")


