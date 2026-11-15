echo "=== Текущая дата и время ==="
date

echo "=== Текущая директория ==="
pwd
ls -la

mkdir -p logs

echo "Дата: $(date)" > logs/info.log
echo "Пользователь: $(whoami)" >> logs/info.log
echo "Система: $(uname -a)" >> logs/info.log

echo "=== Содержимое лога ==="
cat logs/info.log

echo "=== Проверка сети ==="
ping -c 2 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Сеть доступна"
else
    echo "Сеть недоступна"
fi

echo "=== Свободное место ==="
df -h /home

echo "=== Готово! ==="
