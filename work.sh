#!/bin/bash
#Bluetooth
sudo sed -i 's/InitiallyPowered = true/InitiallyPowered = false/g' /etc/bluetooth/main.conf
rfkill block bluetooth
#mirror
sudo sed -i 's|http://us.archive.ubuntu.com/ubuntu|http://mirrors.mit.edu/ubuntu|g' /etc/apt/sources.list
wget https://raw.githubusercontent.com/abueesp/Scriptnstall/master/bash.bashrc
sudo mv bash.bashrc /etc/bash.bashrc
sudo apt-get update
sudo apt-get upgrade
#SSH
sudo apt-get install ssh -y
newsshkey
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/gnome-keyring-ssh.desktop
sudo sed -i 's/PermitRootLogin without password/PermitRootLogin no/' /etc/ssh/sshd_config #noroot
sudo sed -i 's/Port **/Port 1022/' /etc/ssh/sshd_config #SSH PORT OTHER THAN 22, SET 1022
sudo /etc/init.d/ssh restart
sudo chown -R $USER:$USER .ssh
sudo chmod -R 600 .ssh
sudo chmod +x .ssh
#Docker 
sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
sudo apt-get purge apparmor -y
sudo rm -rf /etc/apparmor.d/
sudo rm -rf /etc/apparmor

#UFW
sudo apt-get install gufw -y
sudo ufw enable
sudo ufw allow 1022/tcp
sudo iptables -F
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 1022 -j ACCEPT
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT ##If you are a server change this to DROP OUTPUT connections by default too
sudo iptables -P FORWARD DROP
sudo iptables restart
sudo service avahi-daemon stop
sudo cupsctl -E --no-remote-any
sudo service cups-browsed stop
#Some tools
sudo apt-get install traceroute -y
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo sed -ir 's/ZSH_THEME="robbyrussell"/ZSH_THEME="norm"/g' ~/.oh-my-zsh #noroot
sudo apt-get install iotop -y
sudo apt-get install fish -y
sudo apt-get install byobu -y
sudo apt-get install autojump -y
sudo apt-get install nmap -y
sudo apt-get install tmux -y
sudo apt-get install htop -y
sudo apt-get install fail2ban -y
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
echo "Please write down an email to send you notifications when someone is attacking your ports: "
read email
echo "You entered: $email"
sed "s/destemail = your_email@domain.com/destemail = $email/g" /etc/fail2ban/jail.local
sed "s/action = %(action_)s/action = %(action_mw)s/g" /etc/fail2ban/jail.local
sed -e "s/enabled  = false/enabled  = true/g" /etc/fail2ban/jail.local
sudo apt-get install gnupg gpgv2 pbuilder ubuntu-dev-tools bzr-builddeb -y
sudo apt-get install zenmap -y
sudo apt-get install pandoc -y
sudo apt-get install virtualbox -y
sudo apt-get install gparted -y
sudo apt-get install nemo -y
sudo apt-get install apt-get install amarok -y
sudo apt-get install duplicity deja-dup -y
sudo apt-get install thunderbird -y
mkdir thunderbird
cd
wget https://addons.mozilla.org/thunderbird/downloads/latest/775/addon-775-latest.xpi
cd ..
sudo apt-get install firefox -y
firefox https://addons.mozilla.org/firefox/downloads/file/271802/no_more_install_delay-3.0-fx+sm+fn+tb.xpi

##GPU

mkdir gpu
cd gpu
wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.22.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.22.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "c40015ed88bf5f50fa58d02252d75cf20b858951" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.0.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.0.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "f840b737faafded451a084ae143285ad68bbfb01" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig


wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.4.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.4.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "bc84945400bd1cabfd7b8ba4e20e71082f32bcc9" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.2.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.2.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "ac1047f9764fd4a4db7dafe47640643164394db9" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.2.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.2.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "3bfa2a2d7521d6481850e8a611efe5bf5ed75200" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.12.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.12.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "3b01a35ac04277ea31cc01b4ac4e230e54b5480c" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

