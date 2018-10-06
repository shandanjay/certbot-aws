# certbot-aws

If you have a static S3/CloudFront website, this script makes it easier
for you to generate Let's Encrypt SSL certificates and upload them to
AWS Certificate Manager, without having to manually upload the challenge
files and certificates.

## Requirements

- Certbot: `brew install certbot`
- AWS CLI: `pip install awscli --upgrade --user`

## Usage

```
sudo \
MY_CERTBOT_DOMAIN=example.com \
MY_CERTBOT_AWS_PROFILE=default \
MY_CERTBOT_AWS_REGION=us-east-1 \
./certbot.sh
```

**MY_CERTBOT_DOMAIN** Your domain name (the script will automatically add a www subdomain as well)

**MY_CERTBOT_AWS_PROFILE** The AWS CLI profile (in `~/.aws/credentials`) used for uploading HTTP challenge files to S3 and importing certificates into Certificate Manager (make sure it's authorized to do those things)

**MY_CERTBOT_AWS_REGION** The AWS region associated with Certificate Manager

Then go to your CloudFront distribution and apply the certificate (custom SSL certificate).

## Todo

- [ ] Automatically apply the certificate to a CloudFront distribution.
