#!/bin/bash

# Generates DB/Django env file. Requires an argument with the desired username.

RAND1=$(echo $(( $RANDOM % 30 + 60 )))
RAND2=$(echo $(( $RANDOM % 30 + 51 )))
KEY=SECRET_KEY=$(pwgen -1ys -r \#\'\"\; $RAND2)
PW=DB_PASSWORD=$(pwgen -1ys -r \#\'\"\; $RAND1)
USER=DB_USER=$1

echo "DEBUG=0" >> .env
echo $KEY >> .env
echo $PW >> .env
echo $USER >> .env

ssh-keygen -t rsa -b 4096 -m PEM -N '' -f jwt-key >/dev/null 2>&1
mv jwt-key ./barrelwisdom/backend
mv jwt-key.pub ./barrelwisdom/backend