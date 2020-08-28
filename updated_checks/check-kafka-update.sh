#!/bin/bash
service="kafka"
#status=`nc -vz $HOSTNAME 9092 2>&1 | grep  Connected | cut -d ":" -f2 | cut -d " " -f2`

command=`nc -vz $HOSTNAME 9092 2>&1`
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


