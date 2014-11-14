#!/bin/bash

function rungen {
	
	(echo $1 | python3 $2) > tmp/input/$3/$1
}

for generator in data_gen/*
do
	name=${generator/data_gen\//}
	name=${name/.py/}
	mkdir -p tmp/input/$name

	for((i=1000;i<=50000;i+=1000))
	do
		rungen $i $generator $name
	done
	
	for((i=50000;i<=100000;i+=5000))
	do
		rungen $i $generator $name
	done
	
	for((i=100000;i<=1000000;i+=20000))
	do
		rungen $i $generator $name
	done
	
	for((i=1000000;i<=5000000;i+=50000))
	do
		rungen $i $generator $name
	done
done
