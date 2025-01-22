import subprocess
import sys

def new_address():
    subprocess.run(["ip", "link", "set", "dev", interface, "down"])
    subprocess.run(["ip", "link", "set", "dev", interface, "address", bigmac])
    subprocess.run(["ip", "link", "set", "dev", interface, "up"])


interface = sys.argv[1]
bigmac = sys.argv[2]
new_address()
