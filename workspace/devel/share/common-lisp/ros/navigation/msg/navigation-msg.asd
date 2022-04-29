
(cl:in-package :asdf)

(defsystem "navigation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MotorSpeed" :depends-on ("_package_MotorSpeed"))
    (:file "_package_MotorSpeed" :depends-on ("_package"))
    (:file "WaypointReached" :depends-on ("_package_WaypointReached"))
    (:file "_package_WaypointReached" :depends-on ("_package"))
  ))