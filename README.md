# Home-Service-Robot
Project Objectives

The purpose of this project was to create a gazebo environment for a robot and programming a home-service robot to map its environment and independently go to pre-determined pickup and drop-off places. For this, you'll need to:

* In Gazebo, use the Building Editor to create a robot's surroundings.

* Teleoperate the robot and test SLAM manually.

* Using the ROS navigation stack and the 2D Nav Goal arrow in rviz, manually direct the robot to go to two different desired positions and orientations.

* Create a pick objects node to direct the robot to the desired pickup and drop-off locations.

* To complete the intended home service robot implementation, change the pick objects and add markers nodes to establish communication between them. 

### Directory Tree and contents

```
.
├── README.md
│   ├── ... ...
├── CMakeLists.txt
├── add_markers
│   ├── include 
│   └── src
│       ├── add_markers.cpp
│       └── add_markers_demo.cpp
├── pick_objects
│   └── src
│       ├── pick_objects.cpp
│       
│   ├──  ... ...
├── scripts
│   ├── add_marker.sh
│   ├── home_service.sh
│   ├── pick_objects.sh
│   ├── test_navigation.sh
│   └── test_slam.sh
├── slam_gmapping
│   ├── gmapping
│   |── ... ...
├── turtlebot
│   |── turtlebot_teleop
│   |── ... ...
├── turtlebot_interactions
│   |── turtlebot_rviz_launchers
│   |── ... ...
|── turtlebot_simulator
│   ├── turtlebot_gazebo
│
│   ├──  ... ...
├── hs_robot
│   ├── maps
│   │    ├── mymap.pmg
│   │    └──mymap.yaml
│   ├── worlds
│   │    └── maze.world
│   ├── config
│   │    └── navigation.rviz
│   ├── launch
│   │    └── navigation_rviz.launch
│   └── ...
|── ... ...
```

This directory represents the main project's `src` folder structure with following contents

* README.md: this file.
* **images** - folder with images and videos for this report
* **add_markers** - add marker C++ node
* **config** - folder with configuration file to specify pick-up and drop-off locations
* **map** - map and gazebo world files
* **pick_objects** - pick-objects C++ node
* **rvizConfig** - folder with rViz configurations used with some launch scripts
* **scripts** - shell scripts
	* `add_marker.sh` - script for testing add_marker concept with `add_markers_demo.cpp`
	* `home_service.sh` - main script for the home-service-robot
	* `pick_objects.sh` - script for testing pick_objects concept with `pick_objects_test`
	* `test_navigation.sh` - script for testing navigation
	* `test_slam.sh` - script for performing SLAM and preparing map
* **slam_gmapping** - official ROS package with `gmapping_demo.launch` file
* **turtlebot** - official ROS package with `keyboard_teleop.launch` file
* **turtlebot_interactions** - official ROS package with `view_navigation.launch` file
* **turtlebot_simulator** - official ROS package with `turtlebot_world.launch` file

---

### Clone and Build

Since the folder presented here comprises only of ROS package, one needs to first create a catkin workspace and initialize it. Also, note that the official ROS packaged are already included here, but their dependencies need to be installed; steps for this are given below.

Within your `home` directory, execute the following:

```
mkdir -p Home-Service-Robot/src
cd Home-Service-Robot/src
catkin_init_workspace
```
Install dependencies:

```
rosdep -i install gmapping -y
rosdep -i install turtlebot_teleop -y
rosdep -i install turtlebot_rviz_launchers -y
rosdep -i install turtlebot_gazebo -y
```

`NOTE`: If any of the official packages give error, I recommed you delete associated folder and clone with src folder using appropriate line from here:

```
git clone https://github.com/ros-perception/slam_gmapping.git  
git clone https://github.com/turtlebot/turtlebot.git  
git clone https://github.com/turtlebot/turtlebot_interactions.git  
git clone https://github.com/turtlebot/turtlebot_simulator.git
```

Go back to catkin workspace and build it

```
cd ~/ Home-Service-Robot/
catkin_make
```

### Launch specific application and visualize

Specific applications can be launched using scripts provided. In this section I will go over how I have used these scripts.

##### Gazebo-world, SLAM test & map-creation

For my world file I started with the gazebo-world I have used in past. However, during SLAM and map preparation I realized that this world had following flaws:

* it has very few features and a lot of open space. This leads to `gmapping` error with following messages:
	* `Scan Matching Failed, using odometry. Likelihood=0`
* There were two carts in the model which were not fixed. So while the robot completed a loop and came back to a spot near one of the carts, the mapping algorithm was getting confused and resulting in image rotation in rviz, similar to that shown below.


For SLAM-test go to `src/scripts` folder and run `test_slam.sh` script:

```
cd ~/ Home-Service-Robot/src/scripts
./test_slam.sh
```

This will launch:

* `turtlebot_world.launch` to deploy turtlebot in my world with specific pose
* `gmapping_demo.launch` to perform SLAM
* `view_navigation.launch` to observe map in rviz
* `keyboard_teleop.launch` to manually control robot

After navigating the robot around multiple times, once I was satisfied with the map appearance in comparison to the world-file, I saved it using:

`rosrun map_server map_saver -f <map-location-and-name>`


##### Localization and navigation test

For localization testing, I used `test_localization.sh` as follows:

```
cd ~/ Home-Service-Robot/src/scripts
./test_localization.sh
```

This will launch:

* `turtlebot_world.launch` to deploy turtlebot in my world with specific pose
* `amcl_demo.launch` to localize turtlebot
* `view_navigation.launch` to observe map in rviz

I used `2D Nav` tab in rviz to manually point out to two different goals, one at a time, and direct the robot to reach them and orient itself with respect to them.

##### Navigation Goal Node (pick-objects)

To test robot's capability to reach multiple goals, as specified by the program (and not manually), I created pick_objects package and specifically `pick_objects_test.cpp` function. This can be tested following script which launches turtlebot, AMCL, rviz and pick_objects node:

```
cd ~/ Home-Service-Robot/src/scripts
./pick_objects.sh
```

##### Virtual Objects Node (add-markers)

To model a virtual object with markers in rviz, I created add_markers package and specifically `add_markers.cpp` function. This can be tested following script which launches turtlebot, AMCL, rviz and add_markers node:

```
cd ~/ Home-Service-Robot/src/scripts
./add_markers.sh
```

##### Home-Service-Robot package

To simulate a full home service robot capable of navigating to pick up and deliver virtual objects, communication was established between the add_markers and pick_objects nodes via a `"/goal_reached"` topic. For this purpose modified versions of previous test codes were created respectively `pick_objects.cpp` and `add_markers.cpp`. The entire package can be launched using:

```
cd ~/ Home-Service-Robot/src/scripts
./home_service.sh
```