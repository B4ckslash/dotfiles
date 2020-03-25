#! /bin/bash
GREEN='%{F#a6e22e}'
CYAN='%{F#66d9ef}'
NC='%{F-}'
PREFIX='%{T4}%{T-}'
if [ $1 = 'simple' ] ; then
    if [ -n "$(ip link show enp0s31f6 | grep 'state UP')" ] ; then
        echo "${PREFIX} $(ip addr show enp0s31f6 | grep global | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)"
    else 
        echo "$PREFIX"
    fi
    exit
fi

if [ $1 = 'detailed' ] ; then
        mac=$(ip addr show enp0s31f6 | grep ether | awk '{print $2}')
        if [ -n "$(ip link show enp0s31f6 | grep 'state UP')" ] ; then
        ip4=$(ip addr show enp0s31f6 | grep 'global dynamic' | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
        cidr4=$(ip addr show enp0s31f6 | grep 'global dynamic' | grep 'inet ' | awk '{print $2}' | cut -d/ -f2)
        ip6=$(ip addr show enp0s31f6 | grep 'global dynamic' | grep 'inet6' | awk '{print $2}' | cut -d/ -f1)
        cidr6=$(ip addr show enp0s31f6 | grep 'global dynamic' | grep 'inet6' | awk '{print $2}' | cut -d/ -f2)
        echo "${PREFIX} ${GREEN}IPv4:${NC}$ip4/${CYAN}$cidr4 ${GREEN}IPv6:${NC}$ip6/${CYAN}$cidr6 ${GREEN}MAC:${NC}$mac"
    else
        echo "${PREFIX} ${GREEN}MAC:${NC}$mac" 
    fi
fi

