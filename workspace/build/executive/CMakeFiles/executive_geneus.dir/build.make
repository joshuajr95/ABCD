# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/Desktop/ABCD/workspace/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Desktop/ABCD/workspace/build

# Utility rule file for executive_geneus.

# Include the progress variables for this target.
include executive/CMakeFiles/executive_geneus.dir/progress.make

executive_geneus: executive/CMakeFiles/executive_geneus.dir/build.make

.PHONY : executive_geneus

# Rule to build all files generated by this target.
executive/CMakeFiles/executive_geneus.dir/build: executive_geneus

.PHONY : executive/CMakeFiles/executive_geneus.dir/build

executive/CMakeFiles/executive_geneus.dir/clean:
	cd /home/ubuntu/Desktop/ABCD/workspace/build/executive && $(CMAKE_COMMAND) -P CMakeFiles/executive_geneus.dir/cmake_clean.cmake
.PHONY : executive/CMakeFiles/executive_geneus.dir/clean

executive/CMakeFiles/executive_geneus.dir/depend:
	cd /home/ubuntu/Desktop/ABCD/workspace/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Desktop/ABCD/workspace/src /home/ubuntu/Desktop/ABCD/workspace/src/executive /home/ubuntu/Desktop/ABCD/workspace/build /home/ubuntu/Desktop/ABCD/workspace/build/executive /home/ubuntu/Desktop/ABCD/workspace/build/executive/CMakeFiles/executive_geneus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : executive/CMakeFiles/executive_geneus.dir/depend

