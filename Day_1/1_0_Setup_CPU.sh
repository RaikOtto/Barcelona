
######################################################################################################################
#                 Real world setup script of jupyter + tensorflow instance on microsoft azure ON CPU			     #
# it is recommended but not neccessary to use a screen session i.e. screen and use ctrl + c and ctrl + screen_number #
# what you need is the public IP address of your azure instance							     #
######################################################################################################################

### connect with the azure VM instance from YOUR LAPTOP

ssh $MY_IP_ADDRESS -l myuser

USERNAME="myuser"
PASSWORD="0123456789A!"
 
# Entering the VM #

# Setup temporary directory

cd
mkdir Downloads
cd Downloads

# Download data SKIP COMMENTED LINES
#wget https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux
#wget http://developer.download.nvidia.com/compute/redist/cudnn/v7.2.1/cudnn-9.2-linux-x64-v7.2.1.38.tgz
#wget https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.10.1-cp36-cp36m-linux_x86_64.whl
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz

# update the system
sudo apt-get update
sudo apt-get upgrade

# setup conda
# always press YES in case of NO|YES question, in case of open questions hit return e.g. Q1 Yes, Q2 return
bash ~/Downloads/Anaconda3-5.2.0-Linux-x86_64.sh
# Restart
sudo reboot -h 0

# install tensorflow and keras CPU components
conda install tensorflow jupyter tqdm keras

# start jupyter server
jupyter notebook --no-browser --port 8888
#-> copy one of the tokens from the terminal

# Port forwarding
# -> ON YOUR OWN LAPTOP, NOT THE AZURE SESSION -> new local terminal on your laptop
ssh -L 8888:localhost:8888 $MY_IP_ADRESS  -Y -l myuser

# go to browser of your laptop
localhost:8888 

# setup new password (lower half of screen) by copy & paste of token shown in your azure jupyter temrinal
# the password will only be stored after restarting jupyter
# If you get a server 500 error, just reload the website