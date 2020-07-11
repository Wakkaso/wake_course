import inspect
import json
import os

from datetime import datetime
from dateutil import parser
from functools import wraps

from flask import (Flask, abort, jsonify, redirect, g,
                   render_template as flast_render_template,
                   request, send_from_directory, session)
from sqlalchemy import text
from werkzeug.security import check_password_hash, generate_password_hash

import config
import db
import utils

app = Flask(__name__)
app.secret_key = config.FLASK_SECRET_KEY
db.connect()


def render_template(*args, **argv):
    fields = []
    query = (g.session
              .query(db.models.field.id,
                     db.models.field.name,
                     db.models.field.alias,
                     db.models.field.iframe,
                     db.models.user_access.is_active)
              .select_from(db.models.field)
              .join(db.models.user_access)
              .join(db.models.user)
              .filter(db.models.user.username == session.get('username'))
              .order_by(db.models.user_access.id)
              .all())
    for id, name, alias, iframe, is_active in query:
        field_data = {
            'id': id,
            'name': name,
            'alias': alias,
            'iframe': iframe.replace('{username}', session.get('username')),
            'is_active': 1 & is_active,
            'sensors': []
        }
        for sensor in (g.session
                        .query(db.models.field_sensor)
                        .filter(db.models.field_sensor.field == id)
                        .order_by(db.models.field_sensor.id)
                        .all()):
            field_data['sensors'].append(utils.row2dict(sensor))
        fields.append(field_data)

    user = (g.session
             .query(db.models.user)
             .filter(db.models.user.username == session.get('username'))
             .first())

    return flast_render_template(*args,
                                 fields=fields,
                                 username=session.get('username'),
                                 is_superuser=session.get('is_superuser'),
                                 memo=user.memo,
                                 **argv)


def render_demo_template(*args, **argv):
    target_field = argv.get('field')
    if not target_field:
        abort(404)

    field_record = (g.session
                     .query(db.models.field)
                     .filter(db.models.field.name == target_field)
                     .first())
    if not field_record:
        abort(404)

    sensors = []
    sensor_records = (g.session
                       .query(db.models.field_sensor)
                       .filter(db.models.field_sensor.field == field_record.id)
                       .order_by(db.models.field_sensor.id)
                       .all())
    for sensor in sensor_records:
        sensors.append(utils.row2dict(sensor))

    return flast_render_template(*args,
                                 fieldname=target_field,
                                 sensors=sensors,
                                 **argv)


