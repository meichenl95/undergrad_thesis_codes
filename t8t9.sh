#!/bin/bash
##
evdp=553.83
for file in ./*
do
    if [ ${file##*.} = dis ]
    then
        gcarc=`saclst gcarc f $file | gawk '{print $2}'`
        t_S=`phtimes $evdp $gcarc S | gawk '{print $2}'`
        t_ScS=`phtimes $evdp $gcarc ScS | gawk '{print $2}'`
sac << EOF
r $file
ch t8 $t_S
ch t9 $t_ScS
wh
q
EOF
    fi
done
