--Creación de una Vista Indexada para Datos de Ventas
--Aqui creamos una vista que agrupa los datos de productos y sus respectivas ventas (id, nombre, cantidad y monto acumulado), para facilitar el análisis de las 
--transacciones sin acceder directamente a las tablas subyacentes a través de uniones o subconsultas.

CREATE VIEW Vista_Ventas
WITH SCHEMABINDING AS
SELECT 
    p.Codigo_Producto,
    p.Descripcion,
    SUM(dp.Cantidad) AS UnidadesVendidas,
    SUM(dp.Cantidad * dp.Precio) AS MontoAcumulado,
	COUNT_BIG(*) AS COUNT
FROM dbo.Producto p
JOIN dbo.Detalle_Producto dp ON p.Codigo_Producto = dp.Codigo_Producto
JOIN dbo.Factura f ON f.Numero_Factura = dp.Numero_Factura
GROUP BY p.Codigo_Producto, p.Descripcion;

CREATE UNIQUE CLUSTERED INDEX IDX_Ventas_30Dias ON Vista_Ventas (Codigo_Producto);

--Comparaciones entre el uso de la vista y el uso directo de las tablas (previamente habiendo realizado las inserciones que se encuentran en esta misma carpeta)
--Para mostrar los resultados de un producto en específico:

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

select * from Vista_Ventas
where Descripcion = 'Producto 72';

SELECT 
    p.Codigo_Producto,
    p.Descripcion,
    SUM(dp.Cantidad) AS UnidadesVendidas,
    SUM(dp.Cantidad * dp.Precio) AS MontoAcumulado,
	COUNT_BIG(*) AS COUNT
FROM dbo.Producto p
JOIN dbo.Detalle_Producto dp ON p.Codigo_Producto = dp.Codigo_Producto
JOIN dbo.Factura f ON f.Numero_Factura = dp.Numero_Factura
WHERE descripcion = 'Producto 72'
GROUP BY p.Codigo_Producto, p.Descripcion;

--Para ver además el cociente entre el monto acumulado y las unidades vendidas

select *,
	(MontoAcumulado / UnidadesVendidas) as Promedio
from Vista_Ventas
order by Promedio;

SELECT 
    p.Codigo_Producto,
    p.Descripcion,
    SUM(dp.Cantidad) AS UnidadesVendidas,
    SUM(dp.Cantidad * dp.Precio) AS MontoAcumulado,
	(SUM(dp.Cantidad * dp.Precio) / SUM(dp.Cantidad)) as Promedio
FROM dbo.Producto p
JOIN dbo.Detalle_Producto dp ON p.Codigo_Producto = dp.Codigo_Producto
JOIN dbo.Factura f ON f.Numero_Factura = dp.Numero_Factura
GROUP BY p.Codigo_Producto, p.Descripcion
order by Promedio;


