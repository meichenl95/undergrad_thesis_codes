#!/bin/bash

##20100218
J=A210/65/55/5i
R=g
#R=120/300/30/85
event=20100218
PS=map_all.ps
evlo=130.66
evla=42.48

#画海岸线
gmt pscoast -J$J -R$R -Bg -Df -W1/0 -W2/0 -A5000 -P -K> $PS
#绘制大圆弧路径
gawk '{print "'130.66' '42.48'\n",$3,$2}' 20100218_all.txt | gmt psxy -R -J -Wfaint,lightgrey,..- -K -O >> $PS
gawk '{print "'142.52' '43.83'\n",$3,$2}' 20111021_all.txt | gmt psxy -R -J -Wfaint,lightgrey,..- -K -O >> $PS
gawk '{print "'145.7' '49.97'\n",$3,$2}' 20120814_all.txt | gmt psxy -R -J -Wfaint,lightgrey,..- -K -O >> $PS
gawk '{print "'152.9' '53.14'\n",$3,$2}' 20131001_all.txt | gmt psxy -R -J -Wfaint,lightgrey,..- -K -O >> $PS
gawk '{print "'151.48' '52.36'\n",$3,$2}' 20130524_all.txt | gmt psxy -R -J -Wfaint,lightgrey,..- -K -O >> $PS

#event location
gmt psxy -J -R -Sa0.5c -W0.2p,magenta -Gmagenta -K -O >> $PS <<EOF
130.66 42.48
EOF
gmt psxy -J -R -Sa0.5c -W0.2p,orange -Gorange -K -O >> $PS <<EOF
142.52 43.83
EOF
gmt psxy -J -R -Sa0.5c -W0.2p,brown -Gbrown -K -O >> $PS <<EOF
145.7 49.97
EOF
gmt psxy -J -R -Sa0.5c -W0.2p,purple -Gpurple -K -O >> $PS <<EOF
152.9 53.14
EOF
gmt psxy -J -R -Sa0.5c -W0.2p,darkgreen -Gdarkgreen -K -O >> $PS <<EOF
151.48 52.36
EOF

#reflect point
gawk '{if($4>0) print $9,$8,$4}' 20100218_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,magenta >> $PS
gawk '{if($4<0) print $9,$8,-$4}' 20100218_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,magenta >> $PS
gawk '{if($4>0) print $9,$8,$4}' 20111021_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,orange >> $PS
gawk '{if($4<0) print $9,$8,-$4}' 20111021_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,orange >> $PS
gawk '{if($4>0) print $9,$8,$4}' 20120814_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,brown >> $PS
gawk '{if($4<0) print $9,$8,-$4}' 20120814_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,brown >> $PS
gawk '{if($4>0) print $9,$8,$4}' 20130524_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,darkgreen >> $PS
gawk '{if($4<0) print $9,$8,-$4}' 20130524_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,darkgreen >> $PS
gawk '{if($4>0) print $9,$8,$4}' 20131001_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,purple >> $PS
gawk '{if($4<0) print $9,$8,-$4}' 20131001_all.txt | gmt psxy -R -J -K -O -Sc4p -W1.5p,purple >> $PS

#station
gawk '{print $3,$2}' 20100218_all.txt | gmt psxy -J -R -St0.2c -W0.1p,blue -Gblue -K -O >> $PS
gawk '{print $3,$2}' 20111021_all.txt | gmt psxy -J -R -St0.2c -W0.1p,blue -Gblue -K -O >> $PS
gawk '{print $3,$2}' 20120814_all.txt | gmt psxy -J -R -St0.2c -W0.1p,blue -Gblue -K -O >> $PS
gawk '{print $3,$2}' 20130524_all.txt | gmt psxy -J -R -St0.2c -W0.1p,blue -Gblue -K -O >> $PS
gawk '{print $3,$2}' 20131001_all.txt | gmt psxy -J -R -St0.2c -W0.1p,blue -Gblue -K -O >> $PS

#annotation
gmt pstext -R -J -B -K -O -N -F+f10p,magenta >> $PS <<EOF
125.66 45 20100218
EOF
gmt pstext -R -J -B -K -O -N -F+f10p,orange >> $PS <<EOF
145 38 20111021
EOF
gmt pstext -R -J -B -K -O -N -F+f10p,brown >> $PS <<EOF
137 54 20120814
EOF
gmt pstext -R -J -B -K -O -N -F+f10p,darkgreen >> $PS <<EOF
153 60 20130524
EOF
gmt pstext -R -J -B -O -N -F+f10p,purple >> $PS <<EOF
158 50 20131001
EOF

