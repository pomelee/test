FROM ros:dashing-ros-base-bionic

RUN apt-get update

# Install TurtleBot3 ROS 2 Packages
RUN git clone https://github.com/pomelee/test.git && \
    cp test/src/install.sh . && \
    chmod +x install.sh && \
    ./install.sh

# Merge Test example
RUN cp test/src/run.sh && \
	chmod +x teleop_keyboard.py && \
	cp test/src/teleop_keyboard.py /turtlebot3_ws/src/turtlebot3/turtlebot3/turtlebot3_teleop/turtlebot3_teleop/script/ && \
	chmod +x run.sh

# Run Turtlebot3
CMD ["/bin/bash", "./run.sh"]

