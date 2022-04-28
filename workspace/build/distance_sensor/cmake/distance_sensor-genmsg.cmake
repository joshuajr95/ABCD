# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "distance_sensor: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idistance_sensor:/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(distance_sensor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_custom_target(_distance_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "distance_sensor" "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(distance_sensor
  "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distance_sensor
)

### Generating Services

### Generating Module File
_generate_module_cpp(distance_sensor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distance_sensor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(distance_sensor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(distance_sensor_generate_messages distance_sensor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_dependencies(distance_sensor_generate_messages_cpp _distance_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distance_sensor_gencpp)
add_dependencies(distance_sensor_gencpp distance_sensor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distance_sensor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(distance_sensor
  "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distance_sensor
)

### Generating Services

### Generating Module File
_generate_module_eus(distance_sensor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distance_sensor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(distance_sensor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(distance_sensor_generate_messages distance_sensor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_dependencies(distance_sensor_generate_messages_eus _distance_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distance_sensor_geneus)
add_dependencies(distance_sensor_geneus distance_sensor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distance_sensor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(distance_sensor
  "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distance_sensor
)

### Generating Services

### Generating Module File
_generate_module_lisp(distance_sensor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distance_sensor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(distance_sensor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(distance_sensor_generate_messages distance_sensor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_dependencies(distance_sensor_generate_messages_lisp _distance_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distance_sensor_genlisp)
add_dependencies(distance_sensor_genlisp distance_sensor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distance_sensor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(distance_sensor
  "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distance_sensor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(distance_sensor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distance_sensor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(distance_sensor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(distance_sensor_generate_messages distance_sensor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_dependencies(distance_sensor_generate_messages_nodejs _distance_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distance_sensor_gennodejs)
add_dependencies(distance_sensor_gennodejs distance_sensor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distance_sensor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(distance_sensor
  "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor
)

### Generating Services

### Generating Module File
_generate_module_py(distance_sensor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(distance_sensor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(distance_sensor_generate_messages distance_sensor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/distance_sensor/msg/Distance.msg" NAME_WE)
add_dependencies(distance_sensor_generate_messages_py _distance_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distance_sensor_genpy)
add_dependencies(distance_sensor_genpy distance_sensor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distance_sensor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distance_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distance_sensor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(distance_sensor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distance_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distance_sensor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(distance_sensor_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distance_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distance_sensor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(distance_sensor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distance_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distance_sensor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(distance_sensor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distance_sensor/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(distance_sensor_generate_messages_py std_msgs_generate_messages_py)
endif()
