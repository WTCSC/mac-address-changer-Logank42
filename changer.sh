#!/bin/bash

new_address() {
    ip link set dev "$1" down
    ip link set dev "$1" address "$2"
    ip link set dev "$1" up
}

adress_validation() {
    local mac=$2

    if [[ ! "$mac" =~ ^[0-9A-Fa-f][02468ACEace]$ ]]; then
        echo "Error. First bit of address must be even (2468aceACE)"
        exit 1
    elif [[ ! "$mac" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
        echo Error. Mac adress is not formatted correctly. Valid max adress format: "xx:xx:xx:xx:xx:xx"
        exit 1
    else
        new_address "$1" "$mac"
    fi
}

mac=$2

if [ "$1" != "" ]; then
    adress_validation "$1" "$mac"

else
    echo Error. Must have a valid arguement
    exit 1
fi
