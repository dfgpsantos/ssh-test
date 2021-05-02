#!/bin/bash

TIME=3600
TESTNUMBER=1
DESTINATION=172.16.100.11

while [[ $TIME -gt 0 ]];

do

HOSTNAME=$(ssh $DESTINATION -i .ssh/prod-02a "cat /etc/hostname")

if [[ -z  $HOSTNAME  ]];

then

echo "Test $TESTNUMBER connection to $DESTINATION has failed!"

TESTNUMBER=$(( $TESTNUMBER + 1))
TIME=$(( $TIME - 1))

sleep 1

else

echo "Test $TESTNUMBER connection to $HOSTNAME was Succesful!"

TESTNUMBER=$(( $TESTNUMBER + 1))
TIME=$(( $TIME - 1))

sleep 1

fi

done

echo "Time is up, Test is over"

exit 0
