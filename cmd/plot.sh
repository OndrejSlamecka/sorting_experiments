#!/bin/bash

shopt -s nullglob

# Each algorithm/dataset combination in separate graph

for generator in data_gen/*
do
	gen_name=${generator/data_gen\//}
	gen_name=${gen_name/.py/}

	for alg in tmp/alg_bin/*
	do
		alg_name=${alg/tmp\/alg_bin\//}

		infile="tmp/alg_results/$gen_name/$alg_name"
		mkdir -p tmp/graphs/$gen_name
		outfile="tmp/graphs/$gen_name/${alg_name}.tex"

		cat config.gnuplot > tmp/config.gnuplot
		echo "plot '$infile' with linespoints title '$alg_name'" >> tmp/config.gnuplot
		gnuplot -e "outfile='$outfile'" tmp/config.gnuplot
	done
done


# All algorithms on each dataset in one graph
for generator in data_gen/*
do
	gen_name=${generator/data_gen\//}
	gen_name=${gen_name/.py/}
	cat config.gnuplot > tmp/config.gnuplot	
	echo -ne "plot" >> tmp/config.gnuplot

	for alg in tmp/alg_bin/*
    do
		alg_name=${alg/tmp\/alg_bin\//}

        infile="tmp/alg_results/$gen_name/$alg_name"
		echo " '$infile' with linespoints title '$alg_name', \\" >> tmp/config.gnuplot
    done
	
	outfile="tmp/graphs/$gen_name/combined.tex"
	gnuplot -e "outfile='$outfile'" tmp/config.gnuplot
done

