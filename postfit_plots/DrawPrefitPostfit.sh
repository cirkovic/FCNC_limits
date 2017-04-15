output=~/www/26-01-2017/10
output=~/www/29-01-2017/10

rm *.png

python drawPrefitPostfit.py

#for i in *.png; do display $i & done

cp *.png $output

