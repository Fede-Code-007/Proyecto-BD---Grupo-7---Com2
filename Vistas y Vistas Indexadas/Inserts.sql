--Previamente se tuvo que eliminar las FK y tablas que impedían las inserciones, para la ejecución de este tema.

ALTER TABLE Producto
DROP CONSTRAINT FK_producto_proveedores;
ALTER TABLE Factura
DROP CONSTRAINT FK_factura_usuario;
ALTER TABLE Detalle_Producto
DROP CONSTRAINT FK_detalle_producto_producto

--Inserción de productos
DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT)
    VALUES (
        CONCAT('Producto ', @i),             -- Descripcion
        FLOOR(RAND() * 1000 + 1),            -- Stock entre 1 y 1000
        10,                                  -- Stock_Min
        FLOOR(RAND() * 100 + 1),             -- Precio entre 1 y 100
        FLOOR(RAND() * 50 + 1),              -- Costo entre 1 y 50
        FLOOR(RAND() * 1000000 + 1)          -- CUIT aleatorio
    );
    SET @i = @i + 1;
END;

--Inserción de facturas
DECLARE @j INT = 1;

WHILE @j <= 100000
BEGIN
    INSERT INTO Factura (Numero_Factura, Total, Fecha, DNI)
    VALUES (
        @j,                                   -- Numero_Factura
        FLOOR(RAND() * 5000 + 1),             -- Total entre 1 y 5000
        DATEADD(DAY, -FLOOR(RAND() * 30), GETDATE()), -- Fecha aleatoria en los últimos 30 días
        FLOOR(RAND() * (13 - 2 + 1) + 2)      -- DNI aleatorio
    );
    SET @j = @j + 1;
END;

----Inserción de detalles para las facturas
DECLARE @k INT = 1;

WHILE @k <= 1000000
BEGIN
    INSERT INTO Detalle_Producto (Cantidad, Precio, Numero_Factura, Codigo_Producto)
    VALUES (
        FLOOR(RAND() * 10 + 1),              -- Cantidad entre 1 y 10
        FLOOR(RAND() * 100 + 1),             -- Precio entre 1 y 100
        FLOOR(RAND() * 100000 + 1),          -- Numero_Factura aleatorio entre 1 y 100000
        FLOOR(RAND() * 100 + 1)              -- Codigo_Producto aleatorio entre 1 y 100
    );
    SET @k = @k + 1;
END;
--Nota se obtienen 951 mil detalles válidos aproximadamente.