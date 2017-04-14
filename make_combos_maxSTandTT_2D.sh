combineCards.py hct=input_MVAHctMAX_b2j3_hct.txt hut=input_MVAHutMAX_b2j3_hut.txt > input_MVA2DMAX_b2j3.txt
combineCards.py hct=input_MVAHctMAX_b2j4_hct.txt hut=input_MVAHutMAX_b2j4_hut.txt > input_MVA2DMAX_b2j4.txt
combineCards.py hct=input_MVAHctMAX_b3j3_hct.txt hut=input_MVAHutMAX_b3j3_hut.txt > input_MVA2DMAX_b3j3.txt
combineCards.py hct=input_MVAHctMAX_b3j4_hct.txt hut=input_MVAHutMAX_b3j4_hut.txt > input_MVA2DMAX_b3j4.txt
combineCards.py hct=input_MVAHctMAX_b4j4_hct.txt hut=input_MVAHutMAX_b4j4_hut.txt > input_MVA2DMAX_b4j4.txt

combineCards.py b2j3_hct=input_MVAHctMAX_b2j3_hct.txt \
                b2j4_hct=input_MVAHctMAX_b2j4_hct.txt \
                b3j3_hct=input_MVAHctMAX_b3j3_hct.txt \
                b3j4_hct=input_MVAHctMAX_b3j4_hct.txt \
                b4j4_hct=input_MVAHctMAX_b4j4_hct.txt \
                b2j3_hut=input_MVAHutMAX_b2j3_hut.txt \
                b2j4_hut=input_MVAHutMAX_b2j4_hut.txt \
                b3j3_hut=input_MVAHutMAX_b3j3_hut.txt \
                b3j4_hut=input_MVAHutMAX_b3j4_hut.txt \
                b4j4_hut=input_MVAHutMAX_b4j4_hut.txt > input_MVA2DMAX_comb.txt

