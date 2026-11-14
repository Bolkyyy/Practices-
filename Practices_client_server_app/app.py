from flask import Flask, render_template, template_folder
import sqlite3

app = Flask(__name__)

DB_PATH = "app.db"

def get_connection():
    con =sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    return con


@app.route("/")
def index():
    con = get_connection()
    cur = con.cursor()

    cur.execute("select id, title, status from tasks order by id")
    rows = cur.fetchall()

    con.close()

    return render_template('index.html', items=rows)

@app.route('/about')
def about():
    return "Это учебный список задач на Flask. Практическая работа №3."

if __name__ == "__main__":
    app.run(debug=True, port=5000)