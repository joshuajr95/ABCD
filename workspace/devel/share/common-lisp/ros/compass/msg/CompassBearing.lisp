; Auto-generated. Do not edit!


(cl:in-package compass-msg)


;//! \htmlinclude CompassBearing.msg.html

(cl:defclass <CompassBearing> (roslisp-msg-protocol:ros-message)
  ((bearing
    :reader bearing
    :initarg :bearing
    :type cl:float
    :initform 0.0))
)

(cl:defclass CompassBearing (<CompassBearing>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CompassBearing>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CompassBearing)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name compass-msg:<CompassBearing> is deprecated: use compass-msg:CompassBearing instead.")))

(cl:ensure-generic-function 'bearing-val :lambda-list '(m))
(cl:defmethod bearing-val ((m <CompassBearing>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader compass-msg:bearing-val is deprecated.  Use compass-msg:bearing instead.")
  (bearing m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CompassBearing>) ostream)
  "Serializes a message object of type '<CompassBearing>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bearing))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CompassBearing>) istream)
  "Deserializes a message object of type '<CompassBearing>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bearing) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CompassBearing>)))
  "Returns string type for a message object of type '<CompassBearing>"
  "compass/CompassBearing")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CompassBearing)))
  "Returns string type for a message object of type 'CompassBearing"
  "compass/CompassBearing")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CompassBearing>)))
  "Returns md5sum for a message object of type '<CompassBearing>"
  "d288057649bbf117ba71f807d147816d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CompassBearing)))
  "Returns md5sum for a message object of type 'CompassBearing"
  "d288057649bbf117ba71f807d147816d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CompassBearing>)))
  "Returns full string definition for message of type '<CompassBearing>"
  (cl:format cl:nil "float32 bearing~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CompassBearing)))
  "Returns full string definition for message of type 'CompassBearing"
  (cl:format cl:nil "float32 bearing~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CompassBearing>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CompassBearing>))
  "Converts a ROS message object to a list"
  (cl:list 'CompassBearing
    (cl:cons ':bearing (bearing msg))
))
