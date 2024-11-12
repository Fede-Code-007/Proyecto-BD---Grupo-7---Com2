--Operaciones CRUD
CREATE VIEW Vista_Producto AS
SELECT Codigo_Producto, Descripcion, Stock, Precio
FROM Producto
WHERE Eliminado = 'NO';

--Create
--Comparación entre el uso directo de la tabla y el uso de la vista

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Producto (Descripcion, Stock, Precio)
    VALUES (
        CONCAT('Producto ', @i),             -- Descripcion
        FLOOR(RAND() * 1000 + 1),            -- Stock entre 1 y 1000
        FLOOR(RAND() * 100 + 1)            -- Precio entre 1 y 100
    );
    SET @i = @i + 1;
END;

--Se eliminan las FK en caso de ser necesario
ALTER TABLE Detalle_Producto
DROP CONSTRAINT FK_detalle_producto_producto;
ALTER TABLE Detalle_Categorias
DROP CONSTRAINT FK_detalle_categorias_producto;
TRUNCATE TABLE Producto;

DECLARE @j INT = 1;
WHILE @j <= 100
BEGIN
    INSERT INTO Vista_Producto(Descripcion, Stock, Precio)
    VALUES (
        CONCAT('Producto ', @j),             -- Descripcion
        FLOOR(RAND() * 1000 + 1),            -- Stock entre 1 y 1000
        FLOOR(RAND() * 100 + 1)            -- Precio entre 1 y 100
    );
    SET @j = @j + 1;
END;
--TRUNCATE TABLE Producto;

--Read
SELECT * FROM Vista_Producto;

--Update
UPDATE Vista_Producto
SET Precio = 55.00
WHERE Codigo_Producto = 1; 
SELECT * FROM Vista_Producto
WHERE Codigo_Producto = 1;

--Delete
DELETE FROM Vista_Producto
WHERE Codigo_Producto = 1;
SELECT * FROM Vista_Producto
WHERE Codigo_Producto = 1;