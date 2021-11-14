#!/bin/bash

# トランスレート
for FILE in `ls *.nsl`
do
    IDENTIFER=`head -n 1 ${FILE}`
    if [ "${IDENTIFER}" = "// For testbench" ]
    then
        nsl2vl $FILE -target `basename ${FILE} .nsl` -verisim2
    else
        nsl2vl -O $FILE
    fi
done
