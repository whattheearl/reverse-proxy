#!/bin/bash
EC2HOME="/home/ec2-user"
LOG="${EC2HOME}/logs/deploy"
echo "$EUID $UID" >> LOG

echo removing project
sudo rm -rf "${EC2HOME}/express"

echo "cloning https://github.com/whattheearl/reverse-proxy.git to ${EC2HOME}/express"
git clone https://github.com/whattheearl/reverse-proxy.git "${EC2HOME}/express"

echo remove services
cd "${EC2HOME}/express"
docker-compose down

echo spinning up services
docker-compose up -d