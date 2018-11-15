echo "municipality,state,code,variable,min_precipitation,max_precipitation" > precipitation.csv

cat weather.csv |\
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
	sed 's/,,/,/g' >> precipitation.csv
