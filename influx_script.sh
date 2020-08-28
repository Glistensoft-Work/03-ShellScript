#!/bin/bash 

echo "Enter time span"
read -p "Enter begining  time to delete  : "  initialtime
echo "Initial time  $initialtime"

read -p "Enter end  time to delete : " finaltime
echo " Final Time is- $finaltime" 

influx -database sensu  -execute 'show measurements' -format csv > test.csv

awk -F "\"*,\"*" '{print $2}' test.csv > series.csv  
sed  1d series.csv > influx.csv


while read line
do
        echo "deleting for $line"

	influx -database sensu  -execute " delete from /^$line.*/ where time > '$initialtime' and time <= '$finaltime'" 
	#delete from /^up.*/ ,/^tun0.*/ ,/^tcp.*/ where time > '2018-10-10 10:00:00' and time <= '2018-10-10 10:01:30';

done < influx.csv




