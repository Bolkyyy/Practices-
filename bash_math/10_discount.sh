read -p "Цена товара: " price
read -p "Скидка (%): " discount

discount_amount=$((price * discount / 100))
final_price=$((price - discount_amount))

echo "---"
echo "Исходная цена: $price руб."
echo "Скидка $discount%: $discount_amount руб."
echo "Итого к оплате: $final_price руб."

if [ "$discount" -gt 50 ]; then
    echo "Внимание: скидка больше 50%!"
fi