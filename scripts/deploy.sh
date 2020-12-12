#!/bin/bash
echo downloading deploy script
curl https://raw.githubusercontent.com/whattheearl/reverse-proxy/main/scripts/deploy.sh --output "${EC2HOME}/deploy.sh"
chmod +x "${EC2HOME}/deploy.sh"

echo "adding crontab for deploy script" >> $LOGFILE
(sudo crontab -u "ec2-user" -l 2>/dev/null; echo "@reboot ${EC2HOME}/deploy.sh") | sudo crontab -u "ec2-user" -

EC2HOME="/home/ec2-user"
LOG="${EC2HOME}/logs/deploy"

sudo mkdir "${EC2HOME}/logs"
touch $LOG
echo "$EUID $UID" >> $LOG

echo removing project
sudo rm -rf "${EC2HOME}/express"

echo "cloning https://github.com/whattheearl/reverse-proxy.git to ${EC2HOME}/express"
git clone https://github.com/whattheearl/reverse-proxy.git "${EC2HOME}/express"
sudo chmod +x "${EC2HOME}/express/express/start.sh"

echo remove services
cd "${EC2HOME}/express"
docker-compose down

echo spinning up services
docker-compose up -d