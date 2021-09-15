#! /bin/sh
#[ -e SS.dat ] || rm SS.dat
#[ -e S670.dat ] || rm S670S.dat
#[ -d lowSNR ] || mkdir lowSNR
ls -1 *BHT*dis | gawk '
	BEGIN{print "cut t2 -10 30"}{
	print "r",$1;
#	print "bp c 0.02 0.2 n 4 p 2";
	print "envelope";
	print "lh depmax";
	}END{print "q"}' | sac | gawk '
	/FILE:/{printf "%s ",$2}
	/depmax/{print $3}' >S_1.dat

ls -1 *BHT*dis | gawk '
        BEGIN{print "cut t2 -80 -40"}{
	print "r",$1;
#	print "bp c 0.02 0.2 n 4 p 2";
	print "envelope";
        print "lh depmax";
	}END{print "q"}' | sac | gawk '
	/FILE:/{printf "%s ",$2}
	/depmax/{print $3}' >S_2.dat
paste S_1.dat S_2.dat >S_all.dat
gawk '{if ($4>0&&$2/$4<6||$2==0||$4==0||$2=="-nan"||$4=="-nan") print "mv",$1,"../lowsnr"}' S_all.dat | sh
        
