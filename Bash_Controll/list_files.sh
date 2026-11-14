dir=$1

if [ ! -d "$dir" ]; then
    echo "Ошибка: директория '$dir' не существует." >&2
    exit 1
fi

echo "Найдены .txt файлы в $dir:"

for file in "$dir"/*.txt; do
    [ -f "$file" ] || continue

    echo "- $(basename "$file") ($(du -h "$file" | cut -f1))"
done