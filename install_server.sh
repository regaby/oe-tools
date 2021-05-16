#sudo apt update -y
#sudo apt upgrade -y
sudo apt install git -y
sudo apt install python3-distutils -y
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip install odoo-env
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
git clone https://github.com/ntsystemwork/server-tools.git
