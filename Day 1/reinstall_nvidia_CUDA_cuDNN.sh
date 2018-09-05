
######################################################################################################################
# Real world setup script of jupyter + tensorflow instance on microsoft azure					     #
# it is recommended but not neccessary to use a screen session i.e. screen and use ctrl + c and ctrl + screen_number #
# what you need is the public IP address of your azure instance							     #
######################################################################################################################

# Setup temporary directory

cd
mkdir Downloads
cd Downloads

# Download data
wget https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux
wget http://developer.download.nvidia.com/compute/redist/cudnn/v7.2.1/cudnn-9.2-linux-x64-v7.2.1.38.tgz
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

# Remove anything linked to nvidia
sudo apt-get remove --purge nvidia*
sudo apt-get autoremove

# Select one driver (the last one is a decent choice)
sudo apt-get install nvidia-driver-390 nvidia-utils-390 nvidia-cuda-toolkit python-pip3

# restart
sudo reboot -h 0

# Use the toolkit to check your CUDA capable devices
cd ~/NVIDIA_CUDA-9.2_Samples/1_Utilities/deviceQuery
make

# restart
sudo reboot -h 0

# test software
nvidia-smi
nvcc --version

# Test cuda
./NVIDIA_CUDA-9.2_Samples/1_Utilities/deviceQuery/./deviceQuery

# Install cudnn
tar -zxvf cudnn-9.2-linux-x64-v5.1.tgz
sudo mv cuda/include/* /usr/local/cuda-9.2/include/.
sudo mv cuda/lib64/* /usr/local/cuda-9.2/lib64/.

# Reload your shell
. ~/.bashrc

# setup conda

wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh
# ALWAYS PRESS YES IF ASKED FOR NO|YES, in case of not NO|YES question just type enter
## ! OPEN NEW TERMINAL and close old one -> either shift + ctrl + t on linux or use a screen session 
conda install tensorflow
conda install jupyter

# setup python support for tensorflow
pip3 install ~/Downloads/tensorflow_gpu-1.10.1-cp36-cp36m-linux_x86_64.whl

## ! OPEN NEW TERMINAL and close old one
# setup jupyter
jupyter notebook --no-browser --port 8888

# setup portforward ON YOUR OWN LAPTOP, NOT THE AZURE SESSION -> new local terminal

MY_IP_ADDRESS="XXX"
ssh -L 8888:localhost:8888 $MY_UP_ADRESS  -Y -l myuser

# go to browser of your laptop
localhost:8888

# setup new password (lower half of screen) by copy & paste of token shown in your azure jupyter temrinal
