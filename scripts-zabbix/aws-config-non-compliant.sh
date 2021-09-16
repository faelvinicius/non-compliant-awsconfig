#!/bin/bash

profile=$1
rule=$2
region="us-east-1"

check=$(aws configservice describe-compliance-by-config-rule --profile $profile --region $region --compliance-types NON_COMPLIANT)

echo $check | jq '.ComplianceByConfigRules[] | select(.ConfigRuleName=="'$2'").Compliance.ComplianceContributorCount.CappedCount'
