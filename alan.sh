#!/bin/bash

####################################
# Fasta-style protein alignments   #
####################################

function alandavies {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -n -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##K-STQNAILMFWVCRCEDGHYP###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" |
		GREP_COLORS='mt=01;41' egrep --color=always "[K]*" | \
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;90;42' egrep --color=always "[STQN]" | \
		GREP_COLORS='mt=01;44' egrep --color=always "[AILMFWVC]" | \
		GREP_COLORS='mt=01;41' egrep --color=always "[R]" | \
		GREP_COLORS='mt=01;105' egrep --color=always "[C]" | \
		GREP_COLORS='mt=01;45' egrep --color=always "[ED]" | \
		GREP_COLORS='mt=01;90;103' egrep --color=always "[G]" | \
		GREP_COLORS='mt=01;46' egrep --color=always "[HY]" | \
		GREP_COLORS='mt=01;90;43' egrep --color=always "[P]" | \
		sed -r "s/.*###//g") | less -SR
}

####################################
# Fasta-style nuc alignments       #
####################################

function alanrickman {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -n -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##-ACGTNacgtn###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$" |
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;31' egrep --color=always "[Aa]" | \
		GREP_COLORS='mt=01;32' egrep --color=always "[Cc]" | \
		GREP_COLORS='mt=01;35' egrep --color=always "[Gg]" | \
		GREP_COLORS='mt=01;34' egrep --color=always "[Tt]" | \
		sed -r "s/.*###//g") | less -SR
}

####################################
# Fasta-style automatic            #
####################################

function alanbennett {
	nt=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[acgtnACGNT]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
	aa=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[KSTQNAILMFWVCRCEDGHYP]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
	if [[ "$nt" -ge "$aa" ]]; then
		alanrickman $1
	else
		alandavies $1
	fi
}

####################################
# Fully automatic                  #
####################################

function alan {
	if [[ `grep -i "clustal format alignment" $1` == "" ]]; then
		alanbennett $1
	else
		alanpartridge $1
	fi
}

####################################
# Clustal-style protein alignments #
####################################

function alanshearer {
	file=$1; tmp=`mktemp`
        nf=`awk -vRS= -vFS="\n" '{if (NF > 1) {print NF-1}}' $file | grep -P "^[0-9]+$" | sort -nr | head -n1`; for i in `seq 1 $nf`; do s=`awk -vRS= -vFS="\n" -v a="$i" '{if (NF > 1) {print $a}}' $file | sed -r "s/ +/\t/g"`; id=`echo "$s" | cut -f1 | sort -u | head -n1`; echo ">$id"; echo "$s" | cut -f2; done > $tmp
        alandavies $tmp; rm $tmp
}

####################################
# Clustal-style nuc alignments     #
####################################

function alanmenken {
	file=$1; tmp=`mktemp`
        nf=`awk -vRS= -vFS="\n" '{if (NF > 1) {print NF-1}}' $file | grep -P "^[0-9]+$" | sort -nr | head -n1`; for i in `seq 1 $nf`; do s=`awk -vRS= -vFS="\n" -v a="$i" '{if (NF > 1) {print $a}}' $file | sed -r "s/ +/\t/g"`; id=`echo "$s" | cut -f1 | sort -u | head -n1`; echo ">$id"; echo "$s" | cut -f2; done > $tmp
        alanrickman $tmp; rm $tmp
}

####################################
# Clustal-style automatic          #
####################################

function alanpartridge {
	file=$1; tmp=`mktemp`
	nf=`awk -vRS= -vFS="\n" '{if (NF > 1) {print NF-1}}' $file | grep -P "^[0-9]+$" | sort -nr | head -n1`; for i in `seq 1 $nf`; do s=`awk -vRS= -vFS="\n" -v a="$i" '{if (NF > 1) {print $a}}' $file | sed -r "s/ +/\t/g"`; id=`echo "$s" | cut -f1 | sort -u | head -n1`; echo ">$id"; echo "$s" | cut -f2; done > $tmp
	alanbennett $tmp; rm $tmp
	
}
