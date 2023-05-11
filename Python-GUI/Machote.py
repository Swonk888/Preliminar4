import pyodbc
import tkinter as tk

server = 'nombre_servidor'
database = 'nombre_base_datos'
username = 'nombre_usuario'
password = 'contraseña_usuario'
conn = pyodbc.connect('DRIVER={SQL Server};SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)

cursor = conn.cursor()
cursor.execute('SELECT * FROM contratos')

class VentanaRegistroVentas(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title('Registro de Ventas')
        self.geometry('400x300')

        # Crear campos de entrada para el nombre del producto, cantidad y precio
        tk.Label(self, text='Nombre del producto:').grid(row=0, column=0)
        self.nombre_producto = tk.Entry(self)
        self.nombre_producto.grid(row=0, column=1)

        tk.Label(self, text='Cantidad:').grid(row=1, column=0)
        self.cantidad = tk.Entry(self)
        self.cantidad.grid(row=1, column=1)

        tk.Label(self, text='Precio:').grid(row=2, column=0)
        self.precio = tk.Entry(self)
        self.precio.grid(row=2, column=1)

        # Crear un botón para guardar la venta
        tk.Button(self, text='Guardar', command=self.guardar_venta).grid(row=3, column=1)

    def guardar_venta(self):
        # Obtener los valores de los campos de entrada
        nombre_producto = self.nombre_producto.get()
        cantidad = self.cantidad.get()
        precio = self.precio.get()

        # Calcular el monto de la venta
        monto_venta = cantidad * precio

        # Obtener el contrato correspondiente al producto
        cursor = conn.cursor()
        cursor.execute('SELECT contrato FROM productos WHERE nombre = ?', nombre_producto)
        contrato = cursor.fetchone()[0]

        # Asignar el monto de la venta al contrato correspondiente
        cursor.execute('UPDATE contratos SET monto = monto + ? WHERE id = ?', monto_venta, contrato)
        conn.commit()

        # Mostrar un mensaje de confirmación
        tk.messagebox.showinfo('Venta guardada', f'Se ha registrado una venta de {cantidad} unidades del producto "{nombre_producto}" por un monto total de {monto_venta} en el contrato {contrato}.')

'''
# preliminar #4, conectividad a la base de datos, 11 de mayo, 35pts 
- ahora el arquitecto de soluciones necesita que usted diseñe la forma en que los programas van a interactuar con la base de datos, definiendo los layers necesarios para acceder y trabajar con la misma desde las aplicaciones 

- para ello deberá probar dos formas de interconectividad, la primera hacer un acceso cliente servidor desde una aplicación programada en el lenguaje de su preferencia, por ejemplo .net, java, go, python, etc, uno que le permita construir un UI y que exista un driver nativo, jdbc, ado.net y en última instancia odbc. Escoja alguna de las siguientes pantallas para realizar su programa de prueba: 
	a) chequear los residuos que un transportista recolector se va a llevar de un productor de residuos, haciendo el canje de recipientes respectivos 
	b) registrar las ventas de productos reciclados realizando la asignación de montos respectivos según contratos 
(valide el mockup de la pantalla seleccisonada con el diseño de la base de datos y el profesor)

- la segunda forma deberá hacerse por medio de un api en REST, para ello el profesor le va a proporcionar una [base hecha en nodejs](https://github.com/vsurak/cursostec/tree/master/baseservice) , para probarlo, implemente un stored procedure que retorne al menos 500 registros, luego proceda a habilitar dos endpoints que llamen a dicho stored procedure, respetando los layers del servicio REST proporcionado, uno debe hacer uso de un conexión pool y otro que no lo use. Los endpoints deben retornar json. 

- hecho lo anterior proceda a probar con postman su servicio rest, haciendo pruebas de stress sin superar los 20 hilos de ejecución y determine en las métricas de postman versus las métricas del activity monitor de su sql server, cuál de los endpoints obtiene mejores prestaciones y el por qué, esto puede documentarlo entre postman, un documento, screenshots y cualquier otro material de apoyo 

- la revisión de este preliminar será con cita de revisión con el asistente, la aplicación y el servicio rest deberá estar en un solo repositorio de git, se tomará en cuenta los commits de cada integrante 

- se daran 15 puntos extras si implementa y mide otro endpoint utilizando algún ORM

- el último commit en git deberá ser el 11 de mayo a media noche

## aspectos operativos

- [temporal tables para mantener historiales de datos](
https://learn.microsoft.com/en-us/sql/relational-databases/tables/temporal-tables?view=sql-server-ver16)
'''