#!/bin/bash
#
# OpenATV checkmk install script
# Last Change: 27.09.2021
# File History:
# 28.07.2021	Inital Release
#
#
####################### Download files #######################
wget http://vserver.it-nickel.com/home/check_mk/agents/check_mk_agent.linux -O /usr/bin/check_mk_agent 
wget -O /usr/bin/waitmax
####################### config files #######################
# /etc/inetd.conf
echo "# Nagios check_mk Agent" >> /etc/inetd.conf 
echo "check_mk   stream    tcp   nowait   root   /usr/bin/check_mk_agent check_mk" >> /etc/inetd.conf 
# /etc/services
echo "check_mk        6556/tcp                        # Nagios check_mk Agent" >> /etc/services
####################### file permissions #######################
chmod +x  /usr/bin/waitmax
chmod +x  /usr/bin/check_mk_agent
