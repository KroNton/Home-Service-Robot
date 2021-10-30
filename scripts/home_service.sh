#!/bin/sh
xterm  -e  "source /opt/ros/melodic/setup.bash; roscore " &

sleep 5

xterm  -e  "export ROBOT_INITIAL_POSE='-x -5 -y -2 -z 0 -R 0 -P 0 -Y 0';
roslaunch turtlebot_gazebo turtlebot_world.launch " & 

sleep 5

xterm  -e  "roslaunch turtlebot_gazebo amcl_demo.launch " & 

sleep 5

xterm  -e  "roslaunch hs_robot navigation_rviz.launch" & 

sleep 8

xterm  -e  "rosrun pick_objects pickup_objects "& 

xterm  -e  "rosrun add_markers add_markers"