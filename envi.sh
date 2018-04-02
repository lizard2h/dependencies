#!/bin/bash

echo "install git"
sudo apt-get install git
sudo apt-get install curl
echo "end install git"

echo "\n"

echo "metasploit depencies!"
sudo apt-get install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev
echo "end metasploit dependencies !"

echo "\n"

echo "install nmap from git"
mkdir -p /home/$USER/Documents/tools/nmap
cd  /home/$USER/Documents/tools/nmap
./configure
make
sudo make install
make clean
echo "end install nmap"

echo "\n"

echo "installing rvm !! "

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
ruby -v

echo "ruby install finish, if you dont see ruby version above, something with rvm went wrong"

echo "\n"

echo "install metasploit"
cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R `whoami` /opt/metasploit-framework
cd metasploit-framework
rvm --default use ruby-${RUBYVERSION}@metasploit-framework
gem install bundler
bundle install
echo "finish install metasploit in  opt folder"

echo "\n"


echo "installing WIFI tools"

sudo apt install build-essential autoconf automake libtool pkg-config libnl-3-dev libssl-dev libpcre3-dev ethtool shtool smbclient ghostscript zip 
sudo apt-get install aircrack-ng ; sudo apt-get update

echo "finish WIFI tools"

echo "\n"

echo "Some python dependencies" 

sudo apt-get install -y build-essential python-dev python-pip tcpdump python-capstone \
libnetfilter-queue-dev libffi-dev libssl-dev python-bs4 python-m2crypto ibpython2.7-dev libyaml-dev git libyaml-dev  

echo "Finish python dependencies"

echo "\n"

echo "pip files.. :("

pip3 install requests
pip  install requests
pip install crackmapexec
pip install urllib3
pip install setuptools
pip install netifaces
pip install paramiko 
pip3 install paramiko
pip install lxml netaddr M2Crypto cherrypy mako requests bs4
pip3 install lxml netaddr M2Crypto cherrypy mako requests bs4
echo "finish pip install"

echo "\n"


echo "java tool / burp"

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

echo "finish java shit"

echo "\n"
