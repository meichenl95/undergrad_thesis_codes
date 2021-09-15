#!/bin/bash
##
gawk '{print "taup_time -mod prem -h 578.67 --time -ph S,ScS -deg",$7}' 20100218_cut.txt | sh | gawk '{if(NR%2!=0) print $2-$1,$1,$2}' > prem_delta_t_20100218.txt
paste 20100218_all.txt prem_delta_t_20100218.txt | gawk '{print $9,$8,$6-$5-$10,$4}' > delta_t_20100218.txt

gmt gmtset MAP_FRAME_TYPE plain
gmt pscoast -R160/200/50/70 -JM10c -B20 -W1/0.p,black -I1/0.5p,black -P -K > delta_t.ps

#gmt psbasemap -R-7/4/-3/3 -JX6i -BWS -Bxa1f0.5 -Bya1f0.5 -P -K > delta_t.ps
#gawk '{print $3,$4}' delta_t.txt | gmt psxy -R -J -Sc1p -W0.5p,blue -Gblue -K -O >> delta_t.ps

gawk '{if($3>0) print $1,$2,$3}' delta_t_20100218.txt | gmt psxy -R -J -K -O -Scp -W0.5p,blue >> delta_t.ps
gawk '{if($3<0) print $1,$2,-$3}' delta_t_20100218.txt | gmt psxy -R -J -K -O -S+p -W0.5p,red >> delta_t.ps
