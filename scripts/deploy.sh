echo removing project
rm -rf /express

echo "cloning https://github.com/whattheearl/reverse-proxy.git to /express"
git clone https://github.com/whattheearl/reverse-proxy.git /express

cd /express
echo remove services
docker-compose down

echo spinning up services
docker-compose up -d