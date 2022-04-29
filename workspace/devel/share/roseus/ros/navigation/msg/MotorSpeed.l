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
    ;; int8 _left_speed
    1
    ;; int8 _right_speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _left_speed
       (write-byte _left_speed s)
     ;; int8 _right_speed
       (write-byte _right_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _left_speed
     (setq _left_speed (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _left_speed 127) (setq _left_speed (- _left_speed 256)))
   ;; int8 _right_speed
     (setq _right_speed (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _right_speed 127) (setq _right_speed (- _right_speed 256)))
   ;;
   self)
  )

(setf (get navigation::MotorSpeed :md5sum-) "484d956611ab81479ec19d6a5dc9c74a")
(setf (get navigation::MotorSpeed :datatype-) "navigation/MotorSpeed")
(setf (get navigation::MotorSpeed :definition-)
      "int8 left_speed
int8 right_speed
")



(provide :navigation/MotorSpeed "484d956611ab81479ec19d6a5dc9c74a")


