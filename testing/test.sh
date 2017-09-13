sed 's/<meta property="og:image" content="//' output.txt > output2.txt
getlink=$(cat output2.txt)
right=${getlink:(-4)}
echo "$right"
sed 's/<meta property="og:image" content="//; s/" // //g' output.txt