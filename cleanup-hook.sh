#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

aws s3 rm s3://$MY_CERTBOT_DOMAIN/.well-known --recursive --profile $MY_CERTBOT_AWS_PROFILE

rm -rf $DIR/.tmp
