#!/bin/bash

grep 'A_a' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_A.dat 
grep 'orb_index = 0,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o0.dat 
grep 'orb_index = 1,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o1.dat 
grep 'orb_index = 2,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o2.dat 
grep 'orb_index = 3,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o3.dat 
grep 'orb_index = 4,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o4.dat 
grep 'orb_index = 5,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o5.dat 
grep 'orb_index = 6,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o6.dat 
grep 'orb_index = 7,' w8_solv_dimer.def2-tzvp.extrapolate.retarded.alpha.txt > tmp_o7.dat 

paste tmp_A.dat tmp_o0.dat tmp_o1.dat tmp_o2.dat tmp_o3.dat tmp_o4.dat tmp_o5.dat tmp_o6.dat tmp_o7.dat > tmp.dat
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

sort -g -k1,1 tmp.dat > def2tzvp.dat

rm tmp*dat