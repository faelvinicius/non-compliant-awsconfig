#!/usr/bin/env bash

PUBLIC_READ_BUCKETS=()
PUBLIC_WRITE_BUCKETS=()
PROFILE=$1
BUCKETS_LIST=(`aws s3api list-buckets --profile $PROFILE --output text | grep BUCKETS | cut -f3`)

PRINT=$2

for BUCKET_NAME in "${BUCKETS_LIST[@]}"; do

  PUBLIC_ACL_INDICATOR="http://acs.amazonaws.com/groups/global/AllUsers"

  if echo `aws s3api get-bucket-acl --profile $PROFILE --output text --bucket ${BUCKET_NAME} | grep -A1 READ` | grep -q "${PUBLIC_ACL_INDICATOR}"
  then
  
  count_list=$(($count_list+1))

  PUBLIC_READ_BUCKETS+=(${BUCKET_NAME})

  fi

  if echo `aws s3api get-bucket-acl --profile $PROFILE --output text --bucket ${BUCKET_NAME} | grep -A1 WRITE` | grep -q "${PUBLIC_ACL_INDICATOR}"
  then

  count_write=$(($count_write+1))
  PUBLIC_WRITE_BUCKETS+=(${BUCKET_NAME})

  fi

done


if [[ $PRINT = "count_read" ]];
then
echo $count_list 
elif [[ $PRINT = "count_write" ]];
then
echo $count_write 
elif [[ $PRINT = "name_read" ]];
then
echo "${PUBLIC_READ_BUCKETS[@]}" | tr " " "\n"
#cat /etc/zabbix/scripts/s3-read-pub.txt
elif [[ $PRINT = "name_write" ]];
then
echo "${PUBLIC_WRITE_BUCKETS[@]}" | tr " " "\n" 
else
echo "Argumento invalido"
fi


