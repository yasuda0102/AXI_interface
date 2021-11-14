#!/bin/bash

# トランスレートしたファイルの削除
for FILE in `ls *.nsl | sed -e "s/\(.*\)\.nsl/\1\.v/g"`
do
    rm -f $FILE
done

# vcdファイルの削除
rm -f *.vcd

# シミュレーション実行ファイルの削除
rm -f a.out
