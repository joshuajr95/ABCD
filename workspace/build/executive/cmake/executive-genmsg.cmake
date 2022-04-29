# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "executive: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iexecutive:/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(executive_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_custom_target(_executive_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "executive" "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(executive
  "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/executive
)

### Generating Services

### Generating Module File
_generate_module_cpp(executive
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/executive
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(executive_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(executive_generate_messages executive_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_dependencies(executive_generate_messages_cpp _executive_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(executive_gencpp)
add_dependencies(executive_gencpp executive_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS executive_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(executive
  "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/executive
)

### Generating Services

### Generating Module File
_generate_module_eus(executive
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/executive
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(executive_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(executive_generate_messages executive_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_dependencies(executive_generate_messages_eus _executive_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(executive_geneus)
add_dependencies(executive_geneus executive_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS executive_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(executive
  "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/executive
)

### Generating Services

### Generating Module File
_generate_module_lisp(executive
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/executive
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(executive_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(executive_generate_messages executive_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_dependencies(executive_generate_messages_lisp _executive_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(executive_genlisp)
add_dependencies(executive_genlisp executive_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS executive_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(executive
  "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/executive
)

### Generating Services

### Generating Module File
_generate_module_nodejs(executive
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/executive
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(executive_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(executive_generate_messages executive_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_dependencies(executive_generate_messages_nodejs _executive_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(executive_gennodejs)
add_dependencies(executive_gennodejs executive_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS executive_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(executive
  "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive
)

### Generating Services

### Generating Module File
_generate_module_py(executive
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(executive_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(executive_generate_messages executive_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/Desktop/ABCD/workspace/src/executive/msg/Waypoint.msg" NAME_WE)
add_dependencies(executive_generate_messages_py _executive_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(executive_genpy)
add_dependencies(executive_genpy executive_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS executive_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/executive)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/executive
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(executive_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/executive)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/executive
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(executive_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/executive)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/executive
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(executive_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/executive)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/executive
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(executive_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/executive/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(executive_generate_messages_py std_msgs_generate_messages_py)
endif()
