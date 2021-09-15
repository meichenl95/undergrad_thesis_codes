#!/bin/bash
tstar=3.0
PS=tstar_inst.ps

gmt gmtset MAP_FRAME_TYPE plain
gmt pscoast -JM5i -R160/240/45/75 -Bxa20f10 -Bya10f5 -BWSen -Df -W1/0 -W2/0 -A5000 -K -P > $PS
cat ????????_install.txt | gawk '{if($4>0&&$4<'$tstar') print $9,$8,$4}' | gmt psxy -R -J -B -K -O -Scp -W0.5p,blue >> $PS
cat ????????_install.txt | gawk '{if($4<0&&$4>-'$tstar') print $9,$8,$4}' | gmt psxy -R -J -B -K -O -S+p -W0.5p,red >> $PS
gmt pstext -J -R -B -N -F+f12p -K -O >> $PS <<EOF
250 68.2 3
250 65.8 2
250 63.2 1
250 60.7 -1
250 58 -2
250 55 -3
EOF
gmt pstext -J -R -B -N -F+f12p -K -O >> $PS <<EOF
250 70 @~\144@~t@+*@+@-ScS-S@-
EOF
gmt psxy -J -R -B -N -K -O -Scp -W0.5p,blue >> $PS <<EOF
245 68.2 6
245 65.8 4
245 63.2 2
EOF
gmt psxy -J -R -B -N -O -S+p -W0.5p,red >> $PS <<EOF
245 60.7 2
245 58 4
245 55 6
EOF

