; Auto-generated. Do not edit!


(cl:in-package navigation-msg)


;//! \htmlinclude WaypointReached.msg.html

(cl:defclass <WaypointReached> (roslisp-msg-protocol:ros-message)
  ((latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (waypoint_number
    :reader waypoint_number
    :initarg :waypoint_number
    :type cl:integer
    :initform 0))
)

(cl:defclass WaypointReached (<WaypointReached>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointReached>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointReached)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name navigation-msg:<WaypointReached> is deprecated: use navigation-msg:WaypointReached instead.")))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <WaypointReached>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:latitude-val is deprecated.  Use navigation-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <WaypointReached>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:longitude-val is deprecated.  Use navigation-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'waypoint_number-val :lambda-list '(m))
(cl:defmethod waypoint_number-val ((m <WaypointReached>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:waypoint_number-val is deprecated.  Use navigation-msg:waypoint_number instead.")
  (waypoint_number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointReached>) ostream)
  "Serializes a message object of type '<WaypointReached>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'waypoint_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointReached>) istream)
  "Deserializes a message object of type '<WaypointReached>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'waypoint_number) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointReached>)))
  "Returns string type for a message object of type '<WaypointReached>"
  "navigation/WaypointReached")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointReached)))
  "Returns string type for a message object of type 'WaypointReached"
  "navigation/WaypointReached")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointReached>)))
  "Returns md5sum for a message object of type '<WaypointReached>"
  "ae1ddeee9499ffebaac8e88a62b4a24e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointReached)))
  "Returns md5sum for a message object of type 'WaypointReached"
  "ae1ddeee9499ffebaac8e88a62b4a24e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointReached>)))
  "Returns full string definition for message of type '<WaypointReached>"
  (cl:format cl:nil "float32 latitude~%float32 longitude~%int32 waypoint_number~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointReached)))
  "Returns full string definition for message of type 'WaypointReached"
  (cl:format cl:nil "float32 latitude~%float32 longitude~%int32 waypoint_number~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointReached>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointReached>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointReached
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':waypoint_number (waypoint_number msg))
))
