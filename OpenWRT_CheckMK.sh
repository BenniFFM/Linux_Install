#!/bin/bash
#
# OpenATV checkmk install script
# Last Change: 27.09.2021
# File History:
# 28.07.2021	Inital Release
#
#
####################### Download files #######################
wget http://vserver.it-nickel.com/home/check_mk/agents/check_mk_agent.openwrt -O /usr/bin/check_mk_agent 
####################### file permissions #######################
chmod +x  /usr/bin/check_mk_agent
