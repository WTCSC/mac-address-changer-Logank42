#!/bin/bash

new_address() {
    ip link set dev "$1" down # Shuts down network interface
    ip link set dev "$1" address "$2" # Changes the mac adress for the corresponding network interface
    ip link set dev "$1" up # Turns the network interface on
}

adress_validation() {
    local mac=$2

    if [[ ! "$mac" =~ ^[0-9A-Fa-f][02468ACEace]$ ]]; then # Checks the first 2 digets to ensure they are even
        echo "Error. First bit of address must be even (2468aceACE)"
        exit 1
    elif [[ ! "$mac" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then # Checks the whole mac adress making sure it is in the correct format
        echo Error. Mac adress is not formatted correctly. Valid max adress format: "xx:xx:xx:xx:xx:xx"
        exit 1
    else # If the first 2 checks pass, it calls the new_adress function
        new_address "$1" "$mac"
    fi
}

mac=$2

if [ "$1" != "" ]; then # Checks that there is an argument and then run the adress_validation function
    adress_validation "$1" "$mac"

else # Prints an error if there is no arguement
    echo Error. Must have a valid arguement
    exit 1
fi
