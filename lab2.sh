#!/bin/bash

echo "enter the number"
read number

if [ $number -lt 0 ]
then 
	echo "the number is Negative"
elif [ $number -gt 0 ]
then 
	echo "The number is Positive"
else
	echo "the number is zero"
fi

  for ((i = 1; i <= number; i++)); 
do
echo $i 
done
#for ((i = 1; i < number; i++))
#	if [ $number -gt 0 ]
#	then
#		echo "The number is Positive"
#	else
#		echo "Enter a positive number"
#		read number
#	fi

