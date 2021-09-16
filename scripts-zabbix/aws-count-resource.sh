#!/bin/bash

region="us-east-1"
resource=$1
profile=$2

aws configservice list-discovered-resources --profile $profile --region $region --resource-type $resource --query 'resourceIdentifiers[].resourceId'  | sed -e 's/\[//' | sed -e 's/\]//' | sed -r '/^[\s\t]*$/d' | wc -l
