#!/bin/bash
PS=arrival_time.ps

gmt gmtset MAP_FRAME_TYPE plain
gmt pscoast -JM5i -R160/240/45/75 -Bxa20f10 -Bya10f5 -BWSen -Df -W1/0 -W2/0 -A5000 -K -P > $PS
cat delta_t_????????.txt | gawk '{if($3>0) print $1,$2,$3}' | gmt psxy -R -J -K -O -S+p -W0.5p,red >> $PS
cat delta_t_????????.txt | gawk '{if($3<0) print $1,$2,-$3}' | gmt psxy -R -J -K -O -Scp -W0.5p,blue >> $PS
gmt pstext -J -R -B -N -F+f12p -K -O >> $PS <<EOF
250 70.2 8
250 68.2 6
250 65.8 4
250 63.2 2
250 60.7 -2
250 58 -4
250 55 -6
250 52 -8
EOF
gmt pstext -J -R -B -N -F+f12p -K -O >> $PS <<EOF
250 71.9 @~\104@~t@-ScS-S@-
EOF
gmt psxy -J -R -B -N -K -O -S+p -W0.5p,red >> $PS <<EOF
245 70.2 8
245 68.2 6
245 65.8 4
245 63.2 2
EOF
gmt psxy -J -R -B -N -O -Scp -W0.5p,blue >> $PS <<EOF
245 60.7 2
245 58 4
245 55 6
245 52 8
EOF


