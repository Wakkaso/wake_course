import json
import os
import sys

from importlib import reload

from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from werkzeug.security import generate_password_hash

import config
import models

engine = None


def connect():
    global engine

    if engine:
        return

    if config.DB_CONFIG.startswith('mysql'):
        args = {
            'pool_recycle': config.DB_POOL_RECYCLE,
            'pool_size': config.DB_POOL_SIZE,
            'max_overflow': 0
        }
    elif config.DB_CONFIG.startswith('sqlite'):
        args = {
            'pool_recycle': config.DB_POOL_RECYCLE,
        }
    else:
        args = {}

    engine = create_engine(config.DB_CONFIG, **args)
    models.base.metadata.create_all(engine)


def get_session():
    if not engine:
        connect()

    return Session(engine)


def clear():
    # TODO
    print('Not implement')


def inject_new_model(df_name):
    reload(models)
    if not df_name or hasattr(models, df_name):
        return

    code = '''
class {}(base):
    __tablename__ = '{}'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)
'''.format(df_name, df_name.lower())

    with open('models.py', 'a') as f:
        f.write(code)


def init(data):
    # TODO: seprate each insert to different function, supply single insert
    session = get_session()

    # insert user
    users = {}
    for user in data.get('user', []):
        user['password'] = generate_password_hash(user.get('password', ''))
        users[user.get('username')] = models.user(**user)
        session.add(users.get(user.get('username')))
        session.commit()

    # insert sensor
    sensors = {}
    for sensor in data.get('sensor', []):
        sensors[sensor.get('name')] = models.sensor(**sensor)
        session.add(sensors.get(sensor.get('name')))
        session.commit()

    # insert field
    fields = {}
    for field in data.get('field', []):
        name = field.get('name')
        alias = field.get('alias')
        fields[name] = models.field(name=name, alias=alias)
        session.add(fields.get(name))
        session.commit()

        field_id = fields.get(name).id
        for sensor in field.get('sensors', []):
            tmp_sensor = sensors.get(sensor.get('name'))
            field_sensor = models.field_sensor(
                field=field_id,
                sensor=tmp_sensor.id,
                df_name=sensor.get('df_name') or tmp_sensor.df_name,
                alias=sensor.get('alias') or tmp_sensor.alias,
                unit=sensor.get('unit') or tmp_sensor.unit,
                icon=sensor.get('icon') or tmp_sensor.icon,
                bg_color=sensor.get('bg_color') or tmp_sensor.bg_color
            )
            session.add(field_sensor)
            session.commit()

    # insert user access
    for access in data.get('user_access', []):
        user = users.get(access.get('user'))
        if not user:
            print('[user_access] not find user {}'.format(access.get('user')))
            continue
        accesses = access.get('accesses')
        active = access.get('active')
        for field_name in accesses:
            field = fields.get(field_name)
            user_access = models.user_access(
                user=user.id,
                field=field.id,
                is_active=(field_name == active)
            )
            session.add(user_access)
            session.commit()


if __name__ == '__main__':
    if len(sys.argv) > 1:
        if 'clear' == sys.argv[1]:
            clear()
        elif 'init' == sys.argv[1]:
            if len(sys.argv) > 2:
                default_file = sys.argv[2]
            else:
                default_file = os.path.join(os.path.dirname(__file__),
                                            'db_init.json')

            with open(default_file, 'r', encoding='utf8') as f:
                init(json.load(f))

    else:
        print('usage: python db.py init [import_file]')
