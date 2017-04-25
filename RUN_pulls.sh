OUTPUT=~/www/24-04-2017

find ${OUTPUT}/pulls_blind -name "*.png" | xargs rm
find ${OUTPUT}/pulls_blind -name "*.pdf" | xargs rm

./RUN_pulls_blind.sh ${OUTPUT}


find ${OUTPUT}/pulls_unblinded -name "*.png" | xargs rm
find ${OUTPUT}/pulls_unblinded -name "*.pdf" | xargs rm

./RUN_pulls_unblinded.sh ${OUTPUT}

