import time

from threading import Thread

import db

from DAN import DAN
from config import CSM_HOST as host


def _run(profile, reg_addr, field, field_id, alert_range={}):
    dan = DAN()
    dan.device_registration_with_retry(profile, host, reg_addr)
    while True:
        try:
            # Pull data
            session = db.get_session()
            for df in dan.selected_DF:
                data = dan.pull_with_timestamp(df)
                if data:
                    print(field, df, data)
                    timestamp = data[0]

                    try:
                        value = float(data[1][0])
                    except Exception as e:
                        print(e, ', ignore this data.')
                        continue

                    new_model = getattr(db.models, df.replace('-O', ''))(timestamp=timestamp, field=field_id, value=value)
                    session.add(new_model)
                    session.commit()

                    # alert
                    if df in alert_range:
                        alert_min = alert_range[df].get('min', 0)
                        alert_max = alert_range[df].get('max', 0)
                        if alert_min != alert_max and (value > alert_max or value < alert_min):
                            dan.push('Alert-I', '{} {}'.format(df, value))
            time.sleep(20)
        except KeyboardInterrupt:
            print(field, ': exit')
            break
        except Exception as e:
            print('[ERROR]:', e)
            if str(e).find('mac_addr not found:') != -1:
                print('Reg_addr is not found. Try to re-register...')
                dan.device_registration_with_retry(profile, host, reg_addr)
            else:
                print('Connection failed due to unknow reasons.')
                time.sleep(1)
        finally:
            session.close()

def main():
    db.connect()
    threads = []

    session = db.get_session()

    for field in (session.query(db.models.field).all()):
        profile = {'d_name': field.name + '_DataServer',
                   'dm_name': 'DataServer',
                   'df_list': ['Alert-I'],
                   'is_sim': False}
        alert_range = {}
        query_df = (session.query(db.models.field_sensor)
                           .select_from(db.models.field_sensor)
                           .join(db.models.sensor)
                           .filter(db.models.field_sensor.field == field.id)
                           .all())
        for df in query_df:
            profile['df_list'].append(df.df_name)
            alert_range[df.df_name] = {'min': df.alert_min,
                                       'max': df.alert_max}

        if not profile['df_list']:
            continue

        thread = Thread(target=_run,
                        args=(profile,
                              profile['d_name'],
                              field.name,
                              field.id,
                              alert_range))
        thread.daemon = True
        thread.start()
        threads.append(thread)

    session.close()

    for thread in threads:
        thread.join()

if __name__ == "__main__":
    main()
