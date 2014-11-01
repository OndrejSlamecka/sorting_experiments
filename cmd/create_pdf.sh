#!/bin/bash

mkdir -p tmp/pdf
cat tex/header.tex > tmp/pdf/graphs.tex

graph_code=$(<tex/figure.tex)

shopt -s nullglob

for generator in data_gen/*
do
	gen_name=${generator/data_gen\//}
	gen_name=${gen_name/.py/}

	echo "\\section{Dataset: \\detokenize{$gen_name}}" | cat >> tmp/pdf/graphs.tex

	for alg in tmp/alg_bin/*
	do
		alg_name=${alg/tmp\/alg_bin\//}

		infile="tmp/graphs/$gen_name/$alg_name"

		c=$graph_code	
		c=${c/<FILE>/$infile}
		c=${c/<CAPTION>/$alg_name}
		echo "$c" | cat >> tmp/pdf/graphs.tex
	done

	# Combined
	infile="tmp/graphs/$gen_name/combined"
	c=$graph_code
	c=${c/<FILE>/$infile}
	c=${c/<CAPTION>/Combined}	
	echo "$c" | cat >> tmp/pdf/graphs.tex
done

echo '\end{document}' | cat >> tmp/pdf/graphs.tex

pdflatex -output-directory=tmp/pdf -interaction=batchmode tmp/pdf/graphs.tex > /dev/null
