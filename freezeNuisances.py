ARG=""
for c in ['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']:
    for p in ['Sig', 'ttbb', 'ttcc', 'ttlf', 'other']:
        for b in xrange(0, 20):
            ARG=ARG+" "+c+"StatBin"+p+str(b)
print ARG
