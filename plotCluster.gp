if(k<20){
  set key left bottom left
  set key font ",8"
  set key spacing 1
} else{
  set key off
}
rgb(r,g,b)=int(255*r)*65536+int(255*g)*256+int(255*b)
set style increment user
do for[i=1:k]{
   set style line i linecolor rgb rgb(rand(0),rand(0),rand(0))
}
set style data points

set title Title
plot data_labels using 1:2:3 linecolor variable pt 7 ps 1 t ''
replot for [i=0:k] centroids_file every ::i::i using 1:2:3 linecolor variable pt 7 ps 1 t 'Cluster '.i,\
        for [i=0:k] centroids_file every ::i::i using 1:2 pt 8 ps 2 lc rgb "black" lw 1 t ''

# Plot centroids, then plot border to make it pop out more
set term png
set output "clusters.png"