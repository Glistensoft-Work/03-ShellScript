#!/bin/bash

File_path=`ls -v /mysql/mysql/mysql-relay-bin.* | egrep '(\.[0-9]+)$' `

#File_path=`ls -v /mysql/mysql/mysql-relay-bin.000200`
File_Directory="/home/vagrant/temp/"
current_date=$(date +%y-%m-%d)
last_ten_date=$(date --date="$(date +'%Y-%m-%d')-10    days" +%Y-%m-%d)


start_ts=$(date -d "$last_ten_date" '+%s')
end_ts=$(date -d "$current_date" '+%s')

Number_of_days=$((( $end_ts - $start_ts)/(86400)))

#echo "scale=2;( $Number_of_days ) " | bc


for file  in  $File_path
do
        FILE=$(basename  $file)
        #echo $FILE
        #echo `stat $file  | grep -w "Change" | awk {'print $2'} `

        file_date=`stat $file  | grep -w "Modify" | awk {'print $2'} `

        #echo $file_date
        #echo $last_ten_date

        if [[ "$file_date" <  "$last_ten_date" ]] &&
        [[ ! -f "$file.gz" ]] ;
        then
                tar  -cvzf $file.gz  $file
                #gzip  $file
                #rm $file
        fi

done



