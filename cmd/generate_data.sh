#!/bin/bash

for generator in data_gen/*
do
	name=${generator/data_gen\//}
	name=${name/.py/}
	mkdir -p tmp/input/$name

	for((i=1000;i<=1000000;i+=1000))
	do
		(echo $i | python3 $generator) > tmp/input/$name/$i
		if [[ $i -ge 50000 ]]; then
			((i+=3000))			
			if [[ $i -ge 100000 ]]; then
				((i+=16000))
			fi
		fi
	done
done
