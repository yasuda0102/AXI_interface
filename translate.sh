#!/bin/bash

# トランスレート
for FILE in `ls *.nsl`
do
    IDENTIFER=`head -n 1 ${FILE}`
    if [ "${IDENTIFER}" = "// For testbench" ]
    then
        nsl2vl $FILE -target `basename ${FILE}` -verisim2
    elif [ "${IDENTIFER}" = "// clock/reset name is changed." ]
    then
        LINE=`cat ${FILE} | sed -n 2p | sed -e "s/\/\/ \(.*\), \(.*\)/\1 \2/g"`
        CLK=`echo ${LINE} | awk '{ print $1 }'`
        RST=`echo ${LINE} | awk '{ print $2 }'`
        echo "${FILE}: clock name: ${CLK}, reset name: ${RST}"
        nsl2vl -clock_name $CLK -reset_name $RST -O $FILE
    else
        nsl2vl -O $FILE
    fi
done
