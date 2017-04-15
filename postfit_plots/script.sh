#OUTDIR=~/www/01-02-2017/${1}
OUTDIR=~/www/05-02-2017/${1}
RMIN=${2}
RMAX=${3}

echo $OUTDIR $RMIN $RMAX

./run_postfit.sh $OUTDIR $RMIN $RMAX
