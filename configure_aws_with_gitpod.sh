#!/bin/sh
set -e

# This assumes the below variables have been configured for this repo in gitpod
# https://www.gitpod.io/docs/environment-variables#using-the-account-settings
echo "Forcing AWS config to just use SSO credentials"
[[ -d /home/gitpod/.aws ]] || mkdir /home/gitpod/.aws
cat <<- AWSFILE > /home/gitpod/.aws/config
[profile smd-dev]
sso_start_url = https://smartdevllc.awsapps.com/start
sso_region = us-east-1
sso_account_id = 015568130945
sso_role_name = PS-AdministratorAccess
region = us-west-2

[profile smd-prod]
sso_start_url = https://smartdevllc.awsapps.com/start
sso_region = us-east-1
sso_account_id = 269715254496
sso_role_name = PS-AdministratorAccess
region = ap-southeast-1
AWSFILE

echo "All Things which are required for AWS SSO Login are Installed & Configured Successfully."
echo "Now, You can Start an AWS SSO login session."