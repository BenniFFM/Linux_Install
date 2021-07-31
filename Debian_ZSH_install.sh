#!/bin/bash
#
# Install and configure zsh on debian systems
# Last Change: 31.07.2021
# File History:
# 31.07.2021	Inital Release
#
#
#wget --no-check-certificate https://raw.githubusercontent.com/BenniFFM/Linux_Install/main/Debian_ZSH_install.sh && chmod +x ./Debian_ZSH_install.sh
####################### ZSH #######################
# Install 
echo "---------------------------------------------------------------------------------"
echo -n "Do you want to install 'ZSH' (y/N) "
read CHANGE
if [ "$CHANGE" = "y" ]; then {
  apt-get -y install zsh
  cd /root
  # source http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
  wget -O --no-check-certificate .zshrc https://raw.githubusercontent.com/BenniFFM/Linux_Install/main/etc_zsh_zshrc
  find /home -maxdepth 1 -type d -exec sh -c 'cp /root/.zshrc "$0" -P' {} \;
  sed -i "s/bash/zsh/" /etc/passwd
} fi
