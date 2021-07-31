#!/bin/bash
#
# Debian SSH config 
# Last Change: 28.07.2021
# File History:
# 28.07.2021	Inital Release
#
#
####################### SSH config  #######################
# User accounts 
echo "---------------------------------------------------------------------------------"
echo -n "Do you want to configure ssh (y/N) "
read CHANGE
if [ "$CHANGE" = "y" ]; then {
  rm -v /etc/ssh/ssh_host_*
  sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
  dpkg-reconfigure openssh-server
}fi
