#####################################################
#Launch the attention-tracking-reid part
#####################################################

#Bring up the docker image built by the attention dockerfile
#First time launch
docker run -it --gpus all --network host  --name "container-graceproject-attention-tracking" graceproject-attention-tracking

#Re-entering (start the stopped one)
docker container start container-graceproject-attention-tracking
docker attach container-graceproject-attention-tracking

#Insided the image, cd to the project directory
cd /home/HKUST_GRACE/Grace_Project/

#Configure network params (ROS-IP in particular) if necessary

#Launch the module for tracking, reid, nodding and aversion
source launch_attention.bash



#####################################################
#Launch the attention-headpose-emotion part
#####################################################
#First time loading
docker run -it --name "container-graceproject-attention-head-emotion" --restart=always --network host --gpus all --shm-size=32G -p 6006:6606 -p 8888:8888 -p 6080:80 -p 8022:22 graceproject-attention-head-emotion

#Re-entering (start the stopped one)
docker container start container-graceproject-attention-head-emotion
docker attach container-graceproject-attention-head-emotion

#Insided the image, cd to the project directory
cd /home/HKUST_GRACE/
source ./Grace_Connector/IP_Setup_Local.bash 
python ./Grace_Emotion_HeadPoseAttention/grace_emotion_headposeattention.py








