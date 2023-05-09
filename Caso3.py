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
        database = 'case3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        # obtener los nombres y cantidades de los productos de la base de datos
        cursor.execute('SELECT descripcion FROM productos')
        productos = cursor.fetchall()

        # opción por defecto
        self.nombre_producto = tk.StringVar(value='Seleccione un producto')
        self.cantidad_disponible = tk.StringVar(value='0')
        self.precio = tk.StringVar(value='0')
        self.costo = tk.StringVar(value='0')
        
        # menú desplegable de productos y cantidad disponible
        tk.Label(self, text='Nombre del producto:').grid(row=1, column=0)
        tk.OptionMenu(self, self.nombre_producto, *[row[0] for row in productos], command=self.actualizar_cantidad).grid(row=1, column=1)
        tk.Label(self, text = 'Cantidad disponible:').grid(row=2, column=2)
        tk.Label(self, textvariable = self.cantidad_disponible).grid(row=2, column=3)

        #cantidad
        tk.Label(self, text='Cantidad:').grid(row=2, column=0)
        self.cantidad = tk.Entry(self)
        self.cantidad.grid(row=2, column=1)

        tk.Label(self, text='Precio Unitario:').grid(row=3, column=0)
        tk.Label(self, textvariable = self.precio).grid(row=3, column=1)

        tk.Label(self, text='Costo:').grid(row=4, column=0)
        tk.Label(self, textvariable = self.costo).grid(row=4, column=1)
        
        # botón de registro de venta
        tk.Button(self, text='Calcular costo', command=self.calcular_costo).grid(row=4, column=2)

        # botón de registro de venta
        tk.Button(self, text='Registrar venta', command=self.guardar_venta).grid(row=5, column=2)

    def calcular_costo(self):
        cantidad = int(self.cantidad.get())
        precio = float(self.precio.get())
        costo = precio * cantidad
        self.costo.set(str(costo))




    def actualizar_precio(self, producto):
        # conectar a la base de datos
        server = 'localhost'
        database = 'case3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        cursor.execute('SELECT precio FROM productos WHERE descripcion = ?', producto)
        precio = cursor.fetchall()[0][0]

        # actualizar la variable de cantidad disponible y la etiqueta correspondiente
        self.precio.set(str(precio))



    def actualizar_cantidad(self, producto):
        # conectar a la base de datos
        server = 'localhost'
        database = 'case3'
        conn =  pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};TRUSTED_CONNECTION=yes;')
        cursor = conn.cursor()
        cursor.execute('SELECT producto_id FROM productos WHERE descripcion = ?', producto)
        producto_id = cursor.fetchall()[0][0]

        # obtener la cantidad disponible del producto seleccionado
        cursor.execute('SELECT cantidad FROM productos_producidos WHERE producto_id = ?', producto_id)
        cantidad_disponible = cursor.fetchone()[0]

        # actualizar la variable de cantidad disponible y la etiqueta correspondiente
        self.cantidad_disponible.set(str(cantidad_disponible))
        self.actualizar_precio(producto)

    

        


    

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

root = tk.Tk()
app = VentanaRegistroVentas(master=root)
app.mainloop()

