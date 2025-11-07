#!/bin/bash
# 文件名：start_all_ros_tabs_independent.sh

ROS_WS=/home/isvl/ros_driver

# Livox ROS
gnome-terminal -- bash -c "echo 'Starting livox_ros_driver2...'; source /opt/ros/noetic/setup.bash; source $ROS_WS/devel/setup.bash; roslaunch livox_ros_driver2 msg_MID360.launch; exec bash" &

sleep 2

# MVS Camera ROS
gnome-terminal -- bash -c "echo 'Starting mvs_ros_driver...'; source $ROS_WS/devel/setup.bash; export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH=/opt/MVS/lib/aarch64:$LD_LIBRARY_PATH; roslaunch mvs_ros_driver mvs_camera_trigger.launch; exec bash" &

sleep 2

# Wheeltec Robot ROS
gnome-terminal -- bash -c "echo 'Starting turn_on_wheeltec_robot...'; source /opt/ros/noetic/setup.bash; source $ROS_WS/devel/setup.bash; roslaunch turn_on_wheeltec_robot turn_on_wheeltec_robot.launch; exec bash" &

