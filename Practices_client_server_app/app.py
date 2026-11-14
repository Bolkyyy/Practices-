from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

DB_PATH = "app.db"

def get_connection():
    con =sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    return con

def fetch_all_tasks():
    con = get_connection()
    try:
        cur = con.cursor()
        cur.execute("select id, title, status from tasks order by id")
        return cur.fetchall()
    except sqlite3.Error as e:
        print(f"[DB ERROR] {e}")
        return []
    finally:
        con.close()


@app.route("/", methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        title = request.form.get('title', '').strip()

        if not title:
            return render_template(
                'index.html',
                items = fetch_all_tasks(),
                error = 'Название задачи не может быть пустым.'
            )

        con = get_connection()
        try:
            cur = con.cursor()
            cur.execute("insert into tasks (title) values (?)", (title,))
            con.commit()
        except sqlite3.Error as e:
            con.rollback()

            print(f"[DB ERROR] {e}")
            return render_template(
                'index.html',
                items = fetch_all_tasks(),
                error = "Не удалось сохранить задачу. Попробуйте ещё раз."
            )
        finally:
            con.close()

        return redirect(url_for('index'))

    return render_template('index.html', items=fetch_all_tasks())

@app.route('/about')
def about():
    return "Это учебный список задач на Flask. Практическая работа №3."

if __name__ == "__main__":
    app.run(debug=True, port=5000)