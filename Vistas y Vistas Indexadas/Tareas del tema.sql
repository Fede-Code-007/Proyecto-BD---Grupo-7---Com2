--Desarrollo de las tareas del el tema:

CREATE VIEW Vista_Producto AS
SELECT Descripcion, Precio, Stock
FROM Producto;

INSERT INTO Vista_Producto (Descripcion, Precio, Stock)
VALUES ('Arándanos', 1000.00, 50), ('Barrita protéica', 2000.00, 100), ('Cacao', 3000.00, 50);

--Error: not null
ALTER TABLE Producto
ALTER COLUMN Stock_Min INT NULL;

ALTER TABLE Producto
ALTER COLUMN Costo FLOAT NULL;

ALTER TABLE Producto
ALTER COLUMN CUIT BIGINT NULL;

SELECT * FROM Producto WHERE Descripcion IN ('Arándanos', 'Barrita protéica', 'Cacao');

UPDATE Vista_Producto
SET Descripcion = 'Producto Modificado'
WHERE Descripcion = 'Arándanos';

SELECT * FROM Producto WHERE Descripcion = 'Producto Modificado';

DELETE FROM Vista_Producto
WHERE Descripcion IN ('Producto Modificado', 'Barrita protéica', 'Cacao');

SELECT * FROM Producto WHERE Descripcion IN ('Producto Modificado', 'Barrita protéica', 'Cacao');

CREATE INDEX Indice_Vista
ON Vista_Producto
(Codigo_Producto);
--Error: Vista_Producto no es una vista indexada.

DROP VIEW Vista_Producto;