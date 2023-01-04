#!/bin/bash

###############################
# Alan version 2.0
# Released 2018-05-30
#
# Copyright Michael P. Dunne
# Contact: mpdunne@live.com
###############################

#http://misc.flogisoft.com/bash/tip_colors_and_formatting

NUCS=0; PROT=0; SHIFT=10;

# Parse in the command line options!

POSITIONAL=()
while [[ $# -gt 0 ]]; do
key="$1"
case $key in
    -n|--nucs)
    NUCS=1
    shift # past argument
    ;;
    -p|--protein)
    PROT=1
    shift # past argument
    ;;
    -s|--shift)
    SHIFT="$2"
    shift # past argument
    shift # past value
    ;;
    --coln)
    COLN="$2"
    if [[ "$COLN" == "" ]]; then
	echo "Error: --coln option requires a value :)"; exit; fi
    shift # past argument
    shift # past value
    ;;
    --colp)
    COLP="$2"
    if [[ "$COLP" == "" ]]; then
	echo "Error: --colp option requires a value :)"; exit; fi
    shift # past argument
    shift # past value
    ;;

    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Sanity checks on the command line options!

# Check only one mol type is being picked
if [[ $[$NUCS + $PROT] -gt 1 ]]; then
	echo "Error: Options -p and -n can't be used simultaneously :)."
	echo "       Leave blank for automatic selection!"
	exit; fi

# Check the shift value is a positive number
if ! expr "$SHIFT" : '[0-9]\+$' >/dev/null; then
	echo "Error: Value for -s must be a positive integer! :)"
	exit; fi
if [[ "$SHIFT" -le 0 ]]; then
	echo "Error: Value for -s must be a positive integer!"
	exit; fi

# If there are no arguments left, look for input from pipe
TMPDIR="$(mktemp -d)"
if (( $# == 0 )) ; then
    INFILE="$TMPDIR/input.fa"
    echo "$(</dev/stdin)" > $INFILE
else
    INFILE=$1
fi

# Check the input file is specified and is present
if [[ ! -f $INFILE || "$INFILE" == "" ]]; then
	echo "Error: Please specify a valid input file! :)"
	exit; fi

# Choose between clustal and fasta...
CLUSTAL=0
if [[ `head -n 1 $INFILE | awk '{print toupper($0)}' | cut -c1-7` == "CLUSTAL" ]]; then
	CLUSTAL=1; fi

# Define the core functions.

function go {
	file="$1"; cols="$2"; gromit="$3"; colfile=$4; colfiled=$5
	# Firstly, check if any custom colour schemes are specified or
	# if there is a custom colour file in the alan directory.
	if [[ ! "$colfile" == "" ]]; then
		cols=`cat $colfile`
	elif [[ -f $colfiled ]]; then
		cols=`cat $colfiled`
	fi
	# Do the magic
	labels=`grep ">" $file | sed -r "s/$/\t###/g" | column -t -s $'\t' | sed -r "s/###//g"`
	sedstring=""
	while read line; do
		patt=`echo "$line" | cut -f1`; colour=`echo "$line" | cut -f2`
		sedstring="$sedstring; s/([$patt])/£033=$colour@\\1£033=0;0@/g"
	done < <(printf -- "$cols\n")
	sedstring=`echo "$sedstring" | sed -r "s/^[ \t;]+//g"`
	seqs=`sed -r "s/^>(.*)$/£££>\1##$gromit###/g" $file | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "^$" | sed -r "$sedstring"`
	seqs_t=`printf "$seqs" | sed -r "s/.*###//g" | sed -r "s/@/m/g" | sed -r "s/=/\[/g" | sed -r "s/£/\\\\\\/g"`
	paste <(printf -- "$labels") <(printf -- "$seqs_t") | less -SR --shift $SHIFT
}

default_n="Aa\t01;31\nGg\t01;33\nCc\t01;32\nTt\t01;34"
default_p="KkRr\t01;41\nSsTtQqNn\t01;37;42\nAaIiLlMmFfWwVvCc\t01;44\nCc\t01;105\nEeDd\t01;45\nGg\t01;90;103\nHhYy\t01;46\nPp\t01;90;43"

function go_fasta {
	# If protein or nuc is not specified, choose automatically.
	if [[ $[$NUCS + $PROT] -eq 0 ]]; then
		nt=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[acgtnACGNT]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
		aa=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[KSTQNAILMFWVCRCEDGHYP]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
		if [[ "$nt" -ge "$aa" ]]; then NUCS=1; else PROT=1; fi
	fi
	# Run alan.
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	if [[ "$NUCS" -eq "1" ]]; then
		go "$1" "$default_n" "-ACGTNacgtn" "$COLN" "$DIR/coln.csv"
	else
		go "$1" "$default_p" "K-STQNAILMFWVCRCEDGHYP" "$COLP" "$DIR/colp.csv"
	fi
}

function go_clustal {
	file=$1; tmp=`mktemp`
	nf=`sed 1d $file | sed -r "s/ +/\t/g" | cut -f1 | paste -sd "@" | sed -r "s/^@+//g" | sed -r "s/@@+.*//g" | sed -r "s/@/\n/g" | wc -l`
	for i in `seq 1 $nf`; do
		s=`awk -vRS="" -vFS="\n" -v a="$i" '{if (NF > 1) {print $a}}' $file | sed -r "s/ +/\t/g"`
		id=`echo "$s" | cut -f1 | sort -u | head -n1`
		echo ">$id"; echo "$s" | cut -f2
	done > $tmp
	go_fasta $tmp; rm $tmp
}

if [[ "$CLUSTAL" -eq 1 ]]; then
	go_clustal $INFILE
else
	go_fasta $INFILE
fi

# Clean up any temp files
trap 'rm -rf -- "$TMPDIR"' EXIT
