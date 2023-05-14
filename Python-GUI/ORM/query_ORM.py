from tables import db, Contrato, DesechoMovimientos, Ubicaciones, Paises, Estados, Ciudades, Recolectores, Productores, Contactos, TipoContactos, LocalEv, TipoMovimientos, TipoRecipiente, Usuarios, Procesos
from connections import connection
from sqlalchemy import select
from sqlalchemy.orm import sessionmaker
from datetime import date
import json
from decimal import Decimal
import time
import threading

#Utilizada para convertir los datetime y decimal en datos que JSON pueda leer
class DataEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, date):
            return obj.isoformat()
        if isinstance(obj, Decimal):
            return float(obj)
        return super().default(obj)
    

# Obtener los datos de contrato
def contractData (contrato_id):

    engine = connection(False)
    Session = sessionmaker(bind=engine)
    session = Session()

   #Query de datos del contrato segun los movimientos que tiene
    query = select(
      Contrato.descripcion,
      DesechoMovimientos.posttime,
      DesechoMovimientos.responsible_name,
      DesechoMovimientos.reci_desecho_cantidad,
      Ubicaciones.descripcion,
      Paises.nombre,
      Productores.nombre,
      Productores.porcentaje_carbon
    ).select_from(Contrato).join(Procesos, onclause=Contrato.contrato_id == Procesos.contrato_id).join(DesechoMovimientos, onclause=Procesos.proceso_id == DesechoMovimientos.proceso_id).join(Ubicaciones, onclause=Contrato.ubicacion_id == Ubicaciones.ubicacion_id and DesechoMovimientos.ubicacion_id == Ubicaciones.ubicacion_id).join(Paises, onclause=Ubicaciones.pais_id == Paises.pais_id).join(Productores, onclause=DesechoMovimientos.productor_id == Productores.productor_id and Ubicaciones.ubicacion_id==Productores.ubicaicon_id).where(Procesos.contrato_id == contrato_id);


    result = session.execute(query)
    resultDict = {}

    #Guarda el resultado en un diccionario
    for idx, res in enumerate(result):
        resultDict[idx] = {"contrato": res[0], "posttime": res[1], "nombre_responsable": res[2], "desecho_cantidad": res[3], "region": res[4], "pais": res[5], "productor": res[6], "carbon":res[7]}

    #Guarda los datos en JSON
    jsontext = json.dumps(resultDict, cls=DataEncoder)

    with open('select.json', 'w') as f:
        f.write(jsontext)
    session.close()
    return jsontext

#llama a la funcion del query con el parametro que se desea
try:
    ID = int(input("Insertar ID de contrato ----> "))
    selected = contractData(ID)
except:
    print ("El valor no es numerico o no existe el ID")

#Lo mismo pero Toma en cuenta tiempo de ejecucion (elejir numero de threads)
"""
def run_orm(idNum, threadsAmount):
    total_time = 0
    for i in range(threadsAmount):
        start_time = time.time()
        t = threading.Thread(target=contractData, args=(idNum,))
        t.start()
        t.join()
        end_time = time.time()
        execution_time = end_time - start_time
        total_time += execution_time
        print(f"Execution time: {execution_time*1000:.2f} milliseconds")
    return total_time

idNum = 0
threadsAmount = 0
try:
    idNum = int(input("Insertar ID de contrato ----> "))
    threadsAmount = int(input("Ingrese la cantidad de hilos: "))
    runOrm = run_orm(idNum, threadsAmount)
    average_time = runOrm / threadsAmount
    print(f"\n ---> Average execution time: {average_time*1000:.2f} milliseconds <---")
except:
    print("El valor no es numerico o no existe el ID")
"""
    