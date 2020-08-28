#!/bin/bash
service="nginx"
status="$(curl -sL -w "%{http_code}\\n" $HOSTNAME -o /dev/null )"
#validate=( $status )
if [[ $status == "200" ]];
 then
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


