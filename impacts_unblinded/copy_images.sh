for k in u c; do
    for i in `seq 0 19`; do
        for j in b2j3 b3j3 b2j4 b3j4 b4j4; do
            for m in 120 125 130; do
                #cp MVAH${k}tMAX_${j}_h${k}t_${i}_${m}/*.png ~/www/08-02-2017/${i}/${m};
                cp MVAH${k}tMAX_${j}_h${k}t_${i}_${m}/*.pdf ~/www/08-02-2017_2/${i}/${m};
            done;
        done;
    done;
done
