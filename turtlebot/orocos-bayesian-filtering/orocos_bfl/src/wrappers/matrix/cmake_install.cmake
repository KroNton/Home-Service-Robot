# Install script for directory: /home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/bfl/wrappers" TYPE FILE FILES "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/config.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/bfl/wrappers/matrix" TYPE FILE FILES
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/matrix_wrapper.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/vector_wrapper.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/matrix_BOOST.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/vector_BOOST.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/matrix_NEWMAT.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/vector_NEWMAT.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/matrix_EIGEN.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/matrix/vector_EIGEN.h"
    )
endif()

