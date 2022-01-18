#!/bin/bash

echo "Das sind übergabe parameter"
echo -e "Possitionsparameter: \c"
echo "$@" #besser
echo "$*"
for i in "$@"
 do
    echo "\$i = $i"
done
echo "$*"
echo "$1"
echo "$2"
echo "$9"
echo "Die anzahlder Params $#"
shift
echo "\$9 = $9"
shift
echo "\$9 = $9"
echo "\$1 = $1"
echo "Die anzahlder Params $#"