#!/bin/bash

shopt -s nullglob
for alg in tmp/alg_bin/*
do
	alg_name=${alg/tmp\/alg_bin\//}

	for generator in data_gen/*
	do
		gen_name=${generator/data_gen\//}
		gen_name=${gen_name/.py/}

		infile="tmp/alg_results/$alg_name/$gen_name"
		mkdir -p tmp/graphs/$alg_name
		outfile="tmp/graphs/$alg_name/${gen_name}.tex"

		gnuplot -e "infile='$infile'; outfile='$outfile'" config.gnuplot
	done
done
