#!/usr/bin/env bash

cat input/codes.csv |\
	awk -F"," '{print $1}' |\
	sed 's/"//g' |\
	sed 's/C//g' |\
	sed -r 's/^[0-9]{2,2}/&\/&/g' |\
	sed 's/^/http:\/\/www3.inegi.org.mx\/contenidos\/app\/mexicocifras\/datos_geograficos\//g' |\
	grep -v 'code' |\
	sed 's/$/.pdf/g' |\
	xargs -n 1 wget -P output/pdfs/
