#!/bin/bash

mkdir -p tmp/pdf
cat tex/header.tex > tmp/pdf/graphs.tex

graph_code=$(<tex/figure.tex)

shopt -s nullglob
for alg in tmp/alg_bin/*
do
	alg_name=${alg/tmp\/alg_bin\//}

	for generator in data_gen/*
	do
		gen_name=${generator/data_gen\//}
		gen_name=${gen_name/.py/}

		infile="tmp/graphs/$alg_name/$gen_name"

		c=$graph_code	
		c=${c/<FILE>/$infile}
		c=${c/<ALGORITHM>/$alg_name}
		c=${c/<DATASET>/$gen_name}
		echo "$c" | cat >> tmp/pdf/graphs.tex
	done
done

echo '\end{document}' | cat >> tmp/pdf/graphs.tex

pdflatex -output-directory=tmp/pdf -interaction=batchmode tmp/pdf/graphs.tex > /dev/null
