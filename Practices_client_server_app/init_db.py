import sqlite3

conn = sqlite3.connect('app.db')

cursor = conn.cursor()

cursor.execute(
    """
        create table if not exists tasks(
            id integer primary key,
            title text not null,
            status text default 'new'
        )
    """
)

conn.commit()

conn.close()

print("База данных и таблица tasks успешно созданы.")

