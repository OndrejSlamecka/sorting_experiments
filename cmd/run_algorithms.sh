#!/bin/bash

f2i() {
  awk 'BEGIN{for (i=1; i<ARGC;i++)
   printf "%.0f\n", ARGV[i]}' "$@"
}

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
				 echo "Finished $alg_name on $gen_name/$inp_name in $result"
			fi

			int_result=$(f2i $result)
			if [ $int_result -gt 1 ]; then
				if [ "$1" == "-v" ]; then
					echo "Last run of $alg_name took more than 6 seconds. Continuing with next algorithm."
				fi

				break
			fi
		done
	done
done
