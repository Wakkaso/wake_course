from sqlalchemy import (Boolean, Column, DateTime, Float, ForeignKey,
                        Integer, String, Text, UniqueConstraint)
from sqlalchemy.ext.declarative import declarative_base


base = declarative_base()


class AtPressure(base):
    __tablename__ = 'atpressure'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)


class CO2(base):
    __tablename__ = 'co2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class Temperature(base):
    __tablename__ = 'temperature'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class Humidity(base):
    __tablename__ = 'humidity'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Luminance(base):
    __tablename__ = 'luminance'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class WindSpeed(base):
    __tablename__ = 'windspeed'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class RainMeter(base):
    __tablename__ = 'rainmeter'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Bug1(base):
    __tablename__ = 'bug1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Bug2(base):
    __tablename__ = 'bug2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Bug3(base):
    __tablename__ = 'bug3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Bug4(base):
    __tablename__ = 'bug4'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class UV1(base):
    __tablename__ = 'uv1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class UV2(base):
    __tablename__ = 'uv2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class UV3(base):
    __tablename__ = 'uv3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture1(base):
    __tablename__ = 'moisture1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH1(base):
    __tablename__ = 'ph1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture2(base):
    __tablename__ = 'moisture2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH2(base):
    __tablename__ = 'ph2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture3(base):
    __tablename__ = 'moisture3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH3(base):
    __tablename__ = 'ph3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture4(base):
    __tablename__ = 'moisture4'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH4(base):
    __tablename__ = 'ph4'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture5(base):
    __tablename__ = 'moisture5'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH5(base):
    __tablename__ = 'ph5'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture6(base):
    __tablename__ = 'moisture6'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH6(base):
    __tablename__ = 'ph6'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture7(base):
    __tablename__ = 'moisture7'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture8(base):
    __tablename__ = 'moisture8'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture9(base):
    __tablename__ = 'moisture9'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture10(base):
    __tablename__ = 'moisture10'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Volt1(base):
    __tablename__ = 'volt1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Volt2(base):
    __tablename__ = 'volt2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Current1(base):
    __tablename__ = 'current1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Current2(base):
    __tablename__ = 'current2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Power1(base):
    __tablename__ = 'power1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Power2(base):
    __tablename__ = 'power2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Consumption(base):
    __tablename__ = 'consumption'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Spore(base):
    __tablename__ = 'spore'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Ovum(base):
    __tablename__ = 'Ovum'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp1(base):
    __tablename__ = 'soiltemp1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp2(base):
    __tablename__ = 'soiltemp2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp3(base):
    __tablename__ = 'soiltemp3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp4(base):
    __tablename__ = 'soiltemp4'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp5(base):
    __tablename__ = 'soiltemp5'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp6(base):
    __tablename__ = 'soiltemp6'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp7(base):
    __tablename__ = 'soiltemp7'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp8(base):
    __tablename__ = 'soiltemp8'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp9(base):
    __tablename__ = 'soiltemp9'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class SoilTemp10(base):
    __tablename__ = 'soiltemp10'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class SoilEC1(base):
    __tablename__ = 'soilec1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC2(base):
    __tablename__ = 'soilec2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC3(base):
    __tablename__ = 'soilec3'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC4(base):
    __tablename__ = 'soilec4'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC5(base):
    __tablename__ = 'soilec5'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC6(base):
    __tablename__ = 'soilec6'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC7(base):
    __tablename__ = 'soilec7'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC8(base):
    __tablename__ = 'soilec8'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC9(base):
    __tablename__ = 'soilec9'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC10(base):
    __tablename__ = 'soilec10'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class N(base):
    __tablename__ = 'n'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class P(base):
    __tablename__ = 'p'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)
class K(base):
    __tablename__ = 'k'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Turmeric(base):
    __tablename__ = 'turmeric'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)



####################################################

class user(base):
    __tablename__ = 'user'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    username = Column(String(255), nullable=False)
    password = Column(String(255), nullable=False)
    is_superuser = Column(Boolean, nullable=False, default=False)
    memo = Column(Text, nullable=False, default='')
    __table_args__ = (UniqueConstraint('username', name='uc_username'),)



class field(base):
    __tablename__ = 'field'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    name = Column(String(50), nullable=False)
    alias = Column(String(50), nullable=False)
    iframe = Column(String(200),
                    nullable=False,
                    default='')


class sensor(base):
    __tablename__ = 'sensor'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    name = Column(String(50), nullable=False, unique=True)
    df_name = Column(String(50), nullable=False, unique=True)
    alias = Column(String(50), nullable=False)
    unit = Column(String(50), default='')
    icon = Column(String(50), default='')
    bg_color = Column(String(50), default='bg-aqua')


class field_sensor(base):
    __tablename__ = 'field_sensor'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    field = Column(Integer,
                   ForeignKey('field.id'),
                   nullable=False)
    sensor = Column(Integer,
                    ForeignKey('sensor.id'),
                    nullable=False)
    df_name = Column(String(50), nullable=False)
    alias = Column(String(50), nullable=False)
    unit = Column(String(50), default='')
    icon = Column(String(50), default='')
    bg_color = Column(String(50), default='bg-aqua')
    alert_min = Column(Float, nullable=False, default=0)
    alert_max = Column(Float, nullable=False, default=0)
    __table_args__ = (UniqueConstraint('field',
                                       'df_name',
                                       name='UC_field_df_name'),)


class user_access(base):
    __tablename__ = 'user_access'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    user = Column(Integer,
                  ForeignKey('user.id'),
                  nullable=False)
    field = Column(Integer,
                   ForeignKey('field.id'),
                   nullable=False)
    is_active = Column(Boolean, nullable=False, default=False)
