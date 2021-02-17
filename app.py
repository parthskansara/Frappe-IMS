
from flask import Flask, render_template, request
import pymysql

app = Flask(__name__)

class Database: 
    def __init__(self):
        host = "127.0.0.1"
        user = "root"
        password = "admin"
        db = "IMS"
        self.con = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
        self.cur = self.con.cursor()
        
    def balance(self):
        self.cur.execute("CALL IMS.SHOW_bal();")
        result = self.cur.fetchall()
        return result
    
    def product(self):
        self.cur.execute("CALL IMS.SHOW_p();")
        result = self.cur.fetchall()
        return result
    
    def location(self):
        self.cur.execute("CALL IMS.SHOW_l();")
        result = self.cur.fetchall()
        return result
    
    def pm(self):
        self.cur.execute("CALL IMS.SHOW_pm();")
        result = self.cur.fetchall()
        return result
    
    def report(self):
        self.cur.execute("CALL IMS.SHOW_bal();")
        result = self.cur.fetchall()
        return result

@app.route("/home")
def main():
    return render_template('index.html') 

@app.route("/product", methods = ['GET', 'POST'])
def func():
    db = Database()
    result = db.product()
    if request.method == 'POST':
        pdetails = request.form
        pid= pdetails['pid']
        db.cur.execute("INSERT INTO IMS.PRODUCT VALUES (%s)",(pid))
        db.con.commit()
        db.cur.close()
        return render_template('product.html', x = "Value Entered! Please click Refresh below", result=result)
    return render_template('product.html', result=result) 

@app.route("/location", methods = ['GET', 'POST'])
def func1():
    db = Database()
    result = db.location()
    if request.method == 'POST':
        pdetails = request.form
        lid= pdetails['lid']
        db.cur.execute("INSERT INTO IMS.LOCATION VALUES (%s)",(lid))
        db.con.commit()
        db.cur.close()
        return render_template('location.html', x = "Value Entered! Please click Refresh below", result=result)
    return render_template('location.html', result=result) 

@app.route("/pm", methods = ['GET', 'POST'])
def func2():
    db = Database()
    result = db.pm()
    if request.method == 'POST':
        pdetails = request.form
        mid= pdetails['mid']
        dt = pdetails['dt']
        fid = pdetails['fid']
        tid = pdetails['tid']
        pid = pdetails['pid']
        qt = pdetails['qt']
        db.cur.execute("INSERT INTO IMS.PRODUCTmovement VALUES (%s, %s, %s, %s, %s, %s)",(mid, dt, fid, tid, pid, qt))
        db.con.commit()
        db.cur.close()
        return render_template('product.html', x = "Value Entered! Please click Refresh below", result=result)
    return render_template('pm.html', result=result) 

@app.route("/report", methods = ['GET', 'POST'])
def func3():
    db = Database()
    result = db.report()
    return render_template('report.html', result=result) 

if __name__ == '__main__':
    app.run(debug=True)

