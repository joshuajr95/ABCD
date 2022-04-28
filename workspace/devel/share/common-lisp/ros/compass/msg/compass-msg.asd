
(cl:in-package :asdf)

(defsystem "compass-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CompassBearing" :depends-on ("_package_CompassBearing"))
    (:file "_package_CompassBearing" :depends-on ("_package"))
  ))