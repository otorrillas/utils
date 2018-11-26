startNo=$1
endNo=$2

while [ $startNo -le $endNo ]
do
  git stash drop stash@{$endNo}
  endNo=$[$endNo-1]
done
