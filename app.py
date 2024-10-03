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
    password = request.form['password'].encode('utf-8')  # Converti la password in bytes per bcrypt

    conn = connect_to_db()
    cur = conn.cursor()

    # 1. Verifica per 'admin' nella tabella dipendente
    if username == 'admin':
        cur.execute("SELECT password FROM dipendente WHERE username = %s", (username,))
        admin = cur.fetchone()
        if admin and bcrypt.checkpw(password, admin[0].encode('utf-8')):
            session['username'] = username
            session['user_type'] = 'dipendente'  # Admin è considerato un dipendente
            return redirect(url_for('admin_menu'))

    # 2. Verifica per utenti nella tabella 'utente'
    cur.execute("SELECT password FROM utente WHERE username = %s", (username,))
    utente = cur.fetchone()
    if utente and bcrypt.checkpw(password, utente[0].encode('utf-8')):
        session['username'] = username
        session['user_type'] = 'utente'  # Salva che è un utente
        return redirect(url_for('user_menu'))

    # 3. Verifica per dipendenti nella tabella 'dipendente'
    cur.execute("SELECT password FROM dipendente WHERE username = %s", (username,))
    dipendente = cur.fetchone()
    if dipendente and bcrypt.checkpw(password, dipendente[0].encode('utf-8')):
        session['username'] = username
        session['user_type'] = 'dipendente'  # Salva che è un dipendente
        return redirect(url_for('dipendente_menu'))

    # Se nessuna corrispondenza, ritorna alla pagina di login con un messaggio di errore
    flash('Username o password non corretti. Riprova.', 'danger')
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
            SELECT id, nome, settore, localita, immagine, valutazione
            FROM azienda
            WHERE nome LIKE %s
            """
            cur.execute(query, ('%' + search_query + '%',))
            aziende = cur.fetchall()
            flash(f"Risultati della ricerca per: {search_query}", 'info')
        else:
            # Recupera tutte le aziende se non ci sono ricerche
            query = """
            SELECT id, nome, settore, localita, immagine, valutazione
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

# Vista azienda    
@app.route('/azienda/<int:azienda_id>')
def azienda_details(azienda_id):
    conn = connect_to_db()
    cur = conn.cursor()

    # Recupera i dettagli dell'azienda
    query_azienda = """
    SELECT id, nome, settore, localita, descrizione, valutazione, immagine, indirizzo, link
    FROM azienda
    WHERE id = %s
    """
    cur.execute(query_azienda, (azienda_id,))
    azienda = cur.fetchone()

    # Recupera le recensioni e le informazioni sui dipendenti
    query_recensioni = """
    SELECT r.testo, r.salario, r.orario_flessibile, r.benefit_aziendali, r.sicurezza_sul_lavoro, 
           r.benessere_mentale, r.rapporto_interpersonale, r.crescita_professionale,
           d.ruolo, d.eta, d.anni_servizio, d.genere
    FROM recensione r
    JOIN dipendente_recensione dr ON r.id = dr.id_recensione
    JOIN dipendente d ON dr.id_dipendente = d.id
    WHERE r.id_azienda = %s
    """
    cur.execute(query_recensioni, (azienda_id,))
    recensioni = cur.fetchall()

    # Calcola la media delle valutazioni, arrotondando ogni valore a 1 cifra decimale
    query_media = """
    SELECT ROUND(AVG(salario), 1), 
        ROUND(AVG(orario_flessibile), 1), 
        ROUND(AVG(benefit_aziendali), 1), 
        ROUND(AVG(sicurezza_sul_lavoro), 1), 
        ROUND(AVG(benessere_mentale), 1), 
        ROUND(AVG(rapporto_interpersonale), 1), 
        ROUND(AVG(crescita_professionale), 1)
    FROM proworkdb.recensione
    WHERE id_azienda = %s;
    """
    cur.execute(query_media, (azienda_id,))
    res_medie = cur.fetchone()

    cur.close()
    conn.close()

    # Determina se l'utente è dipendente o meno
    is_dipendente = session.get('user_type') == 'dipendente'

    if not azienda:
        flash("Azienda non trovata.", "danger")
        return redirect(url_for('user_menu'))

    return render_template('azienda.html', azienda=azienda, recensioni=recensioni, res_media=res_medie, is_dipendente=is_dipendente)

