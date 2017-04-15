#for i in 0; do
for i in `seq 0 18`; do

    for m in 120 125 130; do

        paste   OPUTPUT_getPrefitPostfitSFs_u_b2j3_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_u_b3j3_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_u_b2j4_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_u_b3j4_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_u_b4j4_${i}_${m}.txt | column -t > OPUTPUT_getPrefitPostfitSFs_u_ALL_${i}_${m}.txt

        paste   OPUTPUT_getPrefitPostfitSFs_c_b2j3_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_c_b3j3_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_c_b2j4_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_c_b3j4_${i}_${m}.txt \
                OPUTPUT_getPrefitPostfitSFs_c_b4j4_${i}_${m}.txt | column -t > OPUTPUT_getPrefitPostfitSFs_c_ALL_${i}_${m}.txt

    done

done

for i in `seq 0 18`; do

    for m in 120 125 130; do

        echo ":::::::::::::::::::: ${i} ${m} ::::::::::::::::::::"
        cat OPUTPUT_getPrefitPostfitSFs_u_ALL_${i}_${m}.txt
        echo
        cat OPUTPUT_getPrefitPostfitSFs_c_ALL_${i}_${m}.txt
        echo
        echo
        echo

    done

done > OUTPUT_ALL.txt

