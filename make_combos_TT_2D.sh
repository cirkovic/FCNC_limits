combineCards.py hct=input_MVAHctTT_b2j3_hct.txt hut=input_MVAHutTT_b2j3_hut.txt > input_MVA2DTT_b2j3.txt
combineCards.py hct=input_MVAHctTT_b2j4_hct.txt hut=input_MVAHutTT_b2j4_hut.txt > input_MVA2DTT_b2j4.txt
combineCards.py hct=input_MVAHctTT_b3j3_hct.txt hut=input_MVAHutTT_b3j3_hut.txt > input_MVA2DTT_b3j3.txt
combineCards.py hct=input_MVAHctTT_b3j4_hct.txt hut=input_MVAHutTT_b3j4_hut.txt > input_MVA2DTT_b3j4.txt
combineCards.py hct=input_MVAHctTT_b4j4_hct.txt hut=input_MVAHutTT_b4j4_hut.txt > input_MVA2DTT_b4j4.txt

combineCards.py b2j3_hct=input_MVAHctTT_b2j3_hct.txt \
                b2j4_hct=input_MVAHctTT_b2j4_hct.txt \
                b3j3_hct=input_MVAHctTT_b3j3_hct.txt \
                b3j4_hct=input_MVAHctTT_b3j4_hct.txt \
                b4j4_hct=input_MVAHctTT_b4j4_hct.txt \
                b2j3_hut=input_MVAHutTT_b2j3_hut.txt \
                b2j4_hut=input_MVAHutTT_b2j4_hut.txt \
                b3j3_hut=input_MVAHutTT_b3j3_hut.txt \
                b3j4_hut=input_MVAHutTT_b3j4_hut.txt \
                b4j4_hut=input_MVAHutTT_b4j4_hut.txt > input_MVA2DTT_comb.txt

