#!/bin/bash

WAIT_FOR=$(bash -c 'echo "${WAIT_FOR?false}"')
printf "\033[0;32m > Wait for server ${WAIT_FOR} to ready ...\n"

((count = 100))                            # Maximum number to try.
while [[ $count -ne 0 ]] ; do
    echo "."

    ping -c 1 "${WAIT_FOR}" &> /dev/null               # Try once.

    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))                      # If okay, flag to exit loop.
    else
        sleep 5
    fi

    ((count = count - 1))                  # So we don't go forever.
done


set -e

if [[ $rc -eq 0 ]] ; then                  # Make final determination.
    printf "\033[0;32m > ${WAIT_FOR} is ready. \n"
else
    printf "\033[0;31m > ${WAIT_FOR} not ready!! \n"
    exit 1
fi


## continue with default Parent CMD
printf "\033[0;32m > Start Server ...\n"
printf "\033[0m\n"

nginx -g 'daemon off;'
