#!/bin/bash
service="mongod"
port=27017

status=`nc -zv $HOSTNAME $port  2>&1 `
status1=`echo $?`

if [[ $status1 == "0" ]]
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

