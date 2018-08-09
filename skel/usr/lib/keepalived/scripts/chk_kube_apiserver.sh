#!/bin/sh

vip="$1"
port="$2"

export HOST_ADDRESS="${HOST_ADDRESS:-localhost}"

 errorExit() {
     echo "*** $*" 1>&2
     exit 1
 }

 curl --silent --max-time 2 --insecure "https://$HOST_ADDRESS:$port/" -o /dev/null || errorExit "Error GET https://$HOST_ADDRESS:$port/"
 if ip addr | grep -q "$vip"; then
     curl --silent --max-time 2 --insecure "https://$vip:$port/" -o /dev/null || errorExit "Error GET https://$vip:$port/"
 fi