wget https://www.gnupg.org/ftp/gcrypt/gpa/gpa-0.9.9.tar.bz2
wget https://www.gnupg.org/ftp/gcrypt/gpa/gpa-0.9.9.tar.bz2.sig
sha1 = $(sha1sum **tar.bz2)
if [ $sha1 "1cf86c9e38aa553fdb880c55cbc6755901ad21a4" ]
then
    echo "PACKAGE VERIFIED"
else
    echo "PACKAGE NOT VERIFIED"
    break
fi
gpg --verify **.sig **.bz2
tar xvjf **.tar.bz2
cd **
sudo ./configure
sudo make
sudo make install
cd ..
sudo rm **.bz2 && sudo rm **.sig

cd ..
sudo rm -r gpu


##Emacs

readonly version="24.5"
sudo rm emacs-"$version".tar.xz
sudo rm -r emacs-"$version"
#spacemacs
sudo git clone http://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo mv $(sudo find / -name .emacs.d) .emacs.d.bak
sudo mv $(sudo find -name .emacs) .emacs.bak 
##plugins
cd ~/.emacs.d
wget http://github.com/ethereum/emacs-solidity/blob/master/solidity-mode.el ##solidity
(add-to-list load-path "~/.emacs.d/") 
(load "myplugin.el")
cd
sudo rm emacs-"$version".tar.xz


##Github
sudo apt-get install git -y 
git config --global credential.helper cache
# Set git to use the credential memory cache
git config --global credential.helper 'cache --timeout=3600'
# Set the cache to timeout after 1 hour (setting is in seconds)
while true; do
    read -p "Please set your username: " myusername $1
    git config --global user.name $1
    break
done
while true; do
    read -p "Please set your email: " myemailATserverDOTcom $2
    git config --global user.email $2
    break
done

while true; do
    read -p "Please set your core editor: " vim $3
    git config --global core.editor $1
    break
done
while true; do
    read -p "Please set your diff app: " vimdiff $4
    git config --global merge.tool $4
    break
done
git config --list
echo "Here you are an excellent Github cheatsheet https://raw.githubusercontent.com/hbons/git-cheat-sheet/master/preview.png You can also access as gitsheet"
echo "If you get stuck, run ‘git branch -a’ and it will show you exactly what’s going on with your branches. You can see which are remotes and which are local."
echo "Do not forget to add a newsshkey or clipboard your mysshkey or mylastsshkey (if you switchsshkey before) and paste it on Settings -> New SSH key and paste it there." 


sh -c "curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh"
echo "installed vimcr"
wget https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc && sudo chmod -R 600 sshrc && chmod +x sshrc && sudo mv sshrc /usr/local/bin
echo "ssh bashcr vimcr portability installed"


#Ethr
sudo apt-get install gfortran aptitude libghc-curl-dev liblzma-dev -y 
sudo aptitude install r-base -y
sudo aptitude install openjdk-7-source -y
sudo updatedb
sudo wget https://cran.r-project.org/src/base-prerelease/R-latest.tar.gz
tar -xvzf R-latest.tar.gz
sudo rm -r -f R-latest.tar.gz
cd R-**
sudo mkdir prce
cd prce
sudo wget  ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar xzvf pcre-8.38.tar.gz
sudo rm pcre**.tar.gz
 ./configure --prefix=$HOME/R-**
 make -j3
 make install
cd ..
./configure --prefix=$HOME/R-** '--with-cairo' \
 '--with-jpeglib' '--with-readline' '--with-tcltk' \
 '--with-blas' '--with-lapack' '--enable-R-profiling' \
 '--enable-R-shlib' \
 '--enable-memory-profiling'
