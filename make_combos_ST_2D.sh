combineCards.py hct=input_MVAHctST_b2j3_hct.txt hut=input_MVAHutST_b2j3_hut.txt > input_MVA2DST_b2j3.txt
combineCards.py hct=input_MVAHctST_b2j4_hct.txt hut=input_MVAHutST_b2j4_hut.txt > input_MVA2DST_b2j4.txt
combineCards.py hct=input_MVAHctST_b3j3_hct.txt hut=input_MVAHutST_b3j3_hut.txt > input_MVA2DST_b3j3.txt
combineCards.py hct=input_MVAHctST_b3j4_hct.txt hut=input_MVAHutST_b3j4_hut.txt > input_MVA2DST_b3j4.txt
combineCards.py hct=input_MVAHctST_b4j4_hct.txt hut=input_MVAHutST_b4j4_hut.txt > input_MVA2DST_b4j4.txt

combineCards.py b2j3_hct=input_MVAHctST_b2j3_hct.txt \
                b2j4_hct=input_MVAHctST_b2j4_hct.txt \
                b3j3_hct=input_MVAHctST_b3j3_hct.txt \
                b3j4_hct=input_MVAHctST_b3j4_hct.txt \
                b4j4_hct=input_MVAHctST_b4j4_hct.txt \
                b2j3_hut=input_MVAHutST_b2j3_hut.txt \
                b2j4_hut=input_MVAHutST_b2j4_hut.txt \
                b3j3_hut=input_MVAHutST_b3j3_hut.txt \
                b3j4_hut=input_MVAHutST_b3j4_hut.txt \
                b4j4_hut=input_MVAHutST_b4j4_hut.txt > input_MVA2DST_comb.txt

