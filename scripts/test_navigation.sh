#!/bin/sh
xterm  -e  " source /opt/ros/melodic/setup.bash; roscore " &

sleep 5

xterm  -e  "export ROBOT_INITIAL_POSE='-x -5 -y -2 -z 0 -R 0 -P 0 -Y 0';
roslaunch turtlebot_gazebo turtlebot_world.launch " & 

sleep 5

xterm  -e  "roslaunch turtlebot_gazebo amcl_demo.launch " & 

sleep 5

xterm  -e  "roslaunch turtlebot_rviz_launchers view_navigation.launch " 