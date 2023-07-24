#!/bin/bash
clear
Part="riscbot_base" #"vehicle_blue"
sdf_file_path="./sdf/riscbot.sdf" #"visualize_lidar.sdf"
gnome-terminal --tab --title='ros_bridge' -e "source /opt/ros/humble/setup.bash; ros2 run ros_gz_bridge parameter_bridge /model/$Part/cmd_vel@geometry_msgs/msg/Twist]ignition.msgs.Twist";
gnome-terminal --tab --title='lidar' -e "ign gazebo -r $sdf_file_path";
gnome-terminal --tab --title='send_commnd' -e "ros2 topic pub /model/$Part/cmd_vel geometry_msgs/Twist \"linear: { x: 1 }\"";