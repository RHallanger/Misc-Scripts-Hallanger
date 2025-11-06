#! /bin/bash
dnf update -y
dnf upgrade -y
dnf install wget -y
dnf install java -y
wget http://10.0.17.77:8000/rsa_key -P /NICRSC
wget https://github.com/RSCPlus/rscplus/releases/download/Latest/rscplus.jar -P /NICRSC
echo "Downloads are complete, manual steps required..."

### This script will update and install dependencies, download the required files for NIC-RSC installation.
### It is assumed that this is being executed with root privileges.