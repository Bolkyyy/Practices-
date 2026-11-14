num=$1

if [ "$num" -gt 0 ]; then
    echo "Число $num является положительным"
elif [ "$num" -lt 0 ]; then
    echo "Число $num является отрицательным"
else
    echo "Число 0 является нулём"
fi