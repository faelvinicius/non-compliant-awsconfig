#!/bin/bash

profile=$1
print=$2
region="us-east-1"

declare -i count='0'

lista=$(aws s3 ls --profile $profile --region $region | cut -c20-200 | wc -l)
for OUTPUT in $(aws s3 ls --profile $profile --region $region | cut -c20-400)
do

crypt=""
crypt=$(aws s3api get-bucket-encryption --profile $profile --region $region --bucket $OUTPUT 2> /dev/null)


if [[ $crypt =~ "AES256" || $crypt =~ "aws:kms" ]];
    then
ENCRYPT_BUCKETS+=(${OUTPUT})
else

count=$count+1
NON_ENCRYPT_BUCKETS+=(${OUTPUT})

fi
done

echo $count


echo "${NON_ENCRYPT_BUCKETS[@]}" | tr " " "\n" | sed 's/.*/"&"/g' > /tmp/$profile




 
