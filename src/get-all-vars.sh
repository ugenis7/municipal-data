#!/usr/bin/env bash
for var in "$@"
do
	LIBRO="$(pdftotext -q -layout $var -)"

	DATOS="$(echo "$LIBRO" |\
		grep -B 1 'Clave geoestadística' |\
		grep -v 'Clave geoestadística' |\
		tr -s ' ' ' ' |\
		tr '\n' ', ' |\
		sed 's/^ //g' |\
		sed 's/, /,/g')"

	CLIMA="$(echo "$LIBRO" |\
		grep -A 1 'Rango de temperatura' |\
		sed -r 's/\s{2,}/","/g' |\
		sed 's/^/"/g' |\
		sed 's/$/"/g')"


	CODE="$(echo "$var" |\
		sed 's/\.pdf$/,/g' |\
		sed 's/^/C/g')"

	if [ ! -f output/weather.csv ]; then
		echo "municipality,state,code,variable,value" > output/weather.csv
	fi

	printf "$CLIMA" | awk -v datos="$DATOS" -v code="$CODE" '{print datos code $0}' >> output/weather.csv
done
