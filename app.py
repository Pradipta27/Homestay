from flask import Flask, render_template, request, redirect, url_for
from mysql import connector
from datetime import datetime

app = Flask(__name__)
db = connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="rebahan-homestay"
)

if db.is_connected():
    print('berhasil terhubung ke database')


@app.route('/')
def halaman_utama():
    return render_template('index.html')


@app.route('/booking')
def booking():
    return render_template('books.html')


@app.route('/booking/', methods=['POST'])
def proses_booking():
    global bayar
    guestEmail = request.form['guestEmail']
    guestName = request.form['guestName']
    guestContact = request.form['guestContact']
    cur = db.cursor()
    cur.execute('insert into guest (guestEmail, guestName, guestContact) values (%s, %s, %s)',
                (guestEmail, guestName, guestContact))
    db.commit()
    roomId = request.form['roomId']
    checkIn = request.form['checkIn']
    checkOut = request.form['checkOut']
    checkin1 = datetime.strptime(checkIn, '%Y-%m-%d')
    checkout1 = datetime.strptime(checkOut, '%Y-%m-%d')
    total_harga = ((checkout1 - checkin1).days)
    if roomId == 'A1':
        bayar=total_harga * 400000
    if roomId == 'A2':
        bayar=total_harga * 350000
    if roomId == 'B1':
        bayar = total_harga * 250000
    if roomId == 'B2':
        bayar = total_harga * 300000
    if roomId == 'C1':
        bayar = total_harga * 125000
    if roomId == 'C2':
        bayar = total_harga * 170000
    cur2 = db.cursor()
    cur2.execute('insert into booking (roomId, dateFrom, dateTo, total_price) values (%s, %s, %s, %s)',
                 (roomId, checkIn, checkOut, bayar))
    db.commit()
    return redirect(url_for('redirectlur'))


@app.route('/redirect')
def redirectlur():
    cur = db.cursor()
    cur.execute(" select * from guest order by guestId DESC limit 1 ")
    res = cur.fetchall()
    cur2 = db.cursor()
    cur2.execute(" select * from booking order by bookId DESC limit 1 ")
    res2 = cur2.fetchall()
    return render_template('redirect.html', hasil=res, hasil2=res2)


if __name__ == '__main__':
    app.run()
