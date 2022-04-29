
(cl:in-package :asdf)

(defsystem "collision_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CollisionInfo" :depends-on ("_package_CollisionInfo"))
    (:file "_package_CollisionInfo" :depends-on ("_package"))
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
  ))