service="crawler_service"
timestamp=$(date +%s)

failed_count=$(mysql cariq -u root -pCiQ34358! -se "select name, status from work_item where status = 'FAILED' && start_time >= now() - interval 10 second")
count=$(echo -n "$failed_count" | grep -c '^')

if [[ $count == 0 ]]; then
  flag=1
elif [[ $count != 0 ]]; then
    flag=0
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

