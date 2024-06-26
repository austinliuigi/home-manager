#!/usr/bin/env bash

if [ "$#" -eq 0 ]
then
    # list out choices
    echo "lock"
    echo "suspend"
    echo "reboot"
    echo "hibernate"
    echo "poweroff"
    exit 0
fi

# handle selected choice
case "$1" in
    "lock") loginctl lock-session ;;
    "suspend") systemctl suspend ;;
    "reboot") reboot ;;
    "hibernate") systemctl hibernate ;;
    "poweroff") poweroff ;;
esac
