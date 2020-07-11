import datetime


def row2dict(row, str_datetime=True):
    """Convert query object by sqlalchemy to dictionary object."""
    if not row:
        return None

    d = {}
    if hasattr(row, '__table__'):
        for column in row.__table__.columns:
            d[column.name] = getattr(row, column.name)
            if str_datetime and isinstance(d[column.name], datetime.datetime):
                d[column.name] = str(d[column.name])
    if hasattr(row, '_fields'):
        for column_name in row._fields:
            d[column_name] = getattr(row, column_name)
            if str_datetime and isinstance(d[column_name], datetime.datetime):
                d[column_name] = str(d[column_name])
    return d
