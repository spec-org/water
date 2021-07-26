#!/bin/bash

for i in d t q; do
grep 'A_a' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_A.dat 
grep 'orb_index = 0,' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_o0.dat 
grep 'orb_index = 1,' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_o1.dat 
grep 'orb_index = 2,' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_o2.dat 
grep 'orb_index = 3,' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_o3.dat 
grep 'orb_index = 4,' w5_solvated.cc-pv${i}z.extrapolate.retarded.alpha.txt > tmp_o4.dat 
paste tmp_A.dat tmp_o0.dat tmp_o1.dat tmp_o2.dat tmp_o3.dat tmp_o4.dat > tmp.dat
sed 's/w = //g' tmp.dat > tmp1.dat
sed 's/, A_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 0, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 1, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 2, gpp_a = //g' tmp.dat > tmp1.dat
sed 's/orb_index = 3, gpp_a = //g' tmp1.dat > tmp.dat
sed 's/orb_index = 4, gpp_a = //g' tmp.dat > tmp1.dat
sort -g -k1,1 tmp1.dat > ccpv${i}z.dat

done

rm tmp*dat