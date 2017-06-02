import sys
path = sys.argv[1]
N = int(sys.argv[2])
f = open(path,'r')
F = []
for line in f:
    words = line[:-1].split()
    #print words
    F.append(words)

#print F

#sys.exit()


#N = 5
#N = 10
#N = 100
#N =50

#with open('limits/limits.h', 'w') as incf:
with open('limits/limits_2D.h', 'w') as incf:
    #incf.write('   {\n')
    #for n, c in enumerate(['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']):
    #for n, c in enumerate(['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4']):
    #for n, c in enumerate(['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4', 'comb']):
    #for n, c in enumerate(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']):
    for n1, c1 in enumerate(range(0, N+1)):
        for n2, c2 in enumerate(range(0, N+1)):
            i = F.index(['CIRKOVIC', str(c1), str(c2)])
            if F[i+1][0] == 'Observed' and F[i+2][0] == 'Expected':
                incf.write('       obs['+str(n1)+']['+str(n2)+'] = '+F[i+1][-1]+';\n')
                incf.write('       s2m['+str(n1)+']['+str(n2)+'] = '+F[i+2][-1]+';\n')
                incf.write('       s1m['+str(n1)+']['+str(n2)+'] = '+F[i+3][-1]+';\n')
                incf.write('       med['+str(n1)+']['+str(n2)+'] = '+F[i+4][-1]+';\n')
                incf.write('       s1p['+str(n1)+']['+str(n2)+'] = '+F[i+5][-1]+';\n')
                incf.write('       s2p['+str(n1)+']['+str(n2)+'] = '+F[i+6][-1]+';\n')
            else:
                incf.write('       obs['+str(n1)+']['+str(n2)+'] = 0.0000;\n')
                incf.write('       s2m['+str(n1)+']['+str(n2)+'] = 0.0000;\n')
                incf.write('       s1m['+str(n1)+']['+str(n2)+'] = 0.0000;\n')
                incf.write('       med['+str(n1)+']['+str(n2)+'] = 0.0000;\n')
                incf.write('       s1p['+str(n1)+']['+str(n2)+'] = 0.0000;\n')
                incf.write('       s2p['+str(n1)+']['+str(n2)+'] = 0.0000;\n')

        #incf.write('   }\n')


sys.exit()

for k in ['c', 'u']:
    with open('limits/plot/limitsH'+k+'t.h', 'w') as incf:
        i = F.index(['input_MVAH'+k+'tComb_comb_h'+k+'t.txt'])
        if F[i+3][0] == 'Expected':
#            incf.write('   double obsAt1 = '+F[i+2][-1]+';\n')
#            incf.write('   double s2mAt1 = '+F[i+3][-1]+';\n')
#            incf.write('   double s1mAt1 = '+F[i+4][-1]+';\n')
#            incf.write('   double medAt1 = '+F[i+5][-1]+';\n')
#            incf.write('   double s1pAt1 = '+F[i+6][-1]+';\n')
#            incf.write('   double s2pAt1 = '+F[i+7][-1]+';\n')
#            incf.write('   double obsAt1 = '+F[i+1][-1]+';\n')
            incf.write('   double obsAt1 = '+F[i+4][-1]+';\n')
            incf.write('   double s2mAt1 = '+F[i+2][-1]+';\n')
            incf.write('   double s1mAt1 = '+F[i+3][-1]+';\n')
            incf.write('   double medAt1 = '+F[i+4][-1]+';\n')
            incf.write('   double s1pAt1 = '+F[i+5][-1]+';\n')
            incf.write('   double s2pAt1 = '+F[i+6][-1]+';\n')
        else:
            incf.write('   double obsAt1 = 0.0000;\n')
            incf.write('   double s2mAt1 = 0.0000;\n')
            incf.write('   double s1mAt1 = 0.0000;\n')
            incf.write('   double medAt1 = 0.0000;\n')
            incf.write('   double s1pAt1 = 0.0000;\n')
            incf.write('   double s2pAt1 = 0.0000;\n')
