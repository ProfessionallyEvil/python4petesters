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
# Install additional dependencies
#################################################
apt-get update
apt-get -y install python3-pip whois
apt-get -y install apache2
pushd /var/www/html
git clone https://github.com/ProfessionallyEvil/slice_like_a_ninja slice
popd

#################################################
# ADD LAB EXERCISES
#################################################
pushd /home/vagrant
git clone https://github.com/ProfessionallyEvil/Python4PEPentesters-exercises.git exercises
chown -R vagrant:vagrant exercises/
pip3 install -r /home/vagrant/exercises/REQUIREMENTS.txt
popd

#################################################
# ADD PYCHARM
#################################################
snap install pycharm-community --classic