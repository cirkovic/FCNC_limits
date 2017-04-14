from ROOT import *
import sys
import os

output = '~/www/27-02-2017/Nusances/'

os.system('rm -rf '+output+'*')

for case in ['split', 'merged']:

    if case == 'split':
        d = {
            'backup_270217_202457' : 'ST',
            'backup_270217_202725' : 'TT',
            'backup_270217_202957' : 'Comb',
            'backup_270217_203224' : 'MAX',
        }
    elif case == 'merged':
        d = {
            'backup_270217_203441' : 'ST',
            'backup_270217_203652' : 'TT',
            'backup_270217_203909' : 'Comb',
            'backup_270217_204121' : 'MAX',
        }


    fs = []
    cs = []

    for i in d:
        for h in ['u', 'c']:
        #for h in ['u']:
            for c in ['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']:
            #for c in ['b2j3']:
                for e in ['0', '1']:
                #for e in ['0']:
                    out = output+case+'/INPUT_MVAH'+h+'t'+d[i]+'_'+c+'_h'+h+'t/plots_'+e+'/'
                    os.system('mkdir -p '+out)
                    fn = i+'/INPUT_MVAH'+h+'t'+d[i]+'_'+c+'_h'+h+'t/plots_'+e+'.root'
                    ft = TFile.Open(fn)
                    if not ft: continue
                    fs.append(ft)
                    for p in ['asdf', 'nuisancs', 'post_fit_errs']:
                        ct = fs[-1].Get(p)
                        if not ct: continue
                        cs.append(ct)
                        cs[-1].Print(out+cs[-1].GetName()+'.pdf')
                        cs[-1].Print(out+cs[-1].GetName()+'.png')
