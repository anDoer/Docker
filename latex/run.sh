xhost +
docker run -it --mount src="$(pwd)/tex_files",target=/home/andreas/tex_files,type=bind --name test_latex -e DISPLAY --net host andoer/latex /bin/bash
