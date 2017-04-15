#for i in 0; do
for i in `seq 0 18`; do
    for m in 120 125 130; do
        PS=""
        for hyp in u c; do
            for cat in b2j3 b3j3 b2j4 b3j4 b4j4; do
                python getPrefitPostfitSFs.py $hyp $cat $i ${m} > OPUTPUT_getPrefitPostfitSFs_${hyp}_${cat}_${i}_${m}.txt &
                PS="$! $PS"
            done
        done
        wait $PS
    done
done

#for i in *.png; do display $i & done

#cp *.png *.pdf $output

