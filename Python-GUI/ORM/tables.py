"mssql+pyodbc://localhost\SQLEXPRESS/caso3?driver=ODBC+Driver+17+for+SQL+Server"
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Float, Date, LargeBinary, SmallInteger, Time, Boolean
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy

class Contrato(db.Model):
    __tablename__ = 'contrato'
    contrato_id = Column(SmallInteger, primary_key=True)
    descripcion = Column(String(200), nullable=False)
    recolector_id = Column(SmallInteger, nullable=True)
    ubicacion_id = Column(LargeBinary, nullable=False)
    porcentaje = Column(Float(10,2), nullable=False)
   
class DesechoMovimientos(db.Model):
    __tablename__ = 'desechos_movimiento'
    w_mov_id = Column(SmallInteger, primary_key=True)
    posttime = Column(DateTime, nullable=False)
    responsible_name = Column(String(20), nullable=False)
    signImage = Column(LargeBinary, nullable=True)
    ubicacion_id = Column(SmallInteger, ForeignKey('ubicaciones.ubicacion_id'), nullable=False)
    recolector_id = Column(SmallInteger, ForeignKey('recolectores.recolector_id'), nullable=True)
    productor_id = Column(SmallInteger, ForeignKey('productores_residuos.productor_id'), nullable=True)
    ev_id =  Column(Integer, ForeignKey('local_ev.ev_id'), nullable=True)
    tipomov_id = Column(SmallInteger, ForeignKey('tipo_movimiento.tipomov_id'), nullable=False)
    tiporec_id = Column(SmallInteger, ForeignKey('tipo_recipiente.tiporec_id'), nullable=False)
    reci_desecho_cantidad = Column(Float(10,2), nullable=False)
    user_id = Column(SmallInteger, ForeignKey('usuarios.user_id'), nullable=False)
    chacksum = Column(LargeBinary, nullable=True)
    computer = Column(String(20), nullable=False)
    user = Column(String(20), nullable=False)
    proceso_id = Column(SmallInteger, ForeignKey('proceso.proceso_id') , nullable=False)

class Ubicaciones(db.Model):
    __tablename__ = 'ubicaciones'
    ubicacion_id = Column(SmallInteger, primary_key=True)
    pais_id = Column(SmallInteger, ForeignKey('paises.pais_id'), nullable=False)
    descripcion =  Column(String(20), nullable=False)
    
class Paises(db.Model):
    __tablename__ = 'paises'
    pais_id = Column(SmallInteger, primary_key=True)
    estado_id = Column(SmallInteger, ForeignKey('Estado.estado_id'), nullable=True)
    nombre =  Column(String(30), nullable=False)

class Estados(db.Model):
    __tablename__ = 'Estado'
    estado_id = Column(SmallInteger, primary_key=True)
    ciudad_id = Column(SmallInteger, ForeignKey('ciudades.ciudad_id'), nullable=True)
    nombre =  Column(String(20), nullable=False)

class Ciudades(db.Model):
    __tablename__ = 'ciudades'
    ciudad_id = Column(SmallInteger, primary_key=True)
    zipcode = Column(String(15), nullable=False)
    nombre =  Column(String(20), nullable=False)

class Recolectores(db.Model):
    __tablename__ = 'recolectores'
    recolector_id = Column(SmallInteger, primary_key=True)
    productor_id = Column(SmallInteger, ForeignKey('productores_residuos.productor_id'), nullable=False)
    ubicacion_id = Column(SmallInteger, ForeignKey('ubicaciones.ubicacion_id'), nullable=False)
    nombre =  Column(String(20), nullable=False)

class Productores(db.Model):
    __tablename__ = 'productores_residuos'
    productor_id = Column(SmallInteger, primary_key=True)
    nombre =  Column(String(20), nullable=False)
    horario = Column(Time(7), nullable=False)
    donacion_id = Column(SmallInteger, ForeignKey('donaciones.donacion_id'), nullable=True)
    porcentaje_carbon = Column(Float(12,3), nullable=False)
    balance = Column(Float(10,2), nullable=False)
    ubicaicon_id = Column(SmallInteger, ForeignKey('ubicaciones.ubicacion_id'), nullable=False)
    contacto_id = Column(Integer, ForeignKey('contacto_value.contacto_id'), nullable=False)

class Contactos(db.Model):
    __tablename__ = 'contacto_value'
    contacto_id = Column(SmallInteger, primary_key=True)
    value =  Column(String(150), nullable=False)
    posttime = Column(DateTime, nullable=False)
    enable = Column(Boolean, nullable=True)
    tipo_id = Column(SmallInteger, ForeignKey('tipo_contactos.tipo_id'), nullable=False)
    
class TipoContactos(db.Model):
    __tablename__ = 'tipo_contactos'
    tipo_id = Column(SmallInteger, primary_key=True)
    nombre =  Column(String(50), nullable=False)

class LocalEv(db.Model):
    __tablename__ = 'local_ev'
    ev_id = Column(Integer, primary_key=True)
    telefono =  Column(Integer, nullable=False)
    ubicacion_id = Column(SmallInteger, ForeignKey('ubicaciones.ubicacion_id'), nullable=False)

class TipoMovimientos(db.Model):
    __tablename__ = 'tipo_movimiento'
    tipomov_id = Column(SmallInteger, primary_key=True)
    mov_tipo =  Column(Integer, nullable=False)
    descripcion =  Column(String(150), nullable=False)

class TipoRecipiente(db.Model):
    __tablename__ = 'tipo_recipientes'
    tiporec_id = Column(SmallInteger, primary_key=True)
    nombre =  Column(String(50), nullable=False)
    capacidad = Column(Float(10,2), nullable=False)
    medida =  Column(String(20), nullable=False)
    marca =  Column(String(25), nullable=False)
    modelo =  Column(String(30), nullable=False)
    cant_uso =  Column(Integer, nullable=False)
    cant_out =  Column(Integer, nullable=False)
    cant_reparacion =  Column(Integer, nullable=False)
    cant_disponible =  Column(Integer, nullable=False)
    
class Usuarios(db.Model):
    __tablename__ = 'usuarios'
    user_id = Column(SmallInteger, primary_key=True)
    nombre =  Column(String(20), nullable=False)
    apellido =  Column(String(20), nullable=False)
    apellido2 =  Column(String(20), nullable=False)
    email =  Column(String(30), nullable=False)
    profile_pic = Column(LargeBinary, nullable=True)
    checksum = Column(LargeBinary, nullable=True)
    enable = Column(Boolean, nullable=True)

class Procesos(db.Model):
    __tablename__ = 'proceso'
    proceso_id = Column(SmallInteger, primary_key=True)
    volumen = Column(Float(8,2), nullable=False)
    clasificacion = Column(Boolean, nullable=False)
    ev_id = Column(Integer, ForeignKey('local_ev.ev_id'), nullable=False)
    fecha = Column(DateTime, nullable=False)
    estado = Column(String(50), nullable=False)
    costo = Column(Float(8,2), nullable=False)
    contrato_id = Column(SmallInteger, ForeignKey('contrato.contrato_id'), nullable=False)