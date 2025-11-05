#! /bin/bash
dnf update
dnf upgrade
dnf install wget
dnf install java-17-openjdk-1:17.0.17.0.10-1.el9.x86_64
wget http://10.0.17.77:8000/rsa_key -P $HOME/Downloads
wget https://github.com/RSCPlus/rscplus/releases/download/Latest/rscplus.jar -P $HOME/Downloads
echo 'alias orsc="java -jar $HOME/Downloads/rscplus.jar"' >> $HOME/.bashrc
source $HOME/.bashrc
echo "Downloads are complete, manual steps required..."
