#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/dashing/setup.bash"

echo ""
echo "================================="
echo "Install Cartographer dependencies"
# Install Cartographer dependencies
apt install -y \
    google-mock \
    libceres-dev \
    liblua5.3-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libcairo2-dev \
    libpcl-dev \
    python3-sphinx \
    wget

echo ""
echo "================================="
echo "Install turtlebot3 dependencies"
# Install Gazebo9
curl -sSL http://get.gazebosim.org | sh
sudo apt install -y ros-dashing-gazebo-*
# Install Cartographer
sudo apt install -y ros-dashing-cartographer
sudo apt install -y ros-dashing-cartographer-ros
# Install Navigation2
sudo apt install -y ros-dashing-navigation2
sudo apt install -y ros-dashing-nav2-bringup
# Install vcstool
sudo apt install -y python3-vcstool

echo ""
echo "================================="
echo "Install Turtlebot3"
# Install turtlebot3
mkdir -p ~/turtlebot3_ws/src
cd ~/turtlebot3_ws
wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
vcs import src < turtlebot3.repos
colcon build --symlink-install
