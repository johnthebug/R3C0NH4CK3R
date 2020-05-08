#!/bin/bash

source ~/.bashacker
./.banner.sh
echo ""

sleep 4
read -p "Enter the company name to creat a Directory name = " fl

mkdir ~/recon/$fl

cd ~/recon/$fl

read -p "Enter the Target Domain Name to recon = " dn

assetfinder --subs-only $dn > $fl
cat $fl | httprobe | tee httpout


