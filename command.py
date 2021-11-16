#!/bin/env python3

import sys
import os
import re

filename = sys.argv[1]

file = open(filename)
string = file.readlines()

string2 = []
for s in string:
    string2.append(s.rstrip(os.linesep))

command = string2[0].split(" ")

matching_list = [
    r"(.*)\((.*)\)",
    r"(SIM)"
]

clock = ""
reset = ""
simulation = ""

for x in command:
    for y in matching_list:
        match = re.match(y, x)
        if match:
            if match.groups()[0] == "CLK":
                clock = "-clock_name " + match.groups()[1]
            elif match.groups()[0] == "RST":
                reset = "-reset_name " + match.groups()[1]
            elif match.groups()[0] == "SIM":
                basename = re.sub(r"(.*)\.nsl", r"\1", filename)
                simulation = f"-target {basename} -verisim2"

print(f"nsl2vl {filename} {clock} {reset} {simulation}")
