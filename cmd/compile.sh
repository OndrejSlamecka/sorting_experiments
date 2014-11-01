#!/bin/bash

mkdir -p tmp/alg_bin

shopt -s nullglob
for file in alg_src/*
do
	dest=${file/.cpp/}
	dest=${dest/alg_src/tmp\/alg_bin}
	g++ -O2 -std=c++11 $file -o $dest
done
