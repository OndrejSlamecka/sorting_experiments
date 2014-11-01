#!/bin/bash

for generator in data_gen/*
do
	name=${generator/data_gen\//}
	name=${name/.py/}
	mkdir -p tmp/input/$name

	for((i=1000;i<=100000;i+=1000))
	do
		(echo $i | python3 $generator) > tmp/input/$name/$i
		if [[ $i -ge 50000 ]]; then
			((i+=3000))
		fi
	done
done
