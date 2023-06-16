#!/bin/bash
echo "Enter the first number:"
read num1
echo "Enter the second Number:"
read num2
#perform arthimetic operations
sum= $(expr $num1 + $num2)

diff = $(expr $num1 - $num2)

mul = $(expr $num1 \* $num2)
quotient=$(expr $num1 / $num2)
echo "Sum :$sum"
echo  "Difference : $diff"
echo "Product:$mul"
echo "Quetient:$quetient"

