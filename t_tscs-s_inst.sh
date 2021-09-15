#!/bin/bash
##
gmt psbasemap -R-8/8/-8/8 -JX5i -BWneS -Bxa4f2+l"@~\104@~t@-ScS-S@-(s)" -Bya4f2+l"@~\144@~t@+*@+@-ScS-S@-(s)" -P -K > t_tscs-s_inst.ps
gawk '{print $3,$4}' delta_t_inst_20100218.txt | gmt psxy -R -J -Sc2p -W1p,magenta -Gmagenta -K -O >> t_tscs-s_inst.ps
gawk '{print $3,$4}' delta_t_inst_20111021.txt | gmt psxy -R -J -Sc2p -W1p,orange -Gorange -K -O >> t_tscs-s_inst.ps
gawk '{print $3,$4}' delta_t_inst_20120814.txt | gmt psxy -R -J -Sc2p -W1p,brown -Gbrown -K -O >> t_tscs-s_inst.ps
gawk '{print $3,$4}' delta_t_inst_20130524.txt | gmt psxy -R -J -Sc2p -W1p,darkgreen -Gdarkgreen -K -O >> t_tscs-s_inst.ps
gawk '{print $3,$4}' delta_t_inst_20131001.txt | gmt psxy -R -J -Sc2p -W1p,purple -Gpurple -O >> t_tscs-s_inst.ps
