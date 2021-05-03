#!/bin/bash

TIME=3600
TESTNUMBER=1
DESTINATION=172.16.230.11
PORT=80

while [[ $TIME -gt 0 ]];

do

HOSTNAME=$(ssh $DESTINATION -i rsa-key.private -p $PORT "cat /etc/hostname")

if [[ -z  $HOSTNAME  ]];

then

echo "Test $TESTNUMBER SSH connection to $DESTINATION has failed!"

TESTNUMBER=$(( $TESTNUMBER + 1))
TIME=$(( $TIME - 2))

sleep 2

else

echo "Test $TESTNUMBER SSH connection to $HOSTNAME using port $PORT was Succesful!"

TESTNUMBER=$(( $TESTNUMBER + 1))
TIME=$(( $TIME - 2))

sleep 2

fi

done

echo "Time is up, Test is over"

exit 0
