#include <ros/ros.h>
#include <math.h>
#include <nav_msgs/Odometry.h>
#include <visualization_msgs/Marker.h>

double pickup_x_pose =3.0;
double pickup_y_pose = -1.0;
double dropoff_x_pose = 6.0;
double dropoff_y_pose = -2.0;

bool item_pickedup = false;
bool item_droppedoff = false;

void robot_pose_Callback(const nav_msgs::Odometry::ConstPtr& poses) {
  double robot_x = poses->pose.pose.position.x;
  double robot_y = poses->pose.pose.position.y;
double pickup_distance = sqrt(pow(robot_x - pickup_x_pose, 2) + pow(robot_y - pickup_y_pose, 2));
 if (pickup_distance < 0.6) {
    item_pickedup = true;
  }

double drop_off_distance = sqrt(pow(robot_x - dropoff_x_pose, 2) + pow(robot_y - dropoff_y_pose, 2));
    if (drop_off_distance < 0.6) {
    item_droppedoff = true;
  } 

}


/*double pickup_state(double robot_x,double robot_y){

double pickup_distance = sqrt(pow(robot_x - pickup_x_pose, 2) + pow(robot_y - pickup_y_pose, 2));
 if (pickup_distance < 0.3) {
    item_pickedup = true;
  }
}

double dropoff_state(double robot_x,double robot_y){

double drop_off_distance = sqrt(pow(robot_x - dropoff_x_pose, 2) + pow(robot_y - dropoff_y_pose, 2));
    if (drop_off_distance < 0.3) {
    item_droppedoff = true;
  }
}*/

int main( int argc, char** argv )
{

  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
   ros::Subscriber odom_sub = n.subscribe("odom", 10, robot_pose_Callback);
  // Set our initial shape type to be a cube
  uint32_t shape = visualization_msgs::Marker::CUBE;

   
  
    visualization_msgs::Marker marker;
    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "/map";
    marker.header.stamp = ros::Time::now();

    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
    marker.ns = "basic_shapes";
    marker.id = 0;
    marker.lifetime = ros::Duration();
    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
    marker.type = shape;

    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    marker.scale.x = 1.0;
    marker.scale.y = 1.0;
    marker.scale.z = 1.0;

    // Set the color -- be sure to set alpha to something non-zero!
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;
    

    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
    while (ros::ok())
  {

  while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }

  if(item_pickedup == false && item_droppedoff == false){
    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    ROS_INFO("adding pickup marker");
    marker.action = visualization_msgs::Marker::ADD;
    marker.pose.position.x = pickup_x_pose;
    marker.pose.position.y = pickup_y_pose;

    marker_pub.publish(marker);
  }
    // Set the scale of the marker -- 1x1x1 here means 1m on a side
  else if(item_pickedup== true && item_droppedoff == false){
    sleep(5.0);
    ROS_INFO("removing pickup marker");
    marker.action = visualization_msgs::Marker::DELETE;
    marker_pub.publish(marker); 
  }

     else if(item_droppedoff==true){
      sleep(2.0);
      
      ROS_INFO("adding drop off marker");
    marker.action = visualization_msgs::Marker::ADD;
    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    marker.pose.position.x = dropoff_x_pose;
    marker.pose.position.y = dropoff_y_pose;

    marker_pub.publish(marker); 
    }
  
    

    
        // Publish the marker
    

    r.sleep();
  }
}
}