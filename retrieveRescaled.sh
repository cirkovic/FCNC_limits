mv input /tmp/cirkovic
mkdir input
cd input
xrdcp -r root://eoscms//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling2D_2_13-04-2017 .
mv 0_1 hut
mv 1_0 hct
cd hut
for i in `ls`; do mv ${i} ../${i//uct/ut}; done
cd ../hct
for i in `ls`; do mv ${i} ../${i//uct/ct}; done
cd ..
rmdir hut hct

