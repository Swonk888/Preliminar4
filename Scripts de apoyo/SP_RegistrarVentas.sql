use caso3;
go;
CREATE PROCEDURE InsertarVenta (
    @producto_id INT,
    @precio DECIMAL(10, 2),
    @cantidad INT,
    @moneda_id INT,
    @tipo_cambio_id INT
)
AS
BEGIN
    DECLARE @fecha DATETIME = GETDATE();
    DECLARE @monto DECIMAL(10, 2) = @cantidad * @precio;

    INSERT INTO ventas (producto_id, monto, fecha, cantidad, moneda_id, tipo_cambio_id)
    VALUES (@producto_id, @monto, @fecha, @cantidad, @moneda_id, @tipo_cambio_id);
END;