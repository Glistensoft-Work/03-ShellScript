#!/bin/bash
service="tomcat_api"
status="$( curl -sL -w "%{http_code}\\n" "https://ecu.mycariq.com/Cariq/tests/testTimeout/1" | cut -d "}" -f2 )"
if [ $status  == "200" ]; then
  	flag=1
	#echo "OK"
else
	flag=1
	#  echo "NOT RESPONDING"
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


