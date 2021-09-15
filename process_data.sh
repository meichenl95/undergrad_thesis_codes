
gawk '{print "perl /home/lmc/process_data_lmc/rdseed.pl *seed" }' | sh
gawk '{print "/home/lmc/process_data_lmc/merge_data.pl *SAC"}' |sh
gawk '{print "/home/lmc/process_data_lmc/process_data.pl -m ../CMTSOLUTION -l 0 -L 3500 -t 8.33 -T 50 -i -x dis -q S -p -s 40 *.SAC"}' | sh
gawk '{print "/home/lmc/process_data_lmc/m_rot3.pl . BH M.SAC.dis"}' | sh
sh snr.sh
gawk '{print "/home/lmc/process_data_lmc/linux_plotdata_GMT4.pl -a s -T -10/150/a10f2 -M 0.4 -t 336 -w2 -G 50/80 -o d *BHT*.dis"}' | sh
gawk '{print "saclst t9 f *.dis | awk '$2>0 {print "rm", $1}' | sh "}' | sh
sh t8t9.sh
perl /home/lmc/process_data_lmc/calculate_t_S.pl -b -5 -e 15 -l 0.7 -a S -r *reference.BHT.M.SAC.dis *BHT*dis
perl /home/lmc/process_data_lmc/calculate_t_ScS.pl -b -5 -e 15 -l 0.7 -a ScS -r *reference.BHT.M.SAC.dis.corr *BHT*dis.corr

SAC << EOF
cut t2 -5 25
r *dis.corr.corr
w append .S.cut
cut t3 -5 25
r *dis.corr.corr
w append .ScS.cut
EOF

cat 1.txt 2.txt 3.txt > all.txt

#ps2eps file.ps file.eps
ps2png file.ps file.png
convert file.ps file.eps
#sam2p file.ps EPS:file.eps

#count the number of file name *.dis.corr.corr
ls -l *.dis.corr.corr | wc -l
