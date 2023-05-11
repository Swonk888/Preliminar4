CREATE PROCEDURE [dbo].[getFilteredVentas]
    @ContratoID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.descripcion, p.proceso_id, p.clasificacion, dm.posttime, dm.responsible_name, dm.reci_desecho_cantidad, u.descripcion AS Expr1, pa.nombre, pr.nombre AS Expr2, pr.porcentaje_carbon, pr.balance
    FROM dbo.contrato c
    INNER JOIN dbo.proceso p ON c.contrato_id = p.contrato_id
    INNER JOIN dbo.desecho_movimientos dm ON p.proceso_id = dm.proceso_id
    INNER JOIN dbo.ubicaciones u ON c.ubicacion_id = u.ubicacion_id AND dm.ubicacion_id = u.ubicacion_id
    INNER JOIN dbo.paises pa ON u.pais_id = pa.pais_id
    INNER JOIN dbo.productores_residuos pr ON dm.productor_id = pr.productor_id AND u.ubicacion_id = pr.ubicaicon_id
    WHERE c.contrato_id < @ContratoID;
END;