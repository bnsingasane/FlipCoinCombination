#!/bin/bash -x

#headtailgeneration
hcount=0
tcount=0
declare -A singlet
declare -A doublet
declare -A triplet
singlet=([H]=0 [T]=0)
doublet=([HH]=0 [HT]=0 [TH]=0 [TT]=0)
triplet=([HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [TTH]=0 [THT]=0 [HTT]=0 [TTT]=0)
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

#storing singletcombination in dictionary and calculating percentage of it.
function tripletheadTailGenerate(){
echo "------Doublet Combination-------"
	while [ ${triplet[HHH]} -ne 21 -a ${triplet[HHT]} -ne 21 -a ${triplet[HTH]} -ne 21 -a ${triplet[THH]} -ne 21  -a ${triplet[TTH]} -ne 21  -a ${triplet[THT]} -ne 21  -a ${triplet[HTT]} -ne 21  -a ${triplet[TTT]} -ne 21 ]
	do
		rn1=$((RANDOM%2))
		rn2=$((RANDOM%2))
		rn3=$((RANDOM%2))
       		if [ $rn1 -eq 0 -a $rn2 -eq 0 -a $rn3 -eq 0 ]
		then
			triplet[TTT]=$((triplet[TTT] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 0 -a $rn3 -eq 0 ]
		then
			triplet[HTT]=$((triplet[HTT] + 1))
       		elif [ $rn1 -eq 0 -a $rn2 -eq 1 -a $rn3 -eq 0 ]
		then
			triplet[THT]=$((triplet[THT] + 1))
       		elif [ $rn1 -eq 0 -a $rn2 -eq 0 -a $rn3 -eq 1 ]
		then
			triplet[TTH]=$((triplet[TTH] + 1))
       		elif [ $rn1 -eq 0 -a $rn2 -eq 1 -a $rn3 -eq 1 ]
		then
			triplet[THH]=$((triplet[THH] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 0 -a $rn3 -eq 1 ]
		then
			triplet[HTH]=$((triplet[HTH] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 1 -a $rn3 -eq 0 ]
		then
			triplet[HHT]=$((triplet[HHT] + 1))
       		elif [ $rn1 -eq 1 -a $rn2 -eq 1 -a $rn3 -eq 1 ]
		then
			triplet[HHH]=$((triplet[HHH] + 1))
       		fi
	done
ttotal=$((triplet[HHH] + triplet[HHT] + triplet[HTH] + triplet[THH] + triplet[TTH] + triplet[THT] + triplet[HTT] + triplet[TTT]))
echo "${triplet[@]} total = $ttotal"
echo "HHH % = $(( (${triplet[HHH]} * 100 ) / $ttotal))"
echo "HHT % = $(( (${triplet[HHT]} * 100 ) / $ttotal))"
echo "HTH % = $(( (${triplet[HTH]} * 100 ) / $ttotal))"
echo "THH % = $(( (${triplet[THH]} * 100 ) / $ttotal))"
echo "TTH % = $(( (${triplet[TTH]} * 100 ) / $ttotal))"
echo "THT % = $(( (${triplet[THT]} * 100 ) / $ttotal))"
echo "HTT % = $(( (${triplet[HTT]} * 100 ) / $ttotal))"
echo "TTT % = $(( (${triplet[TTT]} * 100 ) / $ttotal))"
}
tripletheadTailGenerate
