read -p "Радиус: " r

area=$(awk "BEGIN {printf \"%.2f\", 3.14159 * $r * $r}")

echo "---"
echo "Радиус: $r"
echo "Площадь круга: $area"
