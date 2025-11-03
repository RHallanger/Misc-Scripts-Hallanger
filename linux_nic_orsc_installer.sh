dnf update
dnf upgrade
dnf install wget
echo "7445226211319444121974048206228955961629271768435271384344902261087176330690813027426868254531568990267574261861216477661054220967423836386549665137845163" > $HOME/Downloads/openrsc_rsa_key.txt
wget https://github.com/RSCPlus/rscplus/releases/download/Latest/rscplus.jar -P $HOME/Downloads
echo 'alias orsc="java -jar $HOME/Downloads/rscplus.jar"' >> $HOME/.bashrc
source $HOME/.bashrc
echo "Downloads are complete, manual steps required..."
