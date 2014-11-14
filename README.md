This takes all algorithms in `alg_src` and compiles them, runs them on a lot of data of different kinds (see `data_gen` folder), saves the time spent, plots it and generates TeX and PDF files with the plots.

[Sample output](http://www.slamecka.cz/misc/sorting_exp_sample.pdf)

Usage
-----

`$ ./run.sh` 

(and go see a movie, it will take a while)

Dependencies
------------

* Python 3
* gnuplot
* g++ with C++11 support
* texlive-fonts-recommended (at least on Ubuntu 14.04 this is not part of TexLive)


TODO
----

* Detokenize gnuplot's labels (see qsort_midIsPivot in graphs.pdf)
* Use parallelization


-------------------

Handy sorting algorithms reference: http://www.sorting-algorithms.com/
