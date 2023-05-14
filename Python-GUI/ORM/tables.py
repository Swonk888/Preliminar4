"mssql+pyodbc://localhost\SQLEXPRESS/caso3?driver=ODBC+Driver+17+for+SQL+Server"
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Float, Date, LargeBinary, SmallInteger
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy

class Contrato(db.Model):
    __tablename__ = 'contrato'
    contrato_id = Column(SmallInteger, primary_key=True)
    descripcion = Column(String(200), nullable=False)
    recolector_id = Column(SmallInteger, nullable=True)
    ubicacion_id = Column(LargeBinary, nullable=False)
    porcentaje = Column(float(10,2), nullable=False)
   
class DesechoMovimientos(db.Model):
    __tablename__ = 'desechos_movimiento'
    w_mov_id = Column(SmallInteger, primary_key=True)
    posttime = Column(DateTime, nullable=False)
    responsible_name = Column(String(20), nullable=False)
    signImage = Column(LargeBinary, nullable=True)
    ubicacion_id = Column(SmallInteger, ForeignKey('ubicaciones.ubicacion_id'), nullable=False)
    recolector_id = Column(SmallInteger, ForeignKey('recolectores.recolector_id'), nullable=True)
    movementTypeId = Column(Integer, nullable=False)
    contractId = Column(Integer, nullable=False)
    quantity = Column(Float(precision=2), nullable=False)
    userId = Column(Integer, nullable=False)
    checksum = Column(LargeBinary, nullable=False)
    computer = Column(String(50), nullable=False)
    containerId = Column(Integer, ForeignKey('containers.containerId'), nullable=False)
    wasteId = Column(Integer, ForeignKey('wastes.wasteId'), nullable=False)
    carId = Column(Integer)