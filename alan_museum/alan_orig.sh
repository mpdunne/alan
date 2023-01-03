#!/bin/bash

#http://misc.flogisoft.com/bash/tip_colors_and_formatting

####################################
# Fasta-style protein alignments   #
####################################

function alandavies {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##K-STQNAILMFWVCRCEDGHYP###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "^$" |
		GREP_COLORS='mt=01;41' egrep --color=always "[K]*" | \
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;37;42' egrep --color=always "[STQN]" | \
		GREP_COLORS='mt=01;44' egrep --color=always "[AILMFWVC]" | \
		GREP_COLORS='mt=01;41' egrep --color=always "[R]" | \
		GREP_COLORS='mt=01;105' egrep --color=always "[C]" | \
		GREP_COLORS='mt=01;45' egrep --color=always "[ED]" | \
		GREP_COLORS='mt=01;90;103' egrep --color=always "[G]" | \
		GREP_COLORS='mt=01;46' egrep --color=always "[HY]" | \
		GREP_COLORS='mt=01;90;43' egrep --color=always "[P]" | \
		sed -r "s/.*###//g") | less -SR --shift 10
}

####################################
# Piped FASTA protein alignments   #
####################################

function alanismorissette {
	input="$(</dev/stdin)"
	labels=$(echo "$input" | grep ">" | sed -r "s/$/\t###/g" | column -t -s $'\t' | sed -r "s/###//g")
	seqs=$(echo "$input" | sed -r "s/^>(.*)$/£££>\1##K-STQNAILMFWVCRCEDGHYP###/g" | \
			tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "^$" | \
			GREP_COLORS='mt=01;41' egrep --color=always "[K]*" | \
			GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
			GREP_COLORS='mt=01;37;42' egrep --color=always "[STQN]" | \
			GREP_COLORS='mt=01;44' egrep --color=always "[AILMFWVC]" | \
			GREP_COLORS='mt=01;41' egrep --color=always "[R]" | \
			GREP_COLORS='mt=01;105' egrep --color=always "[C]" | \
			GREP_COLORS='mt=01;45' egrep --color=always "[ED]" | \
			GREP_COLORS='mt=01;90;103' egrep --color=always "[G]" | \
			GREP_COLORS='mt=01;46' egrep --color=always "[HY]" | \
			GREP_COLORS='mt=01;90;43' egrep --color=always "[P]" | \
			sed -r "s/.*###//g")
	paste <(echo "$labels") <(echo "$seqs") | less -SR --shift 10
}

####################################
# Fasta-style nuc alignments       #
####################################

function alanrickman {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##-ACGTNacgtn###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -v "^$" |
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;31' egrep --color=always "[Aa]" | \
		GREP_COLORS='mt=01;32' egrep --color=always "[Cc]" | \
		GREP_COLORS='mt=01;33' egrep --color=always "[Gg]" | \
		GREP_COLORS='mt=01;34' egrep --color=always "[Tt]" | \
		sed -r "s/.*###//g") | less -SR --shift 10
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
	if [[ `head -n 1 $1 | up | cut -c1-7` != "CLUSTAL" ]]; then
		alanbennett $1
	else
		alanpartridge $1
	fi
}

####################################
# Basic clustal-fasta conversion   #
####################################

function cl2fa {
	file=$1;
	nf=`sed 1d $file | sed -r "s/ +/\t/g" | cut -f1 | paste -sd "@" | sed -r "s/^@+//g" | sed -r "s/@@+.*//g" | sed -r "s/@/\n/g" | wc -l`
	for i in `seq 1 $nf`; do
		s=`awk -vRS="" -vFS="\n" -v a="$i" '{if (NF > 1) {print $a}}' $file | sed -r "s/ +/\t/g"`
		id=`echo "$s" | cut -f1 | sort -u | head -n1`
		echo ">$id"; echo "$s" | cut -f2
	done
}

####################################
# Clustal-style protein alignments #
####################################

function alanshearer {
	file=$1; tmp=`mktemp`
	cl2fa $file > $tmp; alandavies $tmp; rm $tmp
}

####################################
# Clustal-style nuc alignments     #
####################################

function alanmenken {
	file=$1; tmp=`mktemp`
	cl2fa $file > $tmp; alanrickman $tmp; rm $tmp
}

####################################
# Clustal-style automatic          #
####################################

function alanpartridge {
	file=$1; tmp=`mktemp`
	cl2fa $file > $tmp; alanbennett $tmp; rm $tmp
	
}
