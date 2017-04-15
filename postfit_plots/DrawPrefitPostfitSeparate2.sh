output=${1}

find $output -name "*.png" | xargs rm
find $output -name "*.pdf" | xargs rm

#rm *.png *.pdf

#for i in 0 1 2 3 4 5 6; do
for i in 0 1 2 3 4 5 6 7 8; do
#for i in `seq 0 18`; do
#for i in `seq 0 0`; do
    rm -rf ${output}/${i}
    mkdir -p ${output}/${i}
    #for m in 120 125 130; do
    for m in 120; do
        mkdir -p ${output}/${i}/${m}
    done
    #for m in 120 125 130; do
    for m in 120; do
        PS=""
        for hyp in u c; do
        #for hyp in u; do
            for cat in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
            #for cat in b2j3; do
                python drawPrefitPostfitSeparate2.py $output $hyp $cat $i $m &
                PS="$! $PS"
            done
        done
        wait $PS
    done
done

#for i in *.png; do display $i & done

#cp *.png *.pdf $output

