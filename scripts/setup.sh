
echo  installing docker
sudo amazon-linux-extras install docker

echo start docker
sudo service docker start

echo add ec2-user to docker group
sudo usermod -a -G docker ec2-user

echo auto start docker
sudo chkconfig docker on

echo installing git
sudo yum install -y git

# reboot?
echo installing docker-compose
sudo curl -L  https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

