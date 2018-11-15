#!/usr/bin/env bash

src/download.sh

for f in $(ls output/pdfs/)
do
	src/get-all-vars.sh output/pdfs/${f} >> test.txt;
done

src/get-precipitation.sh

src/get-temperature.sh
