#!/bin/bash
mkdir ~/logs
touch ~/logs/setup.txt

echo  installing docker >> ~/logs/setup.txt
sudo amazon-linux-extras install docker

echo start docker >> ~/logs/setup.txt
sudo service docker start

echo add ec2-user to docker group >> ~/logs/setup.txt
sudo usermod -a -G docker ec2-user

echo auto start docker >> ~/logs/setup.txt
sudo chkconfig docker on

echo installing git >> ~/logs/setup.txt
sudo yum install -y git

# reboot?
echo installing docker-compose >> ~/logs/setup.txt
sudo curl -L  https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo git clone https://github.com/whattheearl/reverse-proxy.git /express

echo "adding crontab for deploy script" >> ~/logs/setup.txt
(crontab -l 2>/dev/null; echo "@reboot /express/deploy.sh") | crontab -

sudo reboot