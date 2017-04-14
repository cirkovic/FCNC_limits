import sys
path = sys.argv[1]
f = open(path,'r')
F = []
for line in f:
    words = line[:-1].split()
    #print words
    F.append(words)

#print F

#sys.exit()


with open('limits/limits.h', 'w') as incf:
    for k in ['c', 'u']:
        cats = None
        if k == 'c':
            cats = ['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4', 'comb']
            incf.write('   if (coup == "Hct") {\n')
        elif k == 'u':
            cats = ['b2j3', 'b2j4', 'b3j3', 'b3j4', 'comb']
            incf.write('   else {\n')
        #for n, c in enumerate(['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']):
        #for n, c in enumerate(['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4']):
        #for n, c in enumerate(['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4', 'comb']):
        for n, c in enumerate(cats):
            #print 'input_MVAH'+k+'tComb_'+c+'_h'+k+'t.txt'
            i = F.index(['input_MVAH'+k+'tComb_'+c+'_h'+k+'t.txt'])
            if F[i+2][0] == 'Observed' and F[i+3][0] == 'Expected':
#            if False:
#                incf.write('       s2m['+str(n)+'] = '+F[i+3][-1]+';\n')
#                incf.write('       s1m['+str(n)+'] = '+F[i+4][-1]+';\n')
#                incf.write('       med['+str(n)+'] = '+F[i+5][-1]+';\n')
#                incf.write('       s1p['+str(n)+'] = '+F[i+6][-1]+';\n')
#                incf.write('       s2p['+str(n)+'] = '+F[i+7][-1]+';\n')
                incf.write('       obs['+str(n)+'] = '+F[i+2][-1]+';\n')
                incf.write('       s2m['+str(n)+'] = '+F[i+3][-1]+';\n')
                incf.write('       s1m['+str(n)+'] = '+F[i+4][-1]+';\n')
                incf.write('       med['+str(n)+'] = '+F[i+5][-1]+';\n')
                incf.write('       s1p['+str(n)+'] = '+F[i+6][-1]+';\n')
                incf.write('       s2p['+str(n)+'] = '+F[i+7][-1]+';\n')
            else:
                incf.write('       obs['+str(n)+'] = 0.0000;\n')
                incf.write('       s2m['+str(n)+'] = 0.0000;\n')
                incf.write('       s1m['+str(n)+'] = 0.0000;\n')
                incf.write('       med['+str(n)+'] = 0.0000;\n')
                incf.write('       s1p['+str(n)+'] = 0.0000;\n')
                incf.write('       s2p['+str(n)+'] = 0.0000;\n')
        incf.write('   }\n')


for k in ['c', 'u']:
    with open('limits/plot/limitsH'+k+'t.h', 'w') as incf:
        i = F.index(['input_MVAH'+k+'tComb_comb_h'+k+'t.txt'])
        if F[i+2][0] == 'Observed' and F[i+3][0] == 'Expected':
#            incf.write('   double obsAt1 = '+F[i+2][-1]+';\n')
#            incf.write('   double s2mAt1 = '+F[i+3][-1]+';\n')
#            incf.write('   double s1mAt1 = '+F[i+4][-1]+';\n')
#            incf.write('   double medAt1 = '+F[i+5][-1]+';\n')
#            incf.write('   double s1pAt1 = '+F[i+6][-1]+';\n')
#            incf.write('   double s2pAt1 = '+F[i+7][-1]+';\n')
#            incf.write('   double obsAt1 = '+F[i+1][-1]+';\n')
            incf.write('   double obsAt1 = '+F[i+2][-1]+';\n')
            incf.write('   double s2mAt1 = '+F[i+3][-1]+';\n')
            incf.write('   double s1mAt1 = '+F[i+4][-1]+';\n')
            incf.write('   double medAt1 = '+F[i+5][-1]+';\n')
            incf.write('   double s1pAt1 = '+F[i+6][-1]+';\n')
            incf.write('   double s2pAt1 = '+F[i+7][-1]+';\n')
        else:
            incf.write('   double obsAt1 = 0.0000;\n')
            incf.write('   double s2mAt1 = 0.0000;\n')
            incf.write('   double s1mAt1 = 0.0000;\n')
            incf.write('   double medAt1 = 0.0000;\n')
            incf.write('   double s1pAt1 = 0.0000;\n')
            incf.write('   double s2pAt1 = 0.0000;\n')
