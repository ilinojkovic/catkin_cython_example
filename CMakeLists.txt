cmake_minimum_required(VERSION 2.8.3)
project(catkin_cython_example)


# required to use std::shared_ptr in code
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# ensuring path to libraries are set during install
set(CMAKE_SKIP_BUILD_RPATH  FALSE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)

############################
# Search for dependencies. #
############################
set(CATKIN_PKGS ${CATKIN_PKGS})

find_package(catkin REQUIRED COMPONENTS ${CATKIN_PKGS})

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
catkin_python_setup()

######################################################
# define the include directory of all ${CATKIN_PKGS} #
######################################################
include_directories(
        ${PROJECT_SOURCE_DIR}/include
        ${catkin_INCLUDE_DIRS}
)

##########################################
# export the package as a catkin package #
##########################################
catkin_package(
        INCLUDE_DIRS include
        LIBRARIES ${EXPORTED_LIBRAIRIES}
        CATKIN_DEPENDS ${CATKIN_PKGS}
)

###################
# Cython settings #
###################
# Make the scripts available in the 'cmake' directory available for the
# 'include()' command, 'find_package()' command.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake)

# Include the CMake script UseCython.cmake.  This defines add_cython_module().
# Instruction for use can be found at the top of cmake/UseCython.cmake.
include(UseCython)

# With CMake, a clean separation can be made between the source tree and the
# build tree.  When all source is compiled, as with pure C/C++, the source is
# no-longer needed in the build tree.  However, with pure *.py source, the
# source is processed directly.  To handle this, we reproduce the availability
# of the source files in the build tree.
add_custom_target(ExampleReplicatePythonSourceTree ALL ${CMAKE_COMMAND} -P
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/ReplicatePythonSourceTree.cmake
        ${CMAKE_CURRENT_BINARY_DIR}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory(src/cython)

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
catkin_install_python(PROGRAMS
        scripts/demo_example_a.py
        DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
        )
