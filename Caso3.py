import tkinter as tk
import pyodbc

#cursor.execute('SELECT * FROM contratos')

class VentanaRegistroVentas(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        tk.Label(self, text = 'Registro de Ventas').grid(row=0, column=0)
        self.master = master
        self.pack()
        self.crear_widgets()
    
    def crear_widgets(self):
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        
        # opción por defecto
        self.nombre_producto = tk.StringVar(value='Seleccione un producto')
        self.cantidad_disponible = tk.StringVar(value='0')
        self.precio = tk.StringVar(value='0')
        self.costo = tk.StringVar(value='0')
        self.costoP = tk.StringVar(value='0')
        self.ganancias = []
        self.compra = []
        self.productos = []
        self.contrato = 0
        self.tipo_cambio = 1.0
        self.simbolo = '₡'
        
        cursor.execute('SELECT descripcion FROM productos')
        productos = cursor.fetchall()
        cursor.execute('SELECT nombre FROM monedas')
        monedas = cursor.fetchall()
        self.moneda = tk.StringVar(value=monedas[0])

        tk.Label(self, text='Moneda:').grid(row=1, column=0)
        tk.OptionMenu(self, self.moneda, *[row[0] for row in monedas], command=self.actualizar_moneda).grid(row=1, column=1)
        # menú desplegable de productos y cantidad disponible
        tk.Label(self, text='Producto:').grid(row=2, column=0)
        tk.OptionMenu(self, self.nombre_producto, *[row[0] for row in productos], command=self.actualizar_cantidad).grid(row=2, column=1)
        tk.Label(self, text = 'Cantidad disponible:').grid(row=3, column=2)
        tk.Label(self, textvariable = self.cantidad_disponible).grid(row=3, column=3)

        #cantidad
        tk.Label(self, text='Cantidad:').grid(row=3, column=0)
        self.cantidad = tk.Entry(self)
        self.cantidad.grid(row=3, column=1)

        tk.Label(self, text='Precio Unitario:').grid(row=4, column=0)
        tk.Label(self, textvariable = self.precio).grid(row=4, column=1)

        tk.Label(self, text='Monto total:').grid(row=6, column=0)
        tk.Label(self, textvariable = self.costo).grid(row=6, column=1)

        

        # botón de calcular costo
        tk.Button(self, text='Agregar a Carrito', command=self.calcular_costo).grid(row=5, column=0)

        # botón de registro de venta
        tk.Button(self, text='Registrar venta', command=self.guardar_venta).grid(row=8, column=2)

        # botón de pagos
        tk.Button(self, text='Ver detalle', command=self.pagos).grid(row=9, column=2)

    def actualizar_moneda(self, moneda):
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        cursor.execute('SELECT tipo_cambio_actual FROM monedas WHERE nombre = ?', moneda)
        tipo_cambio = cursor.fetchone()[0]
        self.tipo_cambio.set(float(tipo_cambio))
        cursor.execute('SELECT simbolo FROM monedas WHERE nombre = ?', moneda)
        simbolo = cursor.fetchone()[0]
        self.simbolo.set(simbolo)


    def calcular_costo(self):
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        

        moneda = self.moneda.get()
        tipo_cambio = self.tipo_cambio.get()
        nombreP = self.nombre_producto.get()
        cantidad = float(self.cantidad.get())
        precio = float(self.precio.get())
        costo =  float(self.costo.get())
        costo = costo + (precio * cantidad)
        self.costo.set(str(costo))

        cursor.execute('SELECT moneda_id FROM monedas WHERE nombre = ?', moneda)
        moneda_id = cursor.fetchone()[0]
        cursor.execute('SELECT tipo_cambio_id FROM tipo_cambio WHERE tipo_cambio = ? and moneda_id = ?', tipo_cambio, moneda)
        tipo_cambio_id = cursor.fetchone()[0]
        productos = self.productos.get()
        productos.append([nombreP, cantidad, precio, moneda_id, tipo_cambio_id])
        self.productos.set(productos)

        contrato = self.contrato.get()
        costo2 = float(self.costoP.get())
        gananciasActuales = self.ganancias.get()
        ganancias =  costo - costo2
        gananciasActuales.append([ganancias, contrato])
        self.ganancias.set(gananciasActuales)

        compraActual = (self.compra.get())
        producto = (self.nombre_producto.get())
        compraActual.append(producto)

        self.compra.set(compraActual)


    def actualizar_precio(self, producto):
        # conectar a la base de datos
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        cursor.execute('SELECT precio FROM productos WHERE descripcion = ?', producto)
        precio = cursor.fetchall()[0][0]
        tipo_cambio = self.tipo_cambio.get()
        simbolo = self.simbolo.get()
        precio =  precio * tipo_cambio

        # actualizar la variable de cantidad disponible y la etiqueta correspondiente
        self.precio.set(simbolo + str(precio))



    def actualizar_cantidad(self, producto):
        # conectar a la base de datos
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        cursor.execute('SELECT producto_id FROM productos WHERE descripcion = ?', producto)
        producto_id = cursor.fetchall()[0][0]
        cursor.execute('SELECT contrato_id FROM productos_producidos WHERE producto_id = ?', producto)
        contrato_id = cursor.fetchall()[0][0]
        self.contrato.set(contrato_id)
        cursor.execute('SELECT proceso_id FROM proceso WHERE contrato_id = ?', contrato_id)
        proceso_id = cursor.fetchall()[0][0]
        cursor.execute('SELECT costo FROM proceso WHERE proceso_id = ?', proceso_id)
        costo2 = cursor.fetchall()[0][0]

        # obtener la cantidad disponible del producto seleccionado
        cursor.execute('SELECT cantidad FROM productos_producidos WHERE producto_id = ? AND contrato_id = ?', producto_id, contrato_id)
        cantidad_disponible = cursor.fetchone()[0]

        # actualizar la variable de cantidad disponible y la etiqueta correspondiente
        self.cantidad_disponible.set(str(cantidad_disponible))
        self.actualizar_precio(producto)

        self.costoP.set(str(costo2))

    def pagos(self):
        # Crear una ventana para mostrar los montos
        ventana_montos = tk.Toplevel()
        ventana_montos.title('Montos')
        ventana_montos.geometry('300x200')

        lista_compra = self.compra.get()
        lista_ganancias = self.ganancias.get()


        # conectar a la base de datos
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()



        # Obtener el contrato correspondiente al producto
        for i, gana in enumerate(lista_ganancias):
            cursor = conn.cursor()
            cursor.execute('SELECT actor_id FROM actores_x_contrato WHERE contrato_id = ?', gana[1])
            actores = cursor.fetchall()

            cursor.execute('SELECT porcentaje FROM actores_x_contrato WHERE contrato_id = ?', gana[1])
            porcentajes = cursor.fetchall()

            cursor.execute('SELECT porcentaje FROM contrato WHERE contrato_id = ?', gana[1])
            porcentajeR = cursor.fetchone()[0]

            cursor.execute('SELECT recolector_id FROM contrato WHERE contrato_id = ?', gana[1])
            recolector_id = cursor.fetchone()[0]

            cursor.execute('SELECT nombre FROM recolectores WHERE recolector_id = ?', recolector_id)
            nombre = cursor.fetchone()[0]

            montoR = gana[0] * float(porcentajeR)
            ganancia =  gana[0]
            ganancia = ganancia - montoR
            
            # Mostrar los montos en una lista
            tk.Label(ventana_montos, text=nombre).grid(row=1, column=0)
            tk.Label(ventana_montos, text=str(montoR)).grid(row=1, column=1)

            for j, actor in enumerate(actores):
                cursor.execute('SELECT descripcion FROM actores WHERE actor_id = ?', actor[1])
                nombreA = cursor.fetchall()[0]
                montoN = float(porcentajes[j]) * gana[0]
                ganancia = ganancia - montoN
                tk.Label(ventana_montos, text=nombreA).grid(row=(len(actores))*i+j+1, column=0)
                tk.Label(ventana_montos, text=str(montoN)).grid(row=(len(actores))*i+j+1, column=1)
            montoE = ganancia
            tk.Label(ventana_montos, text='Esencial Verde').grid(row=2, column=0)
            tk.Label(ventana_montos, text=str(montoR)).grid(row=2, column=1)


    def guardar_venta(self):
        # conectar a la base de datos
        server = 'localhost'
        database = 'caso3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()

        #productos.append([nombreP, cantidad, precio, moneda_id, tipo_cambio_id])
        productos = self.productos.get()
        for i, venta in enumerate(productos):
            # Obtener los valores de los campos de entrada
            nombre_producto = venta[0]
            cantidad = venta[1]
            precio = venta[2]
            moneda = venta[3]
            tipo_cambio = venta[4]
            cursor.execute('SELECT producto_id FROM productos WHERE descripción = ?', nombre_producto)
            producto_id = cursor.fetchone()[0]

            # Calcular el monto de la venta
            monto_venta = cantidad * precio

            fecha = '2023-05-12 07:00:00'    

            # Registrar Venta
            cursor.execute('INSERT INTO ventas (producto_id, monto, fecha, cantidad, moneda_id, tipo_cambio_id) values (?, ?, ?, ?, ?, ?)', producto_id, monto_venta, cantidad, moneda, tipo_cambio)
            conn.commit()

        # Mostrar un mensaje de confirmación
        tk.messagebox.showinfo('Venta guardada', f'Se ha registrado una venta por un monto total de {monto_venta}.')


root = tk.Tk()
app = VentanaRegistroVentas(master=root)
app.mainloop()

