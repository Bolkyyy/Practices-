read -p "Введите N: " n

prod=1
i=1

while [ "$i" -le "$n" ]; do
    prod=$((prod * i))
    i=$((i + 1))
done

echo "Факториал $n = $prod"