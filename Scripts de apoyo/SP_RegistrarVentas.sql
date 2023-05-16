use caso3;
CREATE PROCEDURE InsertarVenta(
    IN producto_id INT,
    IN precio DECIMAL(10, 2),
    IN cantidad INT,
    IN moneda_id INT,
    IN tipo_cambio_id INT
)
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = (GETDATE());
    DECLARE monto DECIMAL(10, 2);
    SET monto = cantidad * precio;
    INSERT INTO ventas (producto_id, monto, fecha, cantidad, moneda_id, tipo_cambio_id)
    VALUES (producto_id, monto, fecha, cantidad, moneda_id, tipo_cambio_id);
END;