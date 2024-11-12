--Permisos a nivel de roles del DBMS:
use proyecto_BDD;

--Crear dos usuarios de base de datos.
CREATE LOGIN LoginRol1 WITH PASSWORD = 'PassSeguro123';
CREATE LOGIN LoginRol2 WITH PASSWORD = 'PassSegura123';

CREATE USER UsuarioRol1 FOR LOGIN LoginRol1;
CREATE USER UsuarioRol2 FOR LOGIN LoginRol2;

--Crear un rol que solo permita la lectura de alguna de las tablas creadas.
CREATE ROLE SoloLectura;
GRANT SELECT ON Producto TO SoloLectura;

--Darle permiso a uno de los usuarios sobre el rol creado anteriormente.
ALTER ROLE SoloLectura ADD MEMBER UsuarioRol1;

--Verificar el comportamiento de ambos usuarios (el que tiene permiso sobre el rol y el que no tiene), 
--cuando intentan leer el contenido de la tabla
-- Como UsuarioRol1, debería poder leer la tabla Producto
EXECUTE AS USER = 'UsuarioRol1';--Solo lectura
SELECT * FROM Producto;
REVERT;

EXECUTE AS USER = 'UsuarioRol2';
SELECT * FROM Producto;
REVERT;
--Lectura denegada
