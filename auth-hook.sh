#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/.tmp

echo $CERTBOT_VALIDATION > $DIR/.tmp/$CERTBOT_TOKEN

aws s3 cp $DIR/.tmp/$CERTBOT_TOKEN s3://$MY_CERTBOT_DOMAIN/.well-known/acme-challenge/$CERTBOT_TOKEN \
--acl public-read \
--profile $MY_CERTBOT_AWS_PROFILE

sleep 5

aws acm import-certificate \
--certificate file:///etc/letsencrypt/live/$MY_CERTBOT_DOMAIN/cert.pem \
--private-key file:///etc/letsencrypt/live/$MY_CERTBOT_DOMAIN/privkey.pem \
--certificate-chain file:///etc/letsencrypt/live/$MY_CERTBOT_DOMAIN/fullchain.pem \
--profile $MY_CERTBOT_AWS_PROFILE \
--region $MY_CERTBOT_AWS_REGION
