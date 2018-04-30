#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

aws s3 rm s3://$CERTBOT_DOMAIN/.well-known --recursive --profile $CERTBOT_AWS_PROFILE

rm -rf $DIR/.tmp
