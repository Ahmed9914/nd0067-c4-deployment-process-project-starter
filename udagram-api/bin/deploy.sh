#!/bin/bash

mkdir /home/circleci/.aws
touch /home/circleci/.aws/config
chmod 600 /home/circleci/.aws/config
echo "[profile eb-cli]" > /home/circleci/.aws/config
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/circleci/.aws/config
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/circleci/.aws/config

eb setenv POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_DB=$POSTGRES_DB POSTGRES_HOST=$POSTGRES_HOST POSTGRERS_PORT=$POSTGRERS_PORT JWT_SECRET=$JWT_SECRET AWS_BUCKET=$AWS_BUCKET

eb deploy --staged