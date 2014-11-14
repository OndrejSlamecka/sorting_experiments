#!/bin/bash
# -v for commentary on algorithm run completion


echo -ne "Compiling algortihms..."
cmd/compile.sh
echo "done"

if [ -d tmp/input ]; then
	echo "NOT generating input arrays as they already exist."
else
	echo -ne "Generating input arrays (expect delay)..."
	cmd/generate_data.sh
	echo "done"
fi

echo -ne "Running algorithms (this will take a lot of time)..."
cmd/run_algorithms.sh $1
echo "done"

echo -ne "Generating graphs..."
cmd/plot.sh
echo "done"

echo -ne "Putting them into TeX and PDF..."
cmd/create_pdf.sh
echo "done"

echo "and done! See tmp/pdf/graphs.pdf"
