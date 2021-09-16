#!/bin/bash

profile=$1
rule=$2
region="us-east-1"

check=$(aws configservice get-compliance-details-by-config-rule --profile $profile --region $region --config-rule $rule --compliance-types NON_COMPLIANT)

echo $check | jq '.EvaluationResults[].EvaluationResultIdentifier.EvaluationResultQualifier.ResourceId'

