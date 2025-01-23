import subprocess
import sys
import re
import random

def new_address():
    subprocess.run(["ip", "link", "set", "dev", interface, "down"])
    subprocess.run(["ip", "link", "set", "dev", interface, "address", bigmac])
    subprocess.run(["ip", "link", "set", "dev", interface, "up"])

def random_address():
    ranmac = (":".join([('0'+hex(random.randint(0,256))[2:])[-2:].upper() for _ in range(6)]))
    subprocess.run(["ip", "link", "set", "dev", interface, "down"])
    subprocess.run(["ip", "link", "set", "dev", interface, "address", ranmac])
    subprocess.run(["ip", "link", "set", "dev", interface, "up"])

interface = sys.argv[1]
bigmac = sys.argv[2]

if bigmac == "-r":
    random_address()
elif re.match("^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$", bigmac):
    new_address()
else:
    print('Error. Must have mac address formatted correctly or -r for random address. Valid max adress format: "xx:xx:xx:xx:xx:xx"')
    sys.exit(1)
