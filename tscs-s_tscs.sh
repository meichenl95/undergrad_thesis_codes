#!/bin/bash
##
gmt psbasemap -R-8/8/-8/8 -JX5i -BWSne -Bxa4f2+l"@~\104@~t@-ScS(data-PREM)@-(s)" -Bya4f2+l"@~\104@~t@-ScS-S@-(s)" -P -K > delta_tscs-s_tscs.ps
paste 20100218_all.txt prem_delta_t_20100218.txt | gawk '{print $6-$12,$6-$5-$10}' | gmt psxy -R -J -Sc2p -W1p,magenta -Gmagenta -K -O >> delta_tscs-s_tscs.ps
paste 20111021_all.txt prem_delta_t_20111021.txt | gawk '{print $6-$12,$6-$5-$10}' | gmt psxy -R -J -Sc2p -W1p,orange -Gorange -K -O >> delta_tscs-s_tscs.ps
paste 20120814_all.txt prem_delta_t_20120814.txt | gawk '{print $6-$12,$6-$5-$10}' | gmt psxy -R -J -Sc2p -W1p,brown -Gbrown -K -O >> delta_tscs-s_tscs.ps
paste 20130524_all.txt prem_delta_t_20130524.txt | gawk '{print $6-$12,$6-$5-$10}' | gmt psxy -R -J -Sc2p -W1p,darkgreen -Gdarkgreen -K -O >> delta_tscs-s_tscs.ps
paste 20131001_all.txt prem_delta_t_20131001.txt | gawk '{print $6-$12,$6-$5-$10}' | gmt psxy -R -J -Sc2p -W1p,purple -Gpurple -K -O >> delta_tscs-s_tscs.ps
gmt psxy -R -J -B -W -O >> delta_tscs-s_tscs.ps <<EOF
-8 -8
8 8
EOF
