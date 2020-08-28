#!/bin/bash

service="tomcat_api"
if [[ `curl -s "https://dtecu.mycariq.com/Cariq/tests/testTimeout/1 " | grep "miliSeconds"` >2/dev/null ]]
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

