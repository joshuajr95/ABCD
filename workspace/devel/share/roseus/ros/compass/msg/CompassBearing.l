;; Auto-generated. Do not edit!


(when (boundp 'compass::CompassBearing)
  (if (not (find-package "COMPASS"))
    (make-package "COMPASS"))
  (shadow 'CompassBearing (find-package "COMPASS")))
(unless (find-package "COMPASS::COMPASSBEARING")
  (make-package "COMPASS::COMPASSBEARING"))

(in-package "ROS")
;;//! \htmlinclude CompassBearing.msg.html


(defclass compass::CompassBearing
  :super ros::object
  :slots (_bearing ))

(defmethod compass::CompassBearing
  (:init
   (&key
    ((:bearing __bearing) 0.0)
    )
   (send-super :init)
   (setq _bearing (float __bearing))
   self)
  (:bearing
   (&optional __bearing)
   (if __bearing (setq _bearing __bearing)) _bearing)
  (:serialization-length
   ()
   (+
    ;; float32 _bearing
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _bearing
       (sys::poke _bearing (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _bearing
     (setq _bearing (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get compass::CompassBearing :md5sum-) "d288057649bbf117ba71f807d147816d")
(setf (get compass::CompassBearing :datatype-) "compass/CompassBearing")
(setf (get compass::CompassBearing :definition-)
      "float32 bearing

")



(provide :compass/CompassBearing "d288057649bbf117ba71f807d147816d")


