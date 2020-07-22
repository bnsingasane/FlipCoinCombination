#!/bin/bash -x

#headtailgeneration
hcount=0
tcount=0
declare -A singlet
singlet=([H]=0 [T]=0)
echo "Welcome to FlipCoin Combination Program"
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

#storing singletcombination in dictionary and calculating percentage of it
function singletCombination(){	
echo "------Singlet Combination-------"
	while [ $hcount -ne 21 -a $tcount -ne 21 ]
	do
		singletheadTailGenerate
	done
	singlet[H]=$hcount
	singlet[T]=$tcount
}
singletCombination
echo "${singlet[@]} total = $((singlet[H] + singlet[T]))"
echo "H % = $(( (singlet[H] * 100 )/ (singlet[H] + singlet[T]) ))"
echo "T % = $(( (singlet[T] * 100 )/ (singlet[H] + singlet[T]) ))"

#storing singletcombination in dictionary and calculating percentage of it.
function doubletheadTailGenerate(){
echo "------Doublet Combination-------"
	while [ ${doublet[HH]} -ne 21 -a ${doublet[HT]} -ne 21 -a ${doublet[TH]} -ne 21 -a ${doublet[TT]} -ne 21 ]
	do
		rn1=$((RANDOM%2))
		rn2=$((RANDOM%2))
       		if [ $rn1 -eq 0 -a $rn2 -eq 0 ]
       		then
			doublet[TT]=$((doublet[TT] + 1))
       		elif [ $rn1 -eq 0 -a $rn2 -eq 1 ]
		then
			doublet[TH]=$((doublet[TH] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 0 ]
		then
			doublet[HT]=$((doublet[HT] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 1 ]
		then
			doublet[HH]=$((doublet[HH] + 1))
       		fi
	done
dtotal=$((doublet[HH] + doublet[HT] + doublet[TH] + doublet[TT]))
echo "${doublet[@]} total = $dtotal"
echo "HH % = $(( (${doublet[HH]} * 100 ) / $dtotal ))"
echo "HT % = $(( (${doublet[HT]} * 100 ) / $dtotal))"
echo "TH % = $(( (${doublet[TH]} * 100 ) / $dtotal))"
echo "TT % = $(( (${doublet[TT]} * 100 ) / $dtotal))"
}
doubletheadTailGenerate
