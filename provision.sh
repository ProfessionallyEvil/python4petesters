#! /bin/bash

##################################################################
# SYSTEM
##################################################################

echo 'Bootstraping Python4PETesters...'
export DEBIAN_FRONTEND=noninteractive

hostname python4pe

# Disable the apt-daily service, as it interferes with initialization
systemctl disable apt-daily.service
systemctl disable apt-daily.timer

# These next few are in case the apt-daily service has already started
echo 'Waiting for daily apt process to finish...'
echo 'Be Patient: This may take several minutes!'
pcount=$(ps -ef | grep  -c apt.systemd.daily)
while [ $pcount -gt 1 ]
do
	sleep 5
	pcount=$(ps -ef | grep  -c apt.systemd.daily)
done

################################################
# UPDATE PASSWORD
################################################

# Generate hash with: makepasswd --clearfrom=- --crypt <<< python
usermod -p rjNsZEcgokJGU vagrant

#################################################
# ADD PPA FOR PYCHARM
#################################################
sh -c 'echo "deb http://archive.getdeb.net/ubuntu yakkety-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
apt update

#################################################
# Install additional dependencies
#################################################
apt-get -y install python3-pip pycharm whois
# apt-get -y install apache2 mysql-server mysql-client

pip3 install -r /home/vagrant/exercises/REQUIREMENTS.txt



apt-get -y install apache2
pushd /var/www/html
git clone https://github.com/ProfessionallyEvil/slice_like_a_ninja slice
popd

# apt-get -y install libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0
# apt-get -y install libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0
