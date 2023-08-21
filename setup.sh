apt-get update
apt-get -y install sudo
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg

# # Set up Docker apt repository
# sudo install -m 0755 -d /etc/apt/keyrings
# rm -f /etc/apt/keyrings/docker.gpg
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
#  echo \
#   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# # Install Docker Engine
# DOCKER_VERSION=5:20.10.24~3-0~ubuntu-jammy
# sudo apt-get update
# sudo apt-get install -y docker-ce=$DOCKER_VERSION docker-ce-cli=$DOCKER_VERSION containerd.io docker-buildx-plugin docker-compose-plugin

# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker

# # Install Cuda
# CUDA_KEYRING="cuda-keyring_1.1-1_all.deb"
# sudo apt-get update
# sudo apt-get install -y gcc wget
# if [ ! -e "$CUDA_KEYRING" ]; then
#     wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/$CUDA_KEYRING
# fi
# sudo dpkg -i $CUDA_KEYRING
# sudo apt-get update
# sudo apt-get -y install cuda

# sudo apt-get update
# sudo apt-get install -y nvidia-container-toolkit-base

sudo apt-get install -y gcc wget
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
CUDA_KEYRING=cuda-repo-ubuntu2204-12-2-local_12.2.1-535.86.10-1_amd64.deb
if [ ! -e "$CUDA_KEYRING" ]; then
    wget https://developer.download.nvidia.com/compute/cuda/12.2.1/local_installers/$CUDA_KEYRING
fi
sudo dpkg -i $CUDA_KEYRING
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
