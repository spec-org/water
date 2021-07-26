#!/bin/bash

grep 'A_a' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_A.dat 
grep 'orb_index = 0,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o0.dat 
grep 'orb_index = 1,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o1.dat 
grep 'orb_index = 2,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o2.dat 
grep 'orb_index = 3,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o3.dat 
grep 'orb_index = 4,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o4.dat 
grep 'orb_index = 5,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o5.dat 
grep 'orb_index = 6,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o6.dat 
grep 'orb_index = 7,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o7.dat 
grep 'orb_index = 8,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o8.dat 
grep 'orb_index = 9,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o9.dat 
grep 'orb_index = 10,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o10.dat 
grep 'orb_index = 11,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o11.dat 
grep 'orb_index = 12,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o12.dat 
grep 'orb_index = 13,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o13.dat 
grep 'orb_index = 14,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o14.dat 
grep 'orb_index = 15,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o15.dat 
grep 'orb_index = 16,' w17_tsw_g1.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o16.dat 
paste tmp_A.dat tmp_o0.dat tmp_o1.dat tmp_o2.dat tmp_o3.dat tmp_o4.dat tmp_o5.dat tmp_o6.dat tmp_o7.dat tmp_o8.dat tmp_o9.dat tmp_o10.dat tmp_o11.dat tmp_o12.dat tmp_o13.dat tmp_o14.dat tmp_o15.dat tmp_o16.dat > tmp.dat
sed 's/w = //g' tmp.dat > tmp1.dat
sed 's/, A_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 0, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 1, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 2, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 3, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 4, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 5, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 6, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 7, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 8, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 9, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 10, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 11, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 12, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 13, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 14, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 15, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 16, gpp_a = //g' tmp.dat > tmp1.dat
sort -g -k1,1 tmp1.dat > def2tzvp.dat

rm tmp*dat