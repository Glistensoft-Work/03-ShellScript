#!/bin/bash

service="zookeeper"

status=`echo "ruok" | nc localhost 2181 2>&1 ; echo`

if [[ $status == "imok" ]]
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


