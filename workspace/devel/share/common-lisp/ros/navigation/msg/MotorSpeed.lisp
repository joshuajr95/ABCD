; Auto-generated. Do not edit!


(cl:in-package navigation-msg)


;//! \htmlinclude MotorSpeed.msg.html

(cl:defclass <MotorSpeed> (roslisp-msg-protocol:ros-message)
  ((left_speed
    :reader left_speed
    :initarg :left_speed
    :type cl:fixnum
    :initform 0)
   (right_speed
    :reader right_speed
    :initarg :right_speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MotorSpeed (<MotorSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name navigation-msg:<MotorSpeed> is deprecated: use navigation-msg:MotorSpeed instead.")))

(cl:ensure-generic-function 'left_speed-val :lambda-list '(m))
(cl:defmethod left_speed-val ((m <MotorSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:left_speed-val is deprecated.  Use navigation-msg:left_speed instead.")
  (left_speed m))

(cl:ensure-generic-function 'right_speed-val :lambda-list '(m))
(cl:defmethod right_speed-val ((m <MotorSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:right_speed-val is deprecated.  Use navigation-msg:right_speed instead.")
  (right_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorSpeed>) ostream)
  "Serializes a message object of type '<MotorSpeed>"
  (cl:let* ((signed (cl:slot-value msg 'left_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorSpeed>) istream)
  "Deserializes a message object of type '<MotorSpeed>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_speed) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_speed) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorSpeed>)))
  "Returns string type for a message object of type '<MotorSpeed>"
  "navigation/MotorSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSpeed)))
  "Returns string type for a message object of type 'MotorSpeed"
  "navigation/MotorSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorSpeed>)))
  "Returns md5sum for a message object of type '<MotorSpeed>"
  "484d956611ab81479ec19d6a5dc9c74a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorSpeed)))
  "Returns md5sum for a message object of type 'MotorSpeed"
  "484d956611ab81479ec19d6a5dc9c74a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorSpeed>)))
  "Returns full string definition for message of type '<MotorSpeed>"
  (cl:format cl:nil "int8 left_speed~%int8 right_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorSpeed)))
  "Returns full string definition for message of type 'MotorSpeed"
  (cl:format cl:nil "int8 left_speed~%int8 right_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorSpeed>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorSpeed
    (cl:cons ':left_speed (left_speed msg))
    (cl:cons ':right_speed (right_speed msg))
))
