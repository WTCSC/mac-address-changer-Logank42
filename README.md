[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tp86o73G)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=17729447)

# Mac Address Changer
This is a script that will change the mac address of your machine. For those of you who dont know what a Mac Address is, it is the identification number (in hexidecimal 0-F) for your hardware. This was written in two different languages: Python and Shell, with the same features.

Both variations are simple to use, only needing a couple inputs:
#### Python:
    sudo python3 pdaddy.py [network interface] [mac address / -r]
In the python variation, you can run this command above. You need to enter the network interface you want to use to change the mac address on, and your new mac address (To find your network interface, you can use `ip link show`, which will list your interfaces). Another option you can use is the -r command, which will assign you a randomly generated mac address.

#### Shell:
    sudo ./sdaddy.sh [network interface] [mac address / -r]
In the shell variation, you can run this command above. You need to enter the network interface you want to use to change the mac address on, and your new mac address (To find your network interface, you can use `ip link show`, which will list your interfaces). Another option you can use is the -r command, which will assign you a randomly generated mac address.