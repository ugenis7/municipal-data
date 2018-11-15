#!/usr/bin/env bash

echo "municipality,state,code,variable,min_precipitation,max_precipitation" > output/precipitation.csv

cat output/weather.csv |\
	grep 'precip' |\
	uniq |\
	sed 's/\-/,/g' |\
	sed 's/\–/,/g' |\
	sed 's/\±/,/g' |\
	sed 's/ a /,/g' |\
	sed 's/mm//g' |\
	sed 's/\.//g' |\
	sed 's/ *$//g' |\
	sed 's/ *, */,/g' |\
	sed 's/\([0-9]\) \([0-9]\)/\1\2/g' |\
	sed 's/,Distr [0-9]*,//g' |\
	sed 's/,,/,/g' >> output/precipitation.csv
