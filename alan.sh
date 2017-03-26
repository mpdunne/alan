#!/bin/bash

function alandavies {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -n -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##K-STQNAILMFWVCRCEDGHYP###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" |
		GREP_COLORS='mt=01;41' egrep --color=always "[K]*" | \
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;42' egrep --color=always "[STQN]" | \
		GREP_COLORS='mt=01;44' egrep --color=always "[AILMFWVC]" | \
		GREP_COLORS='mt=01;41' egrep --color=always "[R]" | \
		GREP_COLORS='mt=01;105' egrep --color=always "[C]" | \
		GREP_COLORS='mt=01;45' egrep --color=always "[ED]" | \
		GREP_COLORS='mt=01;103' egrep --color=always "[G]" | \
		GREP_COLORS='mt=01;46' egrep --color=always "[HY]" | \
		GREP_COLORS='mt=01;43' egrep --color=always "[P]" | \
		sed -r "s/.*###//g") | less -SR
}

function alanrickman {
	paste <(grep ">" $1 | sed -r "s/$/\t###/g" | column -t -n -s $'\t' | sed -r "s/###//g") <(sed -r "s/^>(.*)$/£££>\1##-ACGTNacgtn###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$" |
		GREP_COLORS='mt=0;0' egrep --color=always "[-]" | \
		GREP_COLORS='mt=01;31' egrep --color=always "[Aa]" | \
		GREP_COLORS='mt=01;32' egrep --color=always "[Cc]" | \
		GREP_COLORS='mt=01;35' egrep --color=always "[Gg]" | \
		GREP_COLORS='mt=01;34' egrep --color=always "[Tt]" | \
		sed -r "s/.*###//g") | less -SR
}

function alanbennett {
	nt=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[acgtnACGNT]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
	aa=`grep -v ">" $1 | tr '\n' ' ' | sed -r "s/[KSTQNAILMFWVCRCEDGHYP]/#/g" | sed -r "s/[ -]//g" | grep -o "#" | wc -l`
	if [[ "$nt" -ge "$aa" ]]; then
		alanrickman $1
	else
		alandavies $1
	fi
}

function alan {
	alanbennett $1
}
