#!/bin/bash

clear
mkdir ~/recon
mkdir ~/tools


echo "--------------------------------WarninG-------------------------------"
sleep 2
echo "-----------------it will update and upgrade your os-------------------"
echo "---if you turn off your machine by accidentlally os will be crash-----"
echo ""
sleep 2 
echo "------------if you want to stop this process press ctrl + Z------------"
echo "------------or leave it .it will start within 10 second----------------"
sleep 10

sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt install -y awscli




echo "Installing Golang"
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
sudo tar -xvf go1.13.4.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashacker
echo 'export GOPATH=$HOME/go'	>> ~/.bashacker			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashacker

go get -u github.com/tomnomnom/httprobe
go get -u github.com/tomnomnom/assetfinder
