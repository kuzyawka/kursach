from werkzeug.security import generate_password_hash, check_password_hash
from flask import Flask, render_template, url_for, request, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////zoo.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

with app.app_context():
    db.create_all()


class Article(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    intro = db.Column(db.String(300), nullable=False)
    title = db.Column(db.String(100), nullable=False)
    text = db.Column(db.Text, nullable=False)
    date = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return '<Article %r>' % self.username


class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(50), nullable=True)
    psw = db.Column(db.String(500), nullable=True)
    date = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f"<users {self.id}>"


class Profiles(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=True)
    old = db.Column(db.Integer)
    city = db.Column(db.String(100))
    anim = db.Column(db.String(50), nullable=True)
    text = db.Column(db.Text, nullable=False)

    user_id = db.Column(db.Integer, db.ForeignKey('users.id')) #внешний ключ, определяет связь в записях между таблицей профайлз и юзерз

    def __repr__(self):
        return f"<Profiles {self.id}>"


@app.route('/')
@app.route('/home')
def index():
    return render_template("index.html")


@app.route('/about')
def about():
    articles = Article.query.order_by(Article.date.desc()).all()

    return render_template("about.html", articles=articles)


@app.route('/about/<int:id>')
def about_det(id):
    article = Article.query.get(id)

    return render_template("about_det.html", article=article)


@app.route('/about/<int:id>/del')
def about_delete(id):
    article = Article.query.get_or_404(id) #значит если не будет найдена запись по айди, то вызовется ошибка 404

    try:
        db.session.delete(article)
        db.session.commit()
        return redirect('/about')
    except:
        return "При удалении статьи произошла ошибка"


@app.route('/about/<int:id>/update', methods=['POST', 'GET'])
def post_update(id):
    article = Article.query.get(id)
    if request.method == "POST":
        article.title = request.form['title']
        article.intro = request.form['intro']
        article.text = request.form['text']

        try:
            db.session.commit()
            return redirect('/about')
        except:
            return "При редактировании статьи произошла ошибка"
    else:
         return render_template("about_update.html", article=article)


@app.route('/create_article', methods=['POST', 'GET'])
def create_article():
    if request.method == "POST":
        title = request.form['title']
        intro = request.form['intro']
        text = request.form['text']

        article = Article(title= title, intro = intro, text=text)

        try:
            db.session.add(article)
            db.session.commit()
            return redirect('/about')
        except:
            return "При добавлени статьи произошла ошибка"
    else:
         return render_template("create_article.html")


#@app.route('/tickets')
#def tickets():
#    return render_template("tickets.html")


@app.route('/tickets', methods=['POST', 'GET'])
def tickets():
    if request.method == "POST":
        #title = request.form['title']
        #intro = request.form['intro']
        #text = request.form['text']

        #article = Article(title=title, intro=intro, text=text)

        try:
            hash = generate_password_hash(request.form['psw'])
            u = Users(email=request.form['email'], psw=hash)
            db.session.add(u)
            db.session.flush()

            p = Profiles(name=request.form['name'], old = request.form['old'],
                        city=request.form['city'], anim=request.form['anim'], text=request.form['text'],
                        user_id =u.id)  #сюда передаем предыдущую запись
            db.session.add(p)
            db.session.commit()

        except:
            db.session.rollback()
            print ("При регистрации произошла ошибка")

    return render_template("tickets.html")


@app.route('/user/<string:name>/<int:id>')
def user(name, id):
    return "User page: " + name + " - " + str(id)


if __name__ == "__main__":
    app.run(debug=True)
