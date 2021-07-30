apt-get -y install zsh
cd /root
wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
#cd /home/pi
#wget -O .zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
sed -i "s/bash/zsh/" /etc/passwd
