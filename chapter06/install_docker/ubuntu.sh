echo "=> Installing docker-engine ..."
curl -sSL https://get.docker.com/ | sh  > /dev/null 2>&1
echo "=> Configuring vagrant user ..."
sudo usermod -aG docker vagrant
echo "=> Installing docker-compose ..."
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` >/usr/local/bin/docker-compose 2>/dev/null"
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
echo "=> Finished installation of Docker"