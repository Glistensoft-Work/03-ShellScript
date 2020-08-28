#!/bin/bash
service="check_mysql_api"
status="$(curl -Is http://www.google.com | head -1)"
#validate=( $status )

status="$( curl -sL -w "%{http_code}\\n" "https://taecu.mycariq.com/Cariq/tests/ping/mysql" | cut -d "}" -f2 )"

if [ $status  == "200" ]; then
 	flag=1
	#echo "OK"
else
	flag=0
  	#echo "NOT RESPONDING"
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


