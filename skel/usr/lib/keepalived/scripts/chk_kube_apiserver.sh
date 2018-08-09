#!/bin/sh

host_address="$1"
vip="$2"
port="$3"

 errorExit() {
     echo "*** $*" 1>&2
     exit 1
 }

 curl --silent --max-time 2 --insecure "https://$host_address:$port/" -o /dev/null || errorExit "Error GET https://$host_address:$port/"
 if ip addr | grep -q "$vip"; then
     curl --silent --max-time 2 --insecure "https://$vip:$port/" -o /dev/null || errorExit "Error GET https://$vip:$port/"
 fi
