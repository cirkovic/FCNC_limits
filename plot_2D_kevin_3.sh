#for i in combSTandTT ST TT; do
for i in combSTandTT; do
    ./plot_2D_coup_kevin_3.sh ${i}
    ./plot-only_2D_coup_kevin_3.sh ${i}
done
