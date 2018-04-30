#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/.tmp

echo $CERTBOT_VALIDATION > $DIR/.tmp/$CERTBOT_TOKEN

aws s3 cp $DIR/.tmp/$CERTBOT_TOKEN s3://$CERTBOT_DOMAIN/.well-known/acme-challenge/$CERTBOT_TOKEN \
--acl public-read \
--profile $CERTBOT_AWS_PROFILE

sleep 5

aws acm import-certificate \
--certificate file:///etc/letsencrypt/live/$CERTBOT_DOMAIN/cert.pem \
--private-key file:///etc/letsencrypt/live/$CERTBOT_DOMAIN/privkey.pem \
--certificate-chain file:///etc/letsencrypt/live/$CERTBOT_DOMAIN/fullchain.pem \
--profile $CERTBOT_AWS_PROFILE \
--region $CERTBOT_AWS_REGION
