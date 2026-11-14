read -p "Введите первое число: " a
read -p "Введите второе число: " b
read -p "Введите операцию(+, -, *, /): " op

result=$(awk "BEGIN {print $a $op $b}")
echo "Результат: $a $op $b = $result"