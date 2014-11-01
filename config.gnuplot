set terminal epslatex size 5,3 color colortext
set output outfile

# Rotate X labels and get rid of the small stripes at the top (nomirror)
set xtics nomirror rotate by -45

# Replace small stripes on the Y-axis with horizontal gridlines
set tic scale 0
set grid ytics lc rgb "#505050"

unset border
set key left top

