#!/bin/bash

# トランスレート
for FILE in `ls *.nsl`
do
    eval `./command.py $FILE`
done
