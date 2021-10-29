# Install script for directory: /home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/bfl" TYPE FILE FILES
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/bfl_constants.h"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/bfl_err.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibraryx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-bfl.so.0.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-bfl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/liborocos-bfl.so.0.8"
    "/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/liborocos-bfl.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-bfl.so.0.8"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liborocos-bfl.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/wrappers/cmake_install.cmake")
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/sample/cmake_install.cmake")
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/pdf/cmake_install.cmake")
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/model/cmake_install.cmake")
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/filter/cmake_install.cmake")
  include("/home/kyrillos/turtlebot_ws/src/src/orocos-bayesian-filtering/orocos_bfl/src/smoother/cmake_install.cmake")

endif()

