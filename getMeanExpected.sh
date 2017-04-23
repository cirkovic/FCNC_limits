fn=${1}
card=${2}

line=`grep -A 4 "$card" ${fn} | tail -n1`
echo $line | awk '{print $NF}'

