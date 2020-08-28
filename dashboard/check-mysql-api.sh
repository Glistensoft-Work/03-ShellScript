#!/bin/bash
service="check-mysql-api"
if [[ `curl -s "https://taecu.mycariq.com/Cariq/tests/ping/mysql" | grep -w "pong"` >2/dev/null ]]
then
        flag=1
        #echo " the website is working fine"
else
        flag=0
        #echo "Error"
fi

Success=1

if [ $Success = $flag ]
then
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
else
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
fi

