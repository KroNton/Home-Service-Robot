#!/bin/sh
xterm  -e  "source /opt/ros/melodic/setup.bash; roscore " &

sleep 5

xterm  -e  "cd $(pwd)/../..;
source devel/setup.bash;
export ROBOT_INITIAL_POSE='-x -5 -y -2 -z 0 -R 0 -P 0 -Y 0';
roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$(pwd)/../../src/Home-Service-Robot/hs_robot/worlds/maze.world" & 

sleep 5

xterm  -e  "cd $(pwd)/../..;
source devel/setup.bash;
roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$(pwd)/../../src/Home-Service-Robot/hs_robot/maps/mymap.yaml" & 

sleep 5

xterm  -e  "cd $(pwd)/../..;
source devel/setup.bash;
roslaunch turtlebot_rviz_launchers view_navigation.launch" & 

sleep 8

xterm  -e  "cd $(pwd)/../..;
source devel/setup.bash;
rosrun pick_objects pickup_objects "& 

xterm  -e  "source devel/setup.bash;
rosrun add_markers add_markers"