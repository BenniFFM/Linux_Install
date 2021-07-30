rm -v /etc/ssh/ssh_host_*
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
dpkg-reconfigure openssh-server
