#!/bin/bash
##
gmt psbasemap -R-8/8/-8/8 -JX5i -BWneS -Bxa4f2+l"@~\104@~t@-ScS@-(s)" -Bya4f2+l"@~\144@~t@+*@+@-ScS-S@-(s)" -P -K > t_tscs_inst.ps
paste 20100218_install.txt prem_delta_t_inst_20100218.txt | gawk '{print $6-$12,$4}' | gmt psxy -R -J -Sc2p -W1p,magenta -Gmagenta -K -O >> t_tscs_inst.ps
paste 20111021_install.txt prem_delta_t_inst_20111021.txt | gawk '{print $6-$12,$4}' | gmt psxy -R -J -Sc2p -W1p,orange -Gorange -K -O >> t_tscs_inst.ps
paste 20120814_install.txt prem_delta_t_inst_20120814.txt | gawk '{print $6-$12,$4}' | gmt psxy -R -J -Sc2p -W1p,brown -Gbrown -K -O >> t_tscs_inst.ps
paste 20130524_install.txt prem_delta_t_inst_20130524.txt | gawk '{print $6-$12,$4}' | gmt psxy -R -J -Sc2p -W1p,darkgreen -Gdarkgreen -K -O >> t_tscs_inst.ps
paste 20131001_install.txt prem_delta_t_inst_20131001.txt | gawk '{print $6-$12,$4}' | gmt psxy -R -J -Sc2p -W1p,purple -Gpurple -K -O >> t_tscs_inst.ps
gmt psxy -R -J -B -W -O >> t_tscs_inst.ps <<EOF
-8 -8
8 8
EOF
