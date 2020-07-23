# docker build -t aabor/tensorflow:latest .
docker run --gpus all --shm-size=1g --ulimit memlock=-1 -p 8888:8888 -p 6006:6006 \
-v "/home/$USER/projects:/tf/projects" \
-v "/home/$USER/.jupyter:/root/.jupyter" \
-v /home/$USER/Documents:/tf/Documents \
-v /home/$USER/Downloads:/tf/Downloads \
-v /home/$USER/tensorflow_datasets:/root/tensorflow_datasets \
-v /home/$USER/.logdir:/root/logs  \
 --rm aabor/tensorflow:latest
#    aabor/tensorflow:latest \
    
# docker run -it --rm --gpus=all aabor/tensorflow:latest \
#     -v /home/$USER/projects:/tf/projects
#     -v /home/$USER/Documents:/tf/Documents
#     -v /home/$USER/Downloads:/tf/Downloads
#     -v /home/$USER/.jupyter:/root/.jupyter
#     -v /home/$USER/tensorflow_datasets:/root/tensorflow_datasets
#     -v /home/$USER/.logdir:/root/logs  \
#     -p 8888:8888 -p 6006:6006