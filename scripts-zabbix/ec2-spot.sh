#!/bin/bash

profile=$1
region="us-east-1"

spot=$(aws ec2 describe-instances --profile $profile --region $region --query 'Reservations[*].Instances[*].InstanceLifecycle' --filters Name=instance-state-name,Values=running | grep -v "\[" | grep -v "\]" | wc -l)

echo $spot
