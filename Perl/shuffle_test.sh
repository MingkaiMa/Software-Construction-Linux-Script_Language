#There is no dryrun test for shuffle.pl. 
#Testing (pseudo)random programs is more difficult because there are multiple correct outputs for a given input.
#Write a shell script shuffle_test.sh which tests shuffle.pl.
#Try to test that all outputs are correct and all correct outputs are being generated.

#!/bin/sh

getPerm(){
        local array="$1"
        local result="$2"
        local index
        test "$array" == "" && echo "$result" && return
        for((index=0; index<${#array}; index++))
        do
                getPerm "${array:0:index}${array:index+1}"  "$result${array:index:1}"
        done
}

result=

while read s
do
        result="$result\n$s"
done

s=`echo -e "$result" | sed '/^ *$/d'`

echo "The shuffle line is:"
echo "$s"
echo "The result is:"
#s=`i=0; while((i<3));do echo $i;i=$((i+1));done`
t=`echo "$s"|./shuffle.pl`

t1=$(echo "$t" | tr -d '\n')
t1="$t1"
s=`echo "$s" | tr -d '\n'`

#t=`echo "$s"|./shuffle.pl`

#echo "$t1"
if getPerm "$s" | egrep "$t1" > /dev/null
then
        echo "Correct."
fi

echo "All correct outputs are: "
getPerm "$s"
