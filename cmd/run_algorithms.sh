#!/bin/bash

shopt -s nullglob
for alg in tmp/alg_bin/*
do
	alg_name=${alg/tmp\/alg_bin\//}

	for generator in data_gen/*
	do
		gen_name=${generator/data_gen\//}
		gen_name=${gen_name/.py/}

		mkdir -p tmp/alg_results/$gen_name
		results=tmp/alg_results/$gen_name/$alg_name
		rm -f $results # Flush previously computed data

		for input in `ls -v tmp/input/$gen_name/*`
		do
			inp_name=${input/tmp\/input\/$gen_name\//}
			result=$(cat $input | $alg)
			echo "$inp_name $result" | cat >> $results
			if [ "$1" == "-v" ]; then
				 echo "Finished $alg_name on $gen_name/$inp_name"
			fi
		done
	done
done
