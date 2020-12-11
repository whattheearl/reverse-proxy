echo "cloning https://github.com/whattheearl/reverse-proxy.git to /express"
git clone https://github.com/whattheearl/reverse-proxy.git /express

echo spinning up services?
docker-compose up -d