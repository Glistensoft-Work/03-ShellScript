#!/bin/bash
service="copy_script"

output=$(forever list | grep copy.js | awk -F ' ' '{print $(NF) }')
status="STOPPED"

if [[ $status == $output ]]
then
        flag=0
else
        flag=1
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


