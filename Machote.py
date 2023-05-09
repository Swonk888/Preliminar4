import pyodbc

server = 'nombre_servidor'
database = 'nombre_base_datos'
username = 'nombre_usuario'
password = 'contraseña_usuario'
conn = pyodbc.connect('DRIVER={SQL Server};SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)

cursor = conn.cursor()
cursor.execute('SELECT * FROM contratos')

import tkinter as tk

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