def required_login(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get('username'):
            return f(*args, **kwargs)
        else:
            next_url = request.path
            return redirect('/login?next=' + next_url)
    return decorated_function


def required_superuser(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get('username'):
            if session.get('is_superuser'):
                return f(*args, **kwargs)
            else:
                abort(403)
        else:
            next_url = request.path
            return redirect('/login?next=' + next_url)
    return decorated_function


@app.errorhandler(404)
def not_found(error):
    return 'Not Found.', 404


@app.errorhandler(500)
def server_error(error):
    return 'Server error', 500


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        user = (g.session
                 .query(db.models.user)
                 .filter(db.models.user.username == username)
                 .first())

        if user and check_password_hash(user.password, password):
            session['username'] = user.username
            session['id'] = user.id
            session['is_superuser'] = user.is_superuser

            return redirect(request.args.get('next', '/'))
        else:
            return flast_render_template('login.html',
                                         msg='username or password is wrong.')

    if session.get('username'):
        return redirect(request.args.get('next', '/'))

    return flast_render_template('login.html')


@app.route('/logout')
def logout():
    if session.get('username'):
        del session['username']

    if session.get('id'):
        del session['id']

    if session.get('is_superuser'):
        del session['is_superuser']

    return redirect('/')


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico',
                               mimetype='image/vnd.microsoft.icon')


@app.route('/', methods=['GET'])
@required_login
def index():
    return render_template('dashboard.html')


@app.route('/demo/<string:field>', methods=['GET'])
def demo(field):
    token = request.args.get('token')
    if token != config.demo_token.get(field):
        abort(404)
    return render_demo_template('demo.html', field=field, token=token)


@app.route('/history', methods=['GET'])
@required_login
def history():
    return render_template('history.html')


@app.route('/demo/h/<string:field>', methods=['GET'])
def demo_history(field):
    token = request.args.get('token')
    if token != config.demo_token.get(field):
        abort(404)
    return render_demo_template('demo_history.html', field=field, token=token)


@app.route('/compare', methods=['GET'])
@required_login
def compare_():
    return render_template('compare.html')


@app.route('/profile', methods=['GET'])
@required_login
def profile():
    return render_template('profile.html')


@app.route('/management', methods=['GET'])
@required_superuser
def management():
    return render_template('management.html')


@app.route('/api/demo/datas/<string:field>', methods=['GET'])
def api_query_demo_data(field):
    token = request.args.get('token')
    if token != config.demo_token.get(field):
        abort(404)

    stime = datetime.now()

    res = {}

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    query_df = (g.session
                 .query(db.models.field_sensor.df_name,
                        db.models.field_sensor.field)
                 .select_from(db.models.field_sensor)
                 .join(db.models.sensor)
                 .join(db.models.field)
                 .filter(db.models.field.name == field)
                 .all())

    for df_name, field_id in query_df:
        tablename = df_name.replace('-O', '')
        table = getattr(db.models, tablename)
        query = g.session.query(table).filter(table.field == field_id)
        if start and end:
            query = query.filter(table.timestamp >= start, table.timestamp <= end)
        query = query.order_by(table.timestamp.desc()).limit(limit).all()

        res.update({df_name: [(str(record.timestamp), record.value) for record in query]})

    etime = datetime.now()
    print((etime - stime).total_seconds())
    return jsonify(res)


@app.route('/datas/<string:field>', methods=['GET'])
@required_login
def api_query_all_data(field):
    stime = datetime.now()

    res = {}

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    query_df = (g.session
                 .query(db.models.field_sensor.df_name,
                        db.models.field_sensor.field)
                 .select_from(db.models.field_sensor)
                 .join(db.models.sensor)
                 .join(db.models.field)
                 .filter(db.models.field.name == field)
                 .all())

    for df_name, field_id in query_df:
        tablename = df_name.replace('-O', '')
        table = getattr(db.models, tablename)
        query = g.session.query(table).filter(table.field == field_id)
        if start and end:
            query = query.filter(table.timestamp >= start, table.timestamp <= end)
        query = query.order_by(table.timestamp.desc()).limit(limit).all()

        res.update({df_name: [(str(record.timestamp), record.value) for record in query]})

    etime = datetime.now()
    print((etime - stime).total_seconds())
    return jsonify(res)


@app.route('/api/demo/datas/<string:field>/<string:df_name>', methods=['GET'])
def api_query_demo_history_data(field, df_name):
    token = request.args.get('token')
    if token != config.demo_token.get(field):
        abort(404)

    stime = datetime.now()

    tablename = df_name.replace('-O', '')
    if not hasattr(db.models, tablename):
        abort(404)
    table = getattr(db.models, tablename)

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    query = (g.session
              .query(table)
              .select_from(table)
              .join(db.models.field)
              .filter(db.models.field.name == field))
    if start and end:
        query = query.filter(table.timestamp >= start, table.timestamp <= end)
    query = query.order_by(table.timestamp.desc()).limit(limit).all()

    res = {df_name: [(str(record.timestamp), record.value) for record in query]}

    etime = datetime.now()
    print((etime - stime).total_seconds())
    return jsonify(res)


@app.route('/datas/<string:field>/<string:df_name>', methods=['GET'])
@required_login
def api_query_field_data(field, df_name):
    stime = datetime.now()

    tablename = df_name.replace('-O', '')
    if not hasattr(db.models, tablename):
        abort(404)
    table = getattr(db.models, tablename)

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    query = (g.session
              .query(table)
              .select_from(table)
              .join(db.models.field)
              .filter(db.models.field.name == field))
    if start and end:
        query = query.filter(table.timestamp >= start, table.timestamp <= end)
    query = query.order_by(table.timestamp.desc()).limit(limit).all()

    res = {df_name: [(str(record.timestamp), record.value) for record in query]}

    etime = datetime.now()
    print((etime - stime).total_seconds())
    return jsonify(res)


@app.route('/api/datas', methods=['GET'])
@required_login
def api_datas():
    '''
    :args f1: field, like `flower`, `orange`, etc
    :args f2: field, like `flower`, `orange`, etc
    :args s1: sensor, like `AtPressure`, `UV1`, etc
    :args s2: sensor, like `AtPressure`, `UV1`, etc
    :args st: start_time, any time format
    :args et: end_time, any time format
    :args i: interval, only allow `second`, `minute`, `hour`, `day`, default `hour`
    :args l: limit, query limit, default config.QUERY_LIMIT

    example:
        http://your.domain/api/datas?f1=flower&f2=orange&s1=Temperature&s2=AtPressure&st=2018-06-26&et=2018-06-27&i=second
    '''
    stime = datetime.now()

    field1 = request.args.get('f1')
    sensor1 = request.args.get('s1')
    start_time = request.args.get('st')
    end_time = request.args.get('et')
    interval = request.args.get('i', 'hour')
    limit = int(request.args.get('l')) if request.args.get('l') else None

    if not field1 or not sensor1 or not start_time or not end_time:
        abort(404)

    tablename1 = sensor1.replace('-O', '')
    if not hasattr(db.models, tablename1):
        abort(404)

    table1 = getattr(db.models, tablename1)
    start = parser.parse(start_time).strftime('%Y-%m-%d %H:%M:%S')
    end = parser.parse(end_time).strftime('%Y-%m-%d %H:%M:%S')

    result = {sensor1: {}}

    data1 = _query_data(interval, table1.__tablename__, field1, start, end, limit)
    result[sensor1].update({field1: data1})

    field2 = request.args.get('f2')
    if field2:
        sensor2 = request.args.get('s2')
        tablename2 = sensor2.replace('-O', '')
        table2 = getattr(db.models, tablename2)
        if not result.get(sensor2):
            result[sensor2] = {}
        data2 = _query_data(interval, table2.__tablename__, field2, start, end, limit)
        result[sensor2].update({field2: data2})

    etime = datetime.now()
    print((etime - stime).total_seconds())
    return jsonify(result)


@app.route('/api/export_datas', methods=['GET'])
@required_login
def api_export_datas():
    '''
    :args f: field, like `flower`, `orange`, etc
    :args s: sensor, like `AtPressure`, `UV1`, etc
    :args st: start_time, any time format
    :args et: end_time, any time format
    :args i: interval, only allow `second`, `minute`, `hour`, `day`, default `hour`
    :args l: limit, query limit, default config.QUERY_LIMIT

    example:
        http://your.domain/api/export_datas?f=flower&s=Temperature&st=2018-06-26&et=2018-06-27&i=second
    '''
    stime = datetime.now()

    field = request.args.get('f')
    sensor = request.args.get('s')
    start_time = request.args.get('st')
    end_time = request.args.get('et')
    interval = request.args.get('i', 'hour')
    limit = int(request.args.get('l')) if request.args.get('l') else None

    if not field or not sensor or not start_time or not end_time:
        abort(404)

    tablename = sensor.replace('-O', '')
    if not hasattr(db.models, tablename):
        abort(404)

    table = getattr(db.models, tablename)
    start = parser.parse(start_time).strftime('%Y-%m-%d %H:%M:%S')
    end = parser.parse(end_time).strftime('%Y-%m-%d %H:%M:%S')

    raw_data = _query_data(interval, table.__tablename__, field, start, end, limit)

    content = 'datetime,value\n'

    for data in raw_data[::-1]:
        if interval == 'second':
            content += '{},{}\n'.format(data['timestamp'],
                                        data['value'])
        elif interval == 'minute':
            content += '{} {}:{}:00,{}\n'.format(data['date'],
                                                 data['hour'],
                                                 data['minute'],
                                                 data['value'])
        elif interval == 'hour':
            content += '{} {}:00:00,{}\n'.format(data['date'],
                                                 data['hour'],
                                                 data['value'])
        elif interval == 'day':
            content += '{} 00:00:00,{}\n'.format(data['date'],
                                                 data['value'])
    etime = datetime.now()
    print((etime - stime).total_seconds())
    return content


def _query_data(interval, table_name, field, start, end, limit):
    raw_sql = _get_mysql_raw_sql(interval, table_name, field, start, end, limit)
    query = g.session.execute(raw_sql).fetchall()

    datas = []
    for row in query:
        data = {}
        for key in row.keys():
            data[key] = str(row[key])
        datas.append(data)

    return datas


def _get_mysql_raw_sql(interval, table_name, field, start, end, limit):
    if interval == 'second':
        raw_sql = text('''
            SELECT sensor.timestamp, sensor.value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            ORDER BY sensor.timestamp DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'minute':
        raw_sql = text('''
            SELECT MINUTE(sensor.timestamp) as minute,
                   HOUR(sensor.timestamp) AS hour,
                   DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY minute, hour, date
            ORDER BY date DESC, hour DESC, minute DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'hour':
        raw_sql = text('''
            SELECT HOUR(sensor.timestamp) AS hour,
                   DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY hour, date
            ORDER BY date DESC, hour DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'day':
        raw_sql = text('''
            SELECT DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY date
            ORDER BY date DESC
        '''.format(table_name, field, start, end, limit))
    else:
        abort(404)

    if limit:
        raw_sql += 'LIMIT {}'.format(limit)

    return raw_sql


@app.route('/api/user/pwd', methods=['POST'])
@required_login
def api_user_change_pwd():
    user_id = session.get('id')
    old_password = request.json.get('old_password')
    new_password = request.json.get('new_password')

    if not new_password:
        return 'new password should be given.', 404

    user = g.session.query(db.models.user).filter(db.models.user.id == user_id).first()

    if not user:
        return 'Who are you?', 404

    if not check_password_hash(user.password, old_password):
        return 'Old passwrod not match.', 404

    user.password = generate_password_hash(new_password)
    g.session.commit()

    return 'ok'


@app.route('/api/user/memo', methods=['POST'])
@required_login
def api_user_update_memo():
    if request.method != 'POST':
        abort(404)

    user_id = session.get('id')
    if not user_id:
        abort(404)

    memo = request.json.get('memo')
    g.session.query(db.models.user).filter(db.models.user.id == user_id).update({'memo': memo})
    g.session.commit()

    return 'ok'

@app.route('/api/user', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_superuser
def api_user():
    if request.method == 'GET':
        # Read user
        # GET /api/user[?id=<id>&username=<username>]
        users = []

        query = g.session.query(db.models.user)
        for key, value in request.args.items():
            attr = getattr(db.models.user, key, None)
            if attr:
                query = query.filter(attr == value)
        query = query.order_by(db.models.user.id).all()

        for user in query:
            query_access = (g.session
                             .query(db.models.field, db.models.user_access)
                             .select_from(db.models.user_access)
                             .join(db.models.field)
                             .filter(db.models.user_access.user == user.id)
                             .order_by(db.models.user_access.id)
                             .all())
            access = []
            active = None
            for field, acc in query_access:
                access.append(utils.row2dict(field))
                if acc.is_active:
                    active = acc.field

            users.append({
                'id': user.id,
                'username': user.username,
                'is_superuser': user.is_superuser,
                'access': access,
                'active': active
            })
        return json.dumps(users)
    elif request.method == 'POST':
        # Create user
        # POST /api/user
        # {username:<username>, password:<password>, is_superuser:<is_superuser>}
        username = request.json.get('username')
        password = generate_password_hash(request.json.get('password'))
        is_superuser = request.json.get('is_superuser')
        access = request.json.get('access', [])
        active = request.json.get('active')

        new_user = db.models.user(username=username,
                                  password=password,
                                  is_superuser=is_superuser)
        g.session.add(new_user)
        g.session.commit()

        for field in access:
            new_access = db.models.user_access(user=new_user.id, field=field.get('id'))
            if field.get('id') == active:
                new_access.is_active = True
            g.session.add(new_access)
        g.session.commit()

        return json.dumps(utils.row2dict(new_user))
    elif request.method == 'PUT':
        # Update user
        # PUT /api/user
        # {id:<id>, username:<username>, is_superuser:<is_superuser>}
        id_ = request.json.get('id')
        username = request.json.get('username')
        is_superuser = request.json.get('is_superuser')
        access = request.json.get('access', [])
        active = request.json.get('active')

        (g.session
          .query(db.models.user)
          .filter(db.models.user.id == id_)
          .update({'username': username,
                   'is_superuser': is_superuser}))
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.user == id_)
          .delete())
        for field in access:
            new_access = db.models.user_access(user=id_, field=field.get('id'))
            if field.get('id') == active:
                new_access.is_active = True
            g.session.add(new_access)
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete user
        # DELETE /api/user?id=<id>
        id_ = request.args.get('id')
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.user == id_)
          .delete())
        (g.session
          .query(db.models.user)
          .filter(db.models.user.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)


@app.route('/api/sensor', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_superuser
def api_sensor():
    if request.method == 'GET':
        # Read sensor
        # GET /api/sensor
        sensors = g.session.query(db.models.sensor).order_by(db.models.sensor.id).all()
        return json.dumps([utils.row2dict(sensor) for sensor in sensors])
    elif request.method == 'POST':
        # Create sensor
        # POST /api/sensor
        # {name:<string>, df_name:<string>, alias:<string>, unit:<string>,
        #  icon:<string>, bg_color:<string>}
        df_name = request.json.get('df_name')
        if not df_name:
            return 'No df_name'
        if not request.json.get('name'):
            return 'No name'

        new_sensor = db.models.sensor(df_name=df_name,
                                      name=request.json.get('name'),
                                      alias=request.json.get('alias'),
                                      unit=request.json.get('unit'),
                                      icon=request.json.get('icon'),
                                      bg_color=request.json.get('bg_color'))
        g.session.add(new_sensor)
        g.session.commit()

        db.inject_new_model(df_name.replace('-O', ''))

        return json.dumps(utils.row2dict(new_sensor))
    elif request.method == 'PUT':
        # Update sensor
        # PUT /api/sensor
        # {id:<int>, name:<string>, df_name:<string>, alias:<string>,
        #  unit:<string>, icon:<string>, bg_color:<string>}
        id_ = request.json.get('id')
        (g.session
          .query(db.models.sensor)
          .filter(db.models.sensor.id == id_)
          .update(request.json))
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete sensor
        # DELETE /api/sensor?id=<id>
        id_ = request.args.get('id')
        (g.session
          .query(db.models.sensor)
          .filter(db.models.sensor.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)


@app.route('/api/field', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_superuser
def api_field():
    if request.method == 'GET':

        fields = []
        query_fields = (g.session
                         .query(db.models.field)
                         .order_by(db.models.field.id)
                         .all())

        for field in query_fields:
            temp_field = utils.row2dict(field)
            query_field_sensor = (g.session
                                   .query(db.models.sensor.name,
                                          db.models.field_sensor.sensor,
                                          db.models.field_sensor.df_name,
                                          db.models.field_sensor.alias,
                                          db.models.field_sensor.unit,
                                          db.models.field_sensor.icon,
                                          db.models.field_sensor.bg_color,
                                          db.models.field_sensor.alert_min,
                                          db.models.field_sensor.alert_max)
                                   .select_from(db.models.field_sensor)
                                   .join(db.models.sensor)
                                   .filter(db.models.field_sensor.field == field.id)
                                   .order_by(db.models.field_sensor.id)
                                   .all())
            temp_field['sensors'] = []
            for sensor in query_field_sensor:
                temp_sensor = {
                    'name': sensor.name,
                    'sensor': sensor.sensor,
                    'df_name': sensor.df_name,
                    'alias': sensor.alias,
                    'unit': sensor.unit,
                    'icon': sensor.icon,
                    'bg_color': sensor.bg_color,
                    'alert_min': sensor.alert_min,
                    'alert_max': sensor.alert_max,
                }
                temp_field['sensors'].append(temp_sensor)
            fields.append(temp_field)

        return json.dumps(fields)
    elif request.method == 'POST':
        # Create field
        # POST /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        if not request.json.get('name'):
            return 'No field name'

        new_field = db.models.field(name=request.json.get('name'),
                                    alias=request.json.get('alias'),
                                    iframe=request.json.get('iframe', ''))
        g.session.add(new_field)
        g.session.commit()

        for sensor in request.json.get('sensors', []):
            new_sensor = db.models.field_sensor(
                field=new_field.id,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'),
                alert_min=sensor.get('alert_min'),
                alert_max=sensor.get('alert_max'))
            g.session.add(new_sensor)
            g.session.commit()

        return json.dumps(utils.row2dict(new_field))
    elif request.method == 'PUT':
        # Update field
        # PUT /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        print(request.json)
        id_ = request.json.get('id')
        name = request.json.get('name')
        alias = request.json.get('alias')
        iframe = request.json.get('iframe', '')
        sensors = request.json.get('sensors', [])

        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .update({'name': name,
                   'alias': alias,
                   'iframe': iframe}))
        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())
        for sensor in sensors:
            df_name = sensor.get('df_name')
            db.inject_new_model(df_name.replace('-O', ''))

            new_sensor = db.models.field_sensor(
                field=id_,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'),
                alert_min=sensor.get('alert_min'),
                alert_max=sensor.get('alert_max'))
            new_sensor.field = id_
            new_sensor.id = None
            g.session.add(new_sensor)
            g.session.commit()
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete field
        # DELETE /api/field?id=<id>
        id_ = request.args.get('id')

        for attr in db.models.__dict__.values():
            if inspect.isclass(attr) and hasattr(attr, 'timestamp'):
                (g.session
                  .query(attr)
                  .filter(attr.field == id_)
                  .delete())
        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.field == id_)
          .delete())
        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)


###############################################################################


@app.before_request
def before_request():
    g.session = db.get_session()


@app.teardown_request
def teardown_request(exception):
    session = getattr(g, 'session', None)
    if session is not None:
        session.close()


@app.after_request
def add_header(r):
    """
    Add no cache header.

    Add headers to both force latest IE rendering engine or Chrome Frame,
    and not cache anything.
    """
    r.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    r.headers["Pragma"] = "no-cache"
    r.headers["Expires"] = "0"
    r.headers['Cache-Control'] = 'public, max-age=0'
    return r


def main():
    app.run('0', port=7788,  debug=config.DEBUG, threaded=True)

if __name__ == '__main__':
    main()
