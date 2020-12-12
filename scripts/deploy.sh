echo removing project
sudo rm -rf ~/express

echo "cloning https://github.com/whattheearl/reverse-proxy.git to ~/express"
git clone https://github.com/whattheearl/reverse-proxy.git ~/express

echo remove services
cd ~/express
docker-compose down

echo spinning up services
docker-compose up -d