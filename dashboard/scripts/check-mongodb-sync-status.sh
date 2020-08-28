#!/bin/bash
service="MONGO_SYNC"
NODE1_id=` mongo --eval "rs.status() " | grep -A 4  "_id"  | grep '"_id" : 0' | cut -d ":" -f2 | cut -d "," -f1`
NODE2_id=` mongo --eval "rs.status() " | grep -A 4  "_id"  | grep '"_id" : 1'  | cut -d ":" -f2 | cut -d "," -f1`

NODE1_STATUS=`mongo --eval "rs.status() " | grep -A 4 '"_id" : 0'    | grep "stateStr" | cut -d ":" -f2 | cut -d '"' -f2 `
NODE2_STATUS=`mongo --eval "rs.status() " | grep -A 4 '"_id" : 1'    | grep "stateStr" | cut -d ":" -f2 | cut -d '"' -f2 `

#echo $NODE1_id
#echo $NODE2_id
#echo $NODE1_STATUS
#echo $NODE2_STATUS

if [[ $NODE1_id -eq 0 ]] || [[ $NODE1_id -eq 1 ]]
then

        if [[ $NODE1_STATUS ==  PRIMARY ]]
        then
                #echo "PRIMARY"
                flag=1
        elif [[ $NODE1_STATUS == SECONDARY ]]
        then
                #echo "SECONDARY"
                flag=1
        else
                flag=0
        fi
fi


if [[ $NODE2_id -eq 1 ]] || [[ $NODE2_id -eq 0 ]]
then

        if [[ $NODE2_STATUS ==  PRIMARY ]]
        then
                flag1=1
                #echo "PRIMARY"
        elif [[ $NODE2_STATUS == SECONDARY ]]
        then
                flag1=1
                #echo "SECONDARY"
        else
                flag1=0
        fi
fi

if [ $flag = $flag1 ]
then
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
else
        timestamp=$(date +%s)
        echo "$HOSTNAME.$service $flag $timestamp"
fi

