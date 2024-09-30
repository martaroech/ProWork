import os
from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector
import bcrypt

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', b'\xe6\x05\xe6q;[$\xcd\xe6\xa8n\xab\x1e2q\x13\xa2\x1fL\xd1\xd7O\xabr')

# Connessione al database MySQL / MariaDB
def connect_to_db():
    return mysql.connector.connect(
        host='127.0.0.1',
        database='proworkdb',
        user='root',
        password='LucaMartari',
        charset='utf8mb4'
    )

# Home page - mostra il form di login
@app.route('/')
def home():
    return render_template('login.html')

# Login
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    conn = connect_to_db()
    cur = conn.cursor()

    if username == 'admin':
        cur.execute("SELECT password FROM utente WHERE username = %s", (username,))
        admin = cur.fetchone()
        if admin and bcrypt.checkpw(password.encode('utf-8'), admin[0].encode('utf-8')):
            session['username'] = username
            return redirect(url_for('admin_menu'))

    # Verifica per altri utenti dal database
    password = password.encode('utf-8')  # Converti la password in bytes per bcrypt
    query = """
    (SELECT password FROM utente WHERE username = %s)
    UNION
    (SELECT password FROM dipendente WHERE username = %s)
    """
    cur.execute(query, (username, username))
    user = cur.fetchone()

    # Controllo credenziali nel database
    if user:
        if bcrypt.checkpw(password, user[0].encode('utf-8')):  # user[0] è la colonna password
            session['username'] = username
            return redirect(url_for('user_menu'))
        else:
            flash('Password errata. Riprova.', 'danger')
    else:
        flash('Username non trovato. Riprova.', 'danger')

    cur.close()
    conn.close()
    return redirect(url_for('home'))

# Pagina di registrazione
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        eta = request.form['eta']

        # Verifica se l'utente è già registrato
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("SELECT * FROM utente WHERE username = %s", (username,))
        user = cur.fetchone()

        # Validazione username e password
        if user:
            flash('Username già registrato, prova un altro.', 'danger')
            return redirect(url_for('register'))
        elif len(password) < 8 or not any(c.isupper() for c in password) or not any(c.isdigit() for c in password):
            flash('La password deve essere lunga almeno 8 caratteri, contenere una maiuscola e un numero.', 'danger')
            return redirect(url_for('register'))

        # Validazione dell'età
        try:
            eta = int(eta)
            if eta < 16 or eta > 80:
                flash('L\'età deve essere compresa tra 16 e 80 anni.', 'danger')
                return redirect(url_for('register'))
        except ValueError:
            flash('Per favore, inserisci un numero valido per l\'età.', 'danger')
            return redirect(url_for('register'))

        # Crea l'hash della password
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        # Salva il nuovo utente nel database
        cur.execute("INSERT INTO utente (username, password, eta) VALUES (%s, %s, %s)", (username, hashed_password, eta))
        conn.commit()
        cur.close()
        conn.close()

        flash('Registrazione avvenuta con successo!', 'success')
        return redirect(url_for('home'))

    return render_template('register.html')

@app.route('/user_menu', methods=['GET', 'POST'])
def user_menu():
    if 'username' in session:
        conn = connect_to_db()
        cur = conn.cursor()

        # Se c'è una richiesta POST, esegui la ricerca
        if request.method == 'POST':
            search_query = request.form['search_query']
            query = """
            SELECT nome, settore, localita, immagine
            FROM azienda
            WHERE nome LIKE %s
            """
            cur.execute(query, ('%' + search_query + '%',))
            aziende = cur.fetchall()
            flash(f"Risultati della ricerca per: {search_query}", 'info')
        else:
            # Recupera tutte le aziende se non ci sono ricerche
            query = """
            SELECT nome, settore, localita, immagine
            FROM azienda
            """
            cur.execute(query)
            aziende = cur.fetchall()

        cur.close()
        conn.close()

        # Se non ci sono aziende, possiamo passare un messaggio di errore
        if not aziende:
            flash('Nessuna azienda trovata.', 'danger')

        # Passiamo le aziende e il nome utente alla pagina HTML
        return render_template('user_menu.html', username=session['username'], aziende=aziende)
    else:
        return redirect(url_for('home'))

# Menu admin
@app.route('/admin_menu')
def admin_menu():
    if 'username' in session and session['username'] == 'admin':
        return render_template('admin_menu.html', username='admin')
    else:
        return redirect(url_for('home'))

# Logout
@app.route('/logout')
def logout():
    # Rimuove tutti i dati dalla sessione
    session.clear()
    # Flash message (opzionale)
    flash('Logout effettuato con successo.', 'success')
    # Reindirizza alla pagina di login
    return redirect(url_for('home'))

###########################################################

if __name__ == '__main__':
    app.run(debug=True)
