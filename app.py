from flask import Flask,render_template,request,redirect,url_for,flash
from mysql import connector

app = Flask(__name__)
db = connector.connect(
    host = "localhost",
    user = "root",
    passwd = "",
    database= "rebahan-homestay"
)
if db.is_connected():
    print('berhasil terhubung ke database')
#---------------------------------------------------------------------------------------------#
@app.route('/')
def halaman_utama():
    return render_template('index.html')

@app.route('/register')
def guestRegister():
    return render_template('tambah.html')

@app.route('/guest_tambah/', methods=['POST'])
def guest_register():
    guestId = request.form['guestId']
    guestPw = request.form['guestPw']
    guestName = request.form['guestName']
    guestContact = request.form['guestContact']
    cur = db.cursor()
    cur.execute('insert into guest (guestId, guestPw, guestName, guestContact) values (%s, %s, %s, %s)', (guestId, guestPw, guestName, guestContact))
    db.commit()
    return redirect(url_for('halaman_utama'))
if __name__ == '__main__':
    app.run()

@app.route('/guesttampil')
def guestTampil():
    cur = db.cursor()
    cur.execute("Select * from guest")
    res = cur.fetchall()
    cur.close()
    return render_template('GuestTampil.html',hasil=res)