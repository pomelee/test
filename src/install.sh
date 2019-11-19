#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/dashing/setup.bash"

echo ""
echo "================================="
echo "Install Cartographer dependencies"
# Install Cartographer dependencies
sudo apt-get install -y --no-upgrade \
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
    wget \
    && rm -rf /var/lib/apt/lists/*

echo ""
echo "================================="
echo "Install turtlebot3 dependencies"
# Install Gazebo9
curl -sSL http://get.gazebosim.org | sh
sudo apt-get install -q -y --no-upgrade \
    ros-dashing-gazebo-* \
    ros-dashing-cartographer \
    ros-dashing-cartographer-ros \
    ros-dashing-navigation2 \
    ros-dashing-nav2-bringup \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

echo ""
echo "================================="
echo "Install Turtlebot3"
# Install turtlebot3
mkdir -p /turtlebot3_ws/src
cd /turtlebot3_ws
wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
vcs import src < turtlebot3.repos
colcon build --symlink-install
