from flask import Flask, render_template, request, session, redirect
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from werkzeug.utils import secure_filename
from datetime import datetime
import json
import os
import math

with open("config.json", 'r') as c:
    params = json.load(c)['params']

app = Flask(__name__)
app.secret_key = 'super secret key'
app.config['UPLOAD_FOLDER']=params['upload_path']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT=465,
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password'])
mail = Mail(app)

# if params['local_server']:
#     app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
# else:
#     app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://pyidfsdxdumxud:0ff71550978cf8de3e9dc0c8f519f6f44d39a6e9313e6a5f91c740fde7198e01@ec2-34-195-233-155.compute-1.amazonaws.com:5432/d4agmi32hmi56r"

# db = SQLAlchemy(app)
db.init_app(app)
migrate = Migrate(app, db)
SQLALCHEMY_TRACK_MODIFICATIONS = False


class contact_tb(db.Model):

    snum = db.Column(db.Integer, primary_key=True)
    date_time = db.Column(db.Integer)
    name = db.Column(db.String(30), nullable=True)
    email = db.Column(db.String(30), nullable=True, unique=True)
    phone = db.Column(db.String(13), unique=True, nullable=True)
    message = db.Column(db.String(120), nullable=True)


class post_tb(db.Model):

    post_id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30))
    subheading = db.Column(db.String(40))
    posted_by = db.Column(db.String(30))
    date = db.Column(db.Integer)
    img_file = db.Column(db.String(20))
    slug = db.Column(db.String(20), nullable=True, unique=True)


class post_content_tb(db.Model):

    snum = db.Column(db.Integer, primary_key=True)
    heading = db.Column(db.String(150))
    paragraph = db.Column(db.String(3000))
    list_items = db.Column(db.String(800))
    slug = db.Column(db.String(30), foreign_key=True)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/')
def home():

    posts = post_tb.query.filter_by().all()
    page=request.args.get('page')
    last=math.ceil(len(posts)/params['num_of_post'])
    if (not str(page).isnumeric()):
        page=1

    page=int(page)
    posts=posts[(page-1)*params["num_of_post"] : (page-1)*params["num_of_post"]+params["num_of_post"]]
    if page==1:
        newest='#'
        older='/?page='+str(page+1)

    elif page==last:
        newest='/?page='+str(page-1)
        older='#'

    else:
        newest='/?page='+str(page-1)
        older='/?page='+str(page-1)


    return render_template('index.html', params=params, posts=posts,newest=newest,older=older)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    posts = post_tb.query.all()
    if 'user' in session and session['user'] == params['admin_username']:
        return render_template('dashboard.html', params=params, posts=posts)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('pass')
        if params["admin_username"] == username and params["admin_password"] == password:
            session['user'] = username
            return render_template('dashboard.html', params=params, posts=posts)
    return render_template('login.html', params=params)


@app.route('/edit/<string:slug>', methods=['GET', 'POST'])
def edit(slug):

    posts = post_tb.query.all()
    posts_content = post_content_tb.query.all()
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            box_subheading = request.form.get('subheading')
            box_date = request.form.get('date')
            box_img_file = request.form.get('img_file')
            box_posted_by = request.form.get('posted_by')
            box_slug = request.form.get('slug')
            box_heading = request.form.get('heading')
            box_paragraph = request.form.get('paragraph')
            box_list_items = request.form.get('list_items')

            if slug == 'add_post':
                post_entry = post_tb(title=box_title, subheading=box_subheading, date=box_date,
                                     img_file=box_img_file, posted_by=box_posted_by, slug=box_slug)
                db.session.add(post_entry)
                db.session.commit()
                content_entry = post_content_tb(
                    heading=box_heading, paragraph=box_paragraph, list_items=box_list_items, slug=box_slug)
                db.session.add(content_entry)
                db.session.commit()

            else:
                posts = post_tb.query.filter_by(slug=slug).first()
                posts_content = post_content_tb.query.filter_by(
                    slug=slug).first()
                posts.title = box_title
                posts.subheading = box_subheading
                posts.posted_by = box_posted_by
                posts.date = box_date
                posts.img_file = box_img_file
                posts.slug = box_slug
                db.session.commit()
                posts_content.heading = box_heading
                posts_content.paragraph = box_paragraph
                posts_content.list_items = box_list_items
                posts_content.slug = box_slug
                db.session.commit()
                return redirect('/edit/'+slug)

        posts = post_tb.query.filter_by(slug=slug).first()
        posts_content = post_content_tb.query.filter_by(slug=slug).first()

        return render_template('edit.html', posts=posts, params=params, posts_content=posts_content)

@app.route('/delete/<string:slug>',methods=['GET','POST'])
def delete (slug):
    if 'user' in session and session['user']==params['admin_username']:
        content=post_content_tb.query.filter_by(slug=slug).first()
        db.session.delete(content)
        db.session.commit()
        post=post_tb.query.filter_by(slug=slug).first()
        db.session.delete(post)
        db.session.commit()
        return redirect ('/dashboard')

@app.route('/uploader',methods=['GET','POST'])
def uploader():
    if 'user' in session and params['admin_username']==session['user']:
        if request.method=='POST':
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded Successfully"
    

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    posts = post_tb.query.filter_by(slug=post_slug).first()
    post_content = post_content_tb.query.filter_by(slug=post_slug).all()
    return render_template('post.html', params=params, posts=posts, post_content=post_content)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    error = None
    if request.method == 'POST':

        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone_num')
        message = request.form.get('message')

        if not name or not name.strip():
            error = 'name is missing'
        if not email or not email.strip() or '@' not in email:
            error = 'email is missing'
        if not message or not message.strip():
            error = 'message is missing'
        if (len(phone) == 10 and phone.isdigit) or (len(phone) == 13 and (phone[0] == '+' and phone[1:].isdigit)):
            pass
        else:
            error = 'Phone Number is missing'
        if not error:
            entry = contact_tb(name=name, date_time=datetime.now(
            ), email=email, phone=phone, message=message)
            db.session.add(entry)
            db.session.commit()

            # Send mail to The Admin
            mail.send_message('New Message from '+name, sender='Satyam',
                              recipients=[params['gmail-user']], body=message+'\n'+phone)
            # Send mail to The User
            mail.send_message('Welcome To The Coding Legend ', sender='Admin', recipients=[
                              email], body="Hello "+name+',\n\nThanks for contacting us! We will be in touch with you shortly. \n \nThanks Regards'+'\n'+'Admin Of The Coding Legend')

            return render_template('contact.html', params=params)

    return render_template('contact.html', params=params, error=error)


if __name__ == '__main__':
    app.run(debug=True)
