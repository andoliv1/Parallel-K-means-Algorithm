# Parallel-K-Means

## Prerequisites
- GCC
- OpenACC
- Shared Computing Cluster (via Boston University)


## Get Started

Compile serial code using Makefile
```
module load gcc
make
./serial-kmeans
```


Compile ACC code
```
module load pgi gcc
make -k -f makeACC
./acc_kmeans
```

The program will ask for a text file input. The text file must be placed in the "datasets" folder.
We have already included some sample datasets
```
The 2-D dataset needs to be placed in the /datasets/ and must be SPACE delimited.
Type in the name of the dataset you want to use. i.e unbalance.txt
```

If you want to cluster a new dataset, the program will prompt you for inputs for k and the size of the dataset.
```
Insert value for k: 
Insert number of samples in the dataset:
```

The program will then run for 10,000 iterations and at the conclusion will output 2 text files:
- data_out.txt
- centroids_out.txt

__data_out.txt__ contains the original dataset with a new column appended to it which is the label of the cluster the data point belongs to.
__centroids_out.txt__ contains the centroid locations.

We call gnuplot at the end of the program to plot the new centroids. However, if you are ssh'ed into the scc and have not enabled X11 forwarding (ssh -X), you will not be able to see the plots.

We recommend scp'ing __data_out.txt__ and __centroids_out.txt__ back to your host computer and running this command:
```
gnuplot -p -e "k= YOUR_NUMBER_OF_CLUSTERS; data_labels= 'data_out.txt'; centroids_file= 'centroids_out.txt'; Title='K-Means'" plotCluster.gp;
```

![Data](/results/k8/k8_data.png)
![Data_GT](/results/k8/k8_ground_truth.png)
![Data_KMeans](/results/k8/k8_kmeans.png)
