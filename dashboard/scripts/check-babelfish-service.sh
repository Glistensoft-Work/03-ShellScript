#!/bin/bash
service="babelfish"
tag="_service"
running="social is running."
status=`service $service  status  | grep -x  "social is running."`
timestamp=$(date +%s)
if [[ $running == $status  ]]
then
      flag=2
       #echo "$HOSTNAME.$service$tag 1 $timestamp"
fi
if [[ $running != $status  ]]
then
      flag=1
        #     echo "$HOSTNAME.$service$tag 0 $timestamp"
fi
Success=2
if [ $Success = $flag ]
then
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service$tag 1   $timestamp"
else
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service$tag 0  $timestamp"
fi

