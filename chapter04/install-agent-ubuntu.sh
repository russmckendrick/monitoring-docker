#!/usr/bin/env bash
sudo sh -c "curl -L http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb > /tmp/zabbix-release_2.4-1+trusty_all.deb 2>/dev/null"
sudo dpkg -i /tmp/zabbix-release_2.4-1+trusty_all.deb
sudo apt-get update
sudo apt-get -y install zabbix-agent jq
sudo usermod -aG docker zabbix
sudo mkdir -p /usr/local/lib/zabbix/agent/
sudo sh -c "curl -L https://drone.io/github.com/jangaraj/Zabbix-Docker-Monitoring/files/zabbix24/src/modules/zabbix_module_docker/zabbix_module_docker.so > /usr/local/lib/zabbix/agent/zabbix_module_docker.so 2>/dev/null"
sudo mkdir -p /etc/zabbix/scripts/
sudo sh -c "curl -L https://raw.githubusercontent.com/bsmile/zabbix-docker-lld/master/usr/lib/zabbix/script/container_discover.sh > /etc/zabbix/scripts/container_discover.sh 2>/dev/null"
sudo chmod +x /etc/zabbix/scripts/container_discover.sh
sudo mv /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bak
sudo sh -c "curl -L https://gist.githubusercontent.com/russmckendrick/fdfc29a1545ce63dcec1/raw/605bf79c722adf0a043a3300d0c07ded1c0c22dc/zabbix_agentd.conf > /etc/zabbix/zabbix_agentd.conf 2>/dev/null"
sudo chmod +x /etc/zabbix/zabbix_agentd.conf
sudo service zabbix-agent restart