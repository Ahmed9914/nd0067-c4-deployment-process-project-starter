#!/bin/bash

mkdir /home/circleci/.aws
touch /home/circleci/.aws/config
chmod 600 /home/circleci/.aws/config
echo "[profile eb-cli]" > /home/circleci/.aws/config
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/circleci/.aws/config
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/circleci/.aws/config

eb setenv POSTGRES_USERNAME=$POSTGRES_USERNAME
eb setenv POSTGRES_PASSWORD=$POSTGRES_PASSWORD
eb setenv POSTGRES_DB=$POSTGRES_DB
eb setenv POSTGRES_HOST=$POSTGRES_HOST
eb setenv POSTGRERS_PORT=$POSTGRERS_PORT
eb setenv JWT_SECRET=$JWT_SECRET
eb setenv AWS_BUCKET=$AWS_BUCKET

eb deploy --staged