#!/usr/bin/env bash

echo "municipality,state,code,variable,min_temperature,max_temperature" > output/temperature.csv

cat output/weather.csv |\
	grep 'temperatura' |\
	uniq |\
	sed 's/\-/,/g' |\
	sed 's/\–/,/g' |\
	sed 's/\±/,/g' |\
	sed 's/ a /,/g' |\
	sed 's/°C//g' |\
	sed 's/C$//g' |\
	sed 's/c$//g' |\
	sed 's/°//g' |\
	sed 's/º//g' |\
	sed 's/\.//g' |\
	sed 's/ *$//g' |\
	sed 's/ *, */,/g' |\
	sed 's/\([0-9]\) \([0-9]\)/\1\2/g' |\
	sed 's/,Distr [0-9]*,//g' |\
	sed 's/,,/,/g' >> output/temperature.csv

