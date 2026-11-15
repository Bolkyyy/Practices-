read -p "Число 1: " a
read -p "Число 2: " b
read -p "Число 3: " c

avg=$(awk "BEGIN {printf \"%.2f\", ($a + $b + $c) / 3}")
echo "Среднее: $avg"
