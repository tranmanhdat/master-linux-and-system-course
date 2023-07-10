#!/bin/bash
# using bash instead of sh for =~ operator
re='^[0-9]+$'
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]
then
	echo "Parameters are not invalid!"
	exit 0
fi
counter_row=0
for row in  $(seq $1)
do
	str_row=""
	for col in $(seq $2)
	do
		multi=`expr $row \* $col`
		if [ $col == 1 ]
		then
			str_row="$row*$col=$multi"
		else
			str_row="$str_row\t$row*$col=$multi"
		fi
	done
	echo -e $str_row
done
exit 1
