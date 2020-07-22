#!/bin/bash -x

#headtailgeneration
hcount=0
tcount=0
echo "Wecome to FlipCoin Combination Program"
function headTailGenerate(){
	rn=$((RANDOM%2))
       	if [ $rn -eq 0 ]
       	then
              	tcount=$(($tcount+1))
       	else
               	hcount=$(($hcount+1))
       	fi
}
headTailGenerate
echo $hcount $tcount
