#!/bin/bash

source ~/.bashacker
#color

red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
blue='\e[1;34m%s\e[0m\n'
magenta='\e[1;35m%s\e[0m\n'
cyan='\e[1;36m%s\e[0m\n'
##################################################################
clear
echo ""
./.banner
echo ""
#dir setup
read -p  "Enter the company name: " cm
mkdir ~/recon/$cm
cd ~/recon/$cm
read -p "Enter the root Domain: " dm
clear
#################################################################
# assetfinder
printf "$green"   "...assetfinder started..."
printf "$cyan"    "...Domain = $dm..."
printf ""
sleep 1
assetfinder --subs-only $dm > assetfinder.txt
##################################################################
#clear
sleep 1
printf "$green"   "...findomain started..."
printf "$cyan"    "...Domain = $dm..."
echo ""
findomain -t $dm -u findomain.txt
##################################################################

#clear
echo ""
sleep 1
printf "$green"   "...subfinder started..."
printf "$cyan"    "...Domain = $dm..."
echo ""
subfinder -d $dm -o ~/recon/$cm/subfinder.txt
##################################################################
#clear
sleep 1
echo ""
printf "$green"   "...github recon started..."
printf "$cyan"    "...Domain = $dm..."
echo ""
cd
cd tools/d3vnull/sources/github-search/
python3 github-subdomains.py -t <your token> -d $dm | tee ~/recon/$cm/githubrecon.txt
cd ~/recon/$cm/
##################################################################
#clear
sleep 1
printf "$green"   "...sublist3r started..."
printf "$cyan"    "...Domain = $dm..."
echo ""
cd
cd tools/d3vnull/sources/Sublist3r/
python sublist3r.py -d $dm -no ~/recon/$cm/sublister.txt
cd ~/recon/$cm/
##################################################################
#clear
#sleep 1
#echo ""
#printf "$green"   "...subbrute started..."
#printf "$cyan"    "...Domain = $dm..."
#echo ""
#cd
#cd tools/d3vnull/sources/subbrute/
#./subbrute.py -c 50 $dm -o ~/recon/$cm/subrute.txt
cd
##################################################################
# short all domains into one
echo ""
printf "$yellow"  "removing duplicates"
cd ~/recon/$cm/
cat *.txt | sort -u > ~/recon/$cm/reconhacker.txt
cat reconhacker.txt | wc -l
##################################################################
# finding live domains
printf "$green"   "Scanning for live domaind"
cat reconhacker.txt | httprobe -c 50 -t 3000 -p 443 | tee -a ~/recon/$cm/live.txt
cat live.txt | wc -l
##################################################################
