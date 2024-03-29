from flask import Flask, render_template, request
import psycopg2

app = Flask(__name__)
conn = psycopg2.connect(database="service_db", user="postgres", password="127576", host="localhost", port="5432")

cursor = conn.cursor()


@app.route('/login/', methods=['GET'])
def index():
    return render_template('login.html')


@app.route('/login/', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    if not username:
        return render_template('login.html', error="Пожалуйста введите логин")
    if not password:
        return render_template('login.html', error="Пожалуйста введите пароль")

    cursor.execute("SELECT * FROM service.users WHERE login=%s AND password=%s", (str(username), str(password)))

    records = list(cursor.fetchall())
    if not records:
        return render_template('login.html', error="Введенного пользователя не существует")
    return render_template('account.html', full_name=records[0][1], login=username, password=password)
