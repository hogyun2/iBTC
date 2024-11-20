#!/bin/bash

# download docker image
docker pull cokr6901/ibtc:v1.0

# visualization
xhost +

# run container
docker run --privileged \
	   -it --name ibtc --ipc=host --shm-size=512M \
	   --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	   -e DISPLAY=unix$DISPLAY -v /root/.Xauthority:/root/.Xauthority \
	   --env="QT_X11_NO_MITSHM=1" \
	    cokr6901/ibtc:v1.0 \
	    bash -c "cd /home/test_ws && source devel/setup.bash && roslaunch ibtc loop_test_rgb_avia_privatedata.launch"

