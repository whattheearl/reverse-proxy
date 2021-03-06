#!/bin/bash
EC2HOME="/home/ec2-user"
LOGFILE="${EC2HOME}/logs/setup.txt"

sudo mkdir "${EC2HOME}/logs"
sudo touch "${EC2HOME}/setup.txt"

echo  installing docker >> $LOGFILE
sudo amazon-linux-extras install docker

echo start docker >> $LOGFILE
sudo service docker start

echo add ec2-user to docker group >>  $LOGFILE
sudo usermod -a -G docker ec2-user

echo auto start docker >> $LOGFILE
sudo chkconfig docker on

echo installing git >> $LOGFILE
sudo yum install -y git

# reboot?
echo installing docker-compose >> $LOGFILE
sudo curl -L  https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo reboot