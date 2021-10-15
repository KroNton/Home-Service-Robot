#!/bin/sh
xterm  -e  " source /opt/ros/melodic/setup.bash; roscore " &

sleep 5

xterm  -e  "roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/home/kyrillos/catkin_ws/src/Home-Service-Robot/hs_robot/worlds/maze.world
 " & 

sleep 5

xterm  -e  " roslaunch turtlebot_gazebo gmapping_demo.launch " & 

sleep 5

xterm  -e  " roslaunch turtlebot_rviz_launchers view_navigation.launch " & 

sleep 5

xterm  -e  " roslaunch turtlebot_teleop keyboard_teleop.launch 
 " 