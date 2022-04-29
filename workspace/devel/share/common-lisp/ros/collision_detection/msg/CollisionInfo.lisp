; Auto-generated. Do not edit!


(cl:in-package collision_detection-msg)


;//! \htmlinclude CollisionInfo.msg.html

(cl:defclass <CollisionInfo> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type collision_detection-msg:Obstacle
    :initform (cl:make-instance 'collision_detection-msg:Obstacle))
   (center
    :reader center
    :initarg :center
    :type collision_detection-msg:Obstacle
    :initform (cl:make-instance 'collision_detection-msg:Obstacle))
   (right
    :reader right
    :initarg :right
    :type collision_detection-msg:Obstacle
    :initform (cl:make-instance 'collision_detection-msg:Obstacle)))
)

(cl:defclass CollisionInfo (<CollisionInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CollisionInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CollisionInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_detection-msg:<CollisionInfo> is deprecated: use collision_detection-msg:CollisionInfo instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <CollisionInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_detection-msg:left-val is deprecated.  Use collision_detection-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <CollisionInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_detection-msg:center-val is deprecated.  Use collision_detection-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <CollisionInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_detection-msg:right-val is deprecated.  Use collision_detection-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CollisionInfo>) ostream)
  "Serializes a message object of type '<CollisionInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CollisionInfo>) istream)
  "Deserializes a message object of type '<CollisionInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CollisionInfo>)))
  "Returns string type for a message object of type '<CollisionInfo>"
  "collision_detection/CollisionInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CollisionInfo)))
  "Returns string type for a message object of type 'CollisionInfo"
  "collision_detection/CollisionInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CollisionInfo>)))
  "Returns md5sum for a message object of type '<CollisionInfo>"
  "a174fa88f0c00f2e81e61d98593bf57f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CollisionInfo)))
  "Returns md5sum for a message object of type 'CollisionInfo"
  "a174fa88f0c00f2e81e61d98593bf57f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CollisionInfo>)))
  "Returns full string definition for message of type '<CollisionInfo>"
  (cl:format cl:nil "Obstacle left~%Obstacle center~%Obstacle right~%================================================================================~%MSG: collision_detection/Obstacle~%float64 distance~%float64 priority~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CollisionInfo)))
  "Returns full string definition for message of type 'CollisionInfo"
  (cl:format cl:nil "Obstacle left~%Obstacle center~%Obstacle right~%================================================================================~%MSG: collision_detection/Obstacle~%float64 distance~%float64 priority~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CollisionInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CollisionInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'CollisionInfo
    (cl:cons ':left (left msg))
    (cl:cons ':center (center msg))
    (cl:cons ':right (right msg))
))
