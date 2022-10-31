#!/usr/bin/env python3

import re
import sys

packages = [ arg.split() for arg in sys.argv[1:] ]
packages = sum(packages, []) # flatten list


for package in packages:
    package = re.split('<|=|>', package)[0]
    print(package, end=' ')