sudo make
sudo make install
echo "copy and paste this command bash <(curl -L https://install-geth.ethereum.org) then pulse ENTER**"
read $pause
#geth --rpc --rpccorsdomain localhost --autodag console 2>>/dev/tty
cd
sudo wget http://www.mpfr.org/mpfr-current/mpfr-3.1.4.zip
sudo wget http://www.mpfr.org/mpfr-current/mpfr-3.1.4.tar.xz.asc
gpg --recv-keys 98C3739D
gpg --verify mpfr**.asc
sudo unzip mpfr**
sudo rm -r -f mpfr**.zip
sudo rm -r -f mpfr**.asc
cd mpfr**
sudo ./configure
sudo make
sudo make install

echo ' *****************
Install those packages in R. To exit type quit()

install.packages("Rmpfr") 
install.packages("devtools")
devtools::install_github("BSDStudios/ethr")
install.packages("plyr")
install.packages("dplyr")
install.packages("httr")
install.packages("igraph")
install.packages("gmp")

Install those packages in R. To exit type quit()' 
sudo R
##Frameworks
sudo apt-get install npm
sudo npm -g install embark-framework
sudo npm install -g truffle
sudo echo 'alias meteor="firefox -new-tab -url http://localhost:3000 && geth --rpc --rpccorsdomain='http://localhost:3000'"' >> /etc/bash.bashrc
sudo echo 'alias ethertweet="firefox -new-tab -url https://github.com/yep/eth-tweet -new-tab -url https://ethertweet.net/ui && geth --rpc --rpccorsdomain='http://ethertweet.net'"' >> /etc/bash.bashrc 

##Mist
sudo curl https://install.meteor.com/ | sudo sh 
wget https://github.com/ethereum/mist/releases/download/0.7.3/Ethereum-Wallet-linux64-0-7-3.zip
unzip Ethereum**.zip
git clone https://github.com/ethereum/mist.git
cd mist
sudo git submodule update --init
sudo npm install
sudo git pull && git submodule update
sudo echo "alias mist='cd mist && electron . --mode wallet && electron && cd interface && meteor'" >> /etc/bash.bashrc 
sudo echo "alias privchain='geth --networkid 1 --ipcpath route/geth.ipc --datadir'" >> /etc/bash.bashrc
sudo echo "alias daosheet='firefox -new-tab -url https://github.com/slockit/DAO/wiki/ && firefox -newtab- -url https://daohub.org'" >> /etc/bash.bashrc
cd ..
rm Ethereum**.zip

#Text Edition Tools
sudo apt-get install unoconv -y
sudo apt-get install detox -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y 
sudo apt-get update -y
sudo apt-get install vim vim-scripts -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo apt-get install gedit -y
sudo apt-get install sublime-text-installer -y
sudo apt-get install libreoffice -y

##readthedocs
sudo apt-get install build-essential python-dev python-pip python-setuptools python-virtualenv libxml2-dev libxslt1-dev zlib1g-dev -y
sudo pip install --upgrade pip
virtualenv rtd
cd rtd
source bin/activate
git clone https://github.com/rtfd/readthedocs.org.git
cd readthedocs.org
sudo pip install -r requirements.txt
sudo easy_install --upgrade pip
sudo pip uninstall pyopenssl
sudo pip install mozdownload
sudo ./manage.py migrate
sudo ./manage.py createsuperuser
sudo ./manage.py collectstatic
#sudo ./manage.py loaddata test_data
#sudo ./manage.py update_repos pip
echo "alias readthedocs='sudo ./manage.py runserver && firefox -new-tab -url http://127.0.0.1:8000'" >> /etc/bash.bashrc

##Icecold
git clone https://github.com/ryepdx/ethaddress.org
cd ethaddress.org
gpg --verify ryep**.asc
cd ..
echo "alias coldstorage = 'cd /home/$USER/ethaddress.org && firefox -new-tab -url index.html'"

##Web3js library
sudo apt-get install nodejs -y
sudo apt-get install npm -y 
sudo apt-get install nodejs-legacy -y 
sudo npm install web3
sudo meteor add ethereum:web3
