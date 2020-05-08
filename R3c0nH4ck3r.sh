#!/bin/bash

source .bashacker
./.banner.sh
echo ""
cd /home/recon
sleep 4
read -p "Enter the company name to creat a Directory name = " fl

mkdir $fl

cd $fl

read -p "Enter the Target Domain Name to recon = " dn

assetfinder --subs-only $dn > $fl
cat $fl | httprobe | tee httpout
echo ""
echo ""
echo "-----------------------------crtsh---------------------------"
echo ""
echo ""
mkdir crtsh
cd crtsh
crtsh $dn > crtsh

#cat $fl | httprobe | tee hosts

cat crtsh |httprobe | tee httpout 
#nano hosts
sleep 2
#echo "--------------------------performing curl-------------------------"
#domain = httpout
#n=1
#while read line;do
 #echo " Domain $n : $line"
 #echo $line | tee -a /root/recon/$fl/$fl.txt
 #curl -i -s $line | tee /root/recon/$fl/$line.txt
 #n=$((n=1))
#done < $domain

#meg -v -d 1000 hosts

