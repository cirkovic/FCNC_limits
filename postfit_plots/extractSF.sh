for i in `find ${1} -name "STDOUT"`; do
    echo $i
    grep "Bin                       Total relative bkg uncert. (prefit)" ${i} -A 100
    echo
done
