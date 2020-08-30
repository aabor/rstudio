# docker build -t aabor/tensorflow:latest .

# https://hub.docker.com/r/metal3d/xvfb
# docker run --name xvfb metal3d/xvfb -d -rm -p 99:99
docker start xvfb
#
# -u $(id -u):$(id -g) \
docker run --gpus all --shm-size=1g --ulimit memlock=-1 \
-d --name tensorflow \
-p 8888:8888 -p 6006:6006 \
-e DISPLAY=xvfb:99 --link xvfb \
-v "/etc/X11/xorg.conf:/etc/X11/xorg.conf" \
-v "/etc/lightdm/lightdm.conf:/etc/lightdm/lightdm.conf" \
-v "/home/$USER/projects:/tf/projects" \
-v "/home/$USER/.jupyter:/root/.jupyter" \
-v "/home/$USER/.keras:/root/.keras" \
-v "/home/$USER/.cache:/root/.cache" \
-v "/home/$USER/.local/share/jupyter/nbextensions:/root/.local/share/jupyter/nbextensions" \
-v /home/$USER/Documents:/tf/Documents \
-v /home/$USER/Downloads:/tf/Downloads \
-v /home/$USER/tensorflow_datasets:/root/tensorflow_datasets \
-v /home/$USER/.logdir:/root/logs  \
 --rm aabor/tensorflow:latest
docker start tensorflow
docker restart tensorflow
docker stop tensorflow
#    aabor/tensorflow:latest \
    
# docker run -it --rm --gpus=all aabor/tensorflow:latest \
#     -v /home/$USER/projects:/tf/projects
#     -v /home/$USER/Documents:/tf/Documents
#     -v /home/$USER/Downloads:/tf/Downloads
#     -v /home/$USER/.jupyter:/root/.jupyter
#     -v /home/$USER/tensorflow_datasets:/root/tensorflow_datasets
#     -v /home/$USER/.logdir:/root/logs  \
#     -p 8888:8888 -p 6006:6006