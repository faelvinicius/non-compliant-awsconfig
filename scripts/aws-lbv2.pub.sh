#!/bin/bash

profile=$1
count=$2
region="us-east-1"

elb=$(aws elbv2 describe-load-balancers --profile $profile --region $region )


if [[ $count == "count" ]];
then
echo $elb | jq '.LoadBalancers[] | select(.Scheme=="internet-facing").LoadBalancerName' | wc -l
else
echo $elb | jq '.LoadBalancers[] | select(.Scheme=="internet-facing").LoadBalancerName'
fi


