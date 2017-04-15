#output=~/www/26-01-2017/10
output=~/www/27-01-2017/10
output=~/www/29-01-2017/10
output=~/www/29-01-2017/11

rm *.png *.pdf ${output}/*.*

python drawPrefitPostfitSeparate.py

#for i in *.png; do display $i & done

cp *.png *.pdf $output

