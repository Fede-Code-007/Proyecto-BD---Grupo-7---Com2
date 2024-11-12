--Crear dos usuarios de base de datos

CREATE LOGIN LoginAdmin WITH PASSWORD = 'PasswordSeguro123';
CREATE LOGIN LoginLectura WITH PASSWORD = 'PasswordSeguro123';

CREATE USER UsuarioAdmin FOR LOGIN LoginAdmin;
CREATE USER UsuarioLectura FOR LOGIN LoginLectura;

--A un usuario darle el permiso de administrador y al otro usuario solo permiso de lectura
ALTER ROLE db_owner ADD MEMBER UsuarioAdmin;
ALTER ROLE db_datareader ADD MEMBER UsuarioLectura;

--Utilizar los procedimientos almacenados creados anteriormente
--(Estos se encuentran en 'procedimientos y funciones almacenadas.sql')

GRANT EXECUTE ON InsertarProducto TO UsuarioLectura;

-- Ejecutar como UsuarioAdmin
EXECUTE AS USER = 'UsuarioAdmin';
INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT, Eliminado)
VALUES ('Producto S', 20, 5, 150.00, 100.00, 20678901234, 'NO');
--Ejecuta sin errores
SELECT * FROM Producto WHERE Descripcion = 'Producto S';
REVERT;

-- Este intento de INSERT falla
EXECUTE AS USER = 'UsuarioLectura';
INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT, Eliminado)
VALUES ('Producto F', 30, 10, 120.00, 80.00, 20789012345, 'NO');

-- Este INSERT mediante el procedimiento almacenado sí funciona
EXEC InsertarProducto 'Producto G', 30, 10, 120.00, 80.00, 20789012345;
SELECT * FROM Producto WHERE Descripcion = 'Producto G';
REVERT;


