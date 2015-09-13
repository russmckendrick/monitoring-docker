COMPOSEVERSION=$(curl -s https://raw.githubusercontent.com/russmckendrick/docker-install/master/composeversion)
echo "=> Installing docker-engine ..."
curl -sSL https://get.docker.com/ | sh  > /dev/null 2>&1
echo "=> Starting docker-engine ..."
sudo service docker start > /dev/null 2>&1
echo "=> Installing docker-compose ..."
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$COMPOSEVERSION/docker-compose-`uname -s`-`uname -m` >/usr/local/bin/docker-compose 2>/dev/null"
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1
echo "=> Finished installation of Docker"