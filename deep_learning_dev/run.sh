xhost +
docker run -it --mount src="$(pwd)/code",target=/home/andreas/code,type=bind --name test_project -e DISPLAY --net host andoer/deep_learning_cpu /bin/bash
