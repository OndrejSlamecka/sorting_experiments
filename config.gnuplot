set terminal epslatex size 7,3 color colortext
set output outfile

# Rotate X labels and get rid of the small stripes at the top (nomirror)
set xtics nomirror rotate by -45

# Replace small stripes on the Y-axis with horizontal gridlines
set tic scale 0
set grid ytics lc rgb "#505050"

set linetype  6 lc rgb "#e67e22" lw 1

unset border
set key right top
set key outside

