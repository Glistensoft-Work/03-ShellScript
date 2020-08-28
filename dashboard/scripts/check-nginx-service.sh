#!/bin/bash
service="nginx"
if [[ `systemctl status  $service | grep -w  "running" ` >2/dev/null ]]
then
        flag=1
else
        flag=0
fi

Success=0

if [ $Success = $flag ]
then
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
else
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
fi


