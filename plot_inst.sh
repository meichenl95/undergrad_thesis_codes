#!/bin/bash
##
awk '{print "taup_pierce -mod prem -h 578.67 -evt 42.48 130.66 -sta",$2,$3,"-ph ScS --pierce 2891 --nodiscon"}' 20100218_instfreq.txt | sh | awk '{if(NR%2==0) print $4,$5}' > 20100218_rfl.txt
paste 20100218_instfreq.txt 20100218_rfl.txt > 20100218_install.txt
awk '{if($4>0&&$4<3.0) print $9,$8,$4}' 20100218_install.txt > pos_tstar_20100218_instfreq.txt
awk '{if($4<0&&$4>-3.0) print $9,$8,-$4}' 20100218_install.txt > neg_tstar_20100218_instfreq.txt

gmt pscoast -R160/200/50/70 -JM10c -B20 -W1/0.p,black -I1/0.5p,black -P -K > 20100218_inst.ps

gmt psxy pos_tstar_20100218_instfreq.txt -R -J -B -K -O -Scp -W0.5p,blue >> 20100218_inst.ps
gmt psxy neg_tstar_20100218_instfreq.txt -R -J -B -K -O -Scp -W0.5p,red >> 20100218_inst.ps

gmt psxy -R -J -B -K -O -N -Scp -W0.5p,red >> 20100218_inst.ps <<EOF
-53 16 2
-53 14 4
-53 12 6
-53 10 8
EOF
gmt psxy -R -J -B -K -O -N -Scp -W0.5p,blue >> 20100218_inst.ps <<EOF
-53 18 2
-53 20 4
-53 22 6
-53 24 8
EOF
gmt pstext -R -J -B -K -O -N -F+f10p >> 20100218_inst.ps <<EOF
-51 16 -2
-51 14 -4
-51 12 -6
-51 10 -8
-51 18 2
-51 20 4
-51 22 6
-51 24 8
-53 26 dt*(s)
EOF