# Menu dipendente
@app.route('/dipendente_menu', methods=['GET', 'POST'])
def dipendente_menu():
    if 'username' in session:
        conn = connect_to_db()
        cur = conn.cursor()

        # Ottieni l'azienda collegata al dipendente
        cur.execute("""
            SELECT a.id, a.nome, a.immagine
            FROM dipendente d
            JOIN azienda a ON d.azienda_id = a.id
            WHERE d.username = %s
        """, (session['username'],))
        azienda = cur.fetchone()

        if request.method == 'POST':
            # Recupera i dati inseriti nel form
            recensione = request.form.get('recensione')
            salario = request.form.get('salario')
            orario_flessibile = request.form.get('orario_flessibile')
            benefit_aziendali = request.form.get('benefit_aziendali')
            sicurezza_sul_lavoro = request.form.get('sicurezza_sul_lavoro')
            benessere_mentale = request.form.get('benessere_mentale')
            rapporto_interpersonale = request.form.get('rapporto_interpersonale')
            crescita_professionale = request.form.get('crescita_professionale')

            # Controlla se tutti i campi richiesti sono stati riempiti
            if all([recensione, salario, sicurezza_sul_lavoro, benessere_mentale, orario_flessibile, rapporto_interpersonale, crescita_professionale, benefit_aziendali]):
                try:
                    # Inserisci la recensione nella tabella 'recensione'
                    cur.execute("""
                        INSERT INTO recensione 
                        (testo, salario, sicurezza_sul_lavoro, benessere_mentale, orario_flessibile, rapporto_interpersonale, crescita_professionale, benefit_aziendali, id_azienda)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """, (recensione, salario, sicurezza_sul_lavoro, benessere_mentale, orario_flessibile, rapporto_interpersonale, crescita_professionale, benefit_aziendali, azienda[0]))
                    conn.commit()

                    # Ottieni l'ID della recensione appena inserita
                    recensione_id = cur.lastrowid
                    if recensione_id:
                        # Inserisci l'associazione tra dipendente e recensione
                        cur.execute("""
                            INSERT INTO dipendente_recensione (id_dipendente, id_recensione)
                            VALUES ((SELECT id FROM dipendente WHERE username = %s), %s)
                        """, (session['username'], recensione_id))
                        conn.commit()

                        # Calcola le nuove medie per la valutazione complessiva
                        cur.execute("""
                            SELECT AVG (salario), AVG(orario_flessibile), AVG(benefit_aziendali), AVG(sicurezza_sul_lavoro), AVG(benessere_mentale), AVG(rapporto_interpersonale), AVG(crescita_professionale)
                            FROM recensione
                            WHERE id_azienda = %s;
                        """, (azienda[0],))
                        res_medie = cur.fetchone()
                        nuova_media = round(sum(res_medie) / len(res_medie), 1)

                        # Aggiorna la valutazione dell'azienda
                        cur.execute("""
                            UPDATE azienda
                            SET valutazione = %s
                            WHERE id = %s
                        """, (nuova_media, azienda[0]))
                        conn.commit()
                    else:
                        flash('Errore durante l\'inserimento della recensione.', 'danger')

                except mysql.connector.Error as err:
                    # Gestione degli errori SQL
                    print(f"Errore SQL: {err}")  # Log dell'errore
                    flash(f"Errore durante l'invio della recensione: {err}", "danger")

            else:
                flash('Per favore, compila tutti i campi richiesti.', 'danger')

        cur.close()
        conn.close()

        return render_template('dipendente_menu.html', azienda=azienda)
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
