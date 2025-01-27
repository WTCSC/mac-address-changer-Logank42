#!/bin/bash

new_address() {
    ip link set dev "$1" down # Shuts down network interface
    ip link set dev "$1" address "$2" # Changes the mac adress for the corresponding network interface
    ip link set dev "$1" up # Turns the network interface on
}

random_address() { # Does the same as new_address, but instead of your input, it takes the randomly generated mac address
    random=$(echo $RANDOM|md5sum|sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02:\1:\2:\3:\4:\5/') # Generates random mac address using $RANDOM
    ip link set dev "$1" down
    ip link set dev "$1" address "$random"
    ip link set dev "$1" up
}

address_validation() {
    local mac=$2

    if [[ "$mac" =~ ^[0-9A-Fa-f][02468ACEace]$ ]]; then # Checks the first 2 digets to ensure they are even
        echo "Error. First bit of address must be even (2468aceACE)"
        exit 1
    elif [[ ! "$mac" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then # Checks the whole mac adress making sure it is in the correct format
        echo Error. Mac address is not formatted correctly. Valid max adress format: "xx:xx:xx:xx:xx:xx"
        exit 1
    else # If the first 2 checks pass, it calls the new_adress function
        new_address "$1" "$mac"
    fi
}

mac=$2


if [ "$1" = "" ]; then # Checks that there is an argument and prints error message if there is none
    echo "Error. Must have a valid mac address or -r command"
    exit 1

elif [ "$mac" = "-r" ]; then # Checks for the -r arguement and run random_address if -r is input
    random_address "$1" "$mac"

else # It otherwise will run the address_validation
    address_validation "$1" "$mac"
fi
