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
    for k in ['2D']:
        if k == '2D':
            incf.write('   if (true) {\n')
        #for n, c in enumerate(['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']):
        for n, c in enumerate(['b2j3', 'b2j4', 'b3j3', 'b3j4', 'b4j4']):
            #print 'input_MVAH'+k+'tMAX_'+c+'_h'+k+'t.txt'
            i = F.index(['input_MVA'+k+'MAX_'+c+'.txt'])
            if F[i+3][0] == 'Expected':
#            if False:
#                incf.write('       s2m['+str(n)+'] = '+F[i+3][-1]+';\n')
#                incf.write('       s1m['+str(n)+'] = '+F[i+4][-1]+';\n')
#                incf.write('       med['+str(n)+'] = '+F[i+5][-1]+';\n')
#                incf.write('       s1p['+str(n)+'] = '+F[i+6][-1]+';\n')
#                incf.write('       s2p['+str(n)+'] = '+F[i+7][-1]+';\n')
                incf.write('       s2m['+str(n)+'] = '+F[i+2][-1]+';\n')
                incf.write('       s1m['+str(n)+'] = '+F[i+3][-1]+';\n')
                incf.write('       med['+str(n)+'] = '+F[i+4][-1]+';\n')
                incf.write('       s1p['+str(n)+'] = '+F[i+5][-1]+';\n')
                incf.write('       s2p['+str(n)+'] = '+F[i+6][-1]+';\n')
            else:
                incf.write('       s2m['+str(n)+'] = 0.0000;\n')
                incf.write('       s1m['+str(n)+'] = 0.0000;\n')
                incf.write('       med['+str(n)+'] = 0.0000;\n')
                incf.write('       s1p['+str(n)+'] = 0.0000;\n')
                incf.write('       s2p['+str(n)+'] = 0.0000;\n')
        incf.write('   }\n')


for k in ['2D']:
    with open('limits/plot/limits2D.h', 'w') as incf:
        i = F.index(['input_MVA'+k+'MAX_comb.txt'])
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
