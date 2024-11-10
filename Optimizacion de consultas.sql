/*
Tema: Optimizaci�n de consultas a trav�s de �ndices

Objetivos de Aprendizaje:

	- Conocer los tipos de �ndices y sus aplicaciones.
	- Evaluar el impacto de los �ndices en el rendimiento de las consultas.

Criterios de Evaluaci�n:

	- Medici�n correcta de los tiempos de respuesta antes y despu�s de aplicar �ndices.
	- Documentaci�n detallada de los planes de ejecuci�n de las consultas.
	- Evaluaci�n de la mejora en el rendimiento.

Tareas: 

	1. Realizar una carga masiva de por lo menos un mill�n de registro sobre alguna tabla que contenga un 
	campo fecha (sin �ndice). Hacerlo con un script para poder automatizarlo.

	2. Realizar una b�squeda por periodo y registrar el plan de ejecuci�n utilizado por el motor y los 
	tiempos de respuesta.

	3. Definir un �ndice agrupado sobre la columna fecha y repetir la consulta anterior. Registrar el plan 
	de ejecuci�n utilizado por el motor y los tiempos de respuesta.

	4. Borrar el �ndice creado

	5. Definir otro �ndice agrupado sobre la columna fecha pero que adem�s incluya las columnas 
	seleccionadas y repetir la consulta anterior. Registrar el plan de ejecuci�n utilizado por el 
	motor y los tiempos de respuesta.

	6. Expresar las conclusiones en base a las pruebas realizadas.
*/

USE proyecto_BDD

------------------------------------ 1. Carga Masiva de los datos --------------------------------------------

-- Declaraci�n de variables para la carga masiva
DECLARE @i INT = 1;

-- Bucle para insertar registros de forma masiva
WHILE @i <= 1000000
BEGIN
    INSERT INTO Usuario (DNI, Correo, Nombre, Apellido, Fecha_nacimiento, Codigo_Perfil, Contrase�a, Eliminado)
    VALUES (
        @i, -- DNI (simplemente usa el contador para tener valores �nicos)
        CONCAT('correo', @i, '@ejemplo.com'), -- Correo electr�nico �nico
        CHAR(65 + (@i % 26)), -- Nombre, usando caracteres alfab�ticos (A-Z)
        CHAR(90 - (@i % 26)), -- Apellido, usando caracteres alfab�ticos (Z-A)
        DATEADD(YEAR, -(18 + (RAND() * 82)), GETDATE()), -- Fecha de nacimiento aleatoria
        1 + (@i % 3), -- C�digo_Perfil aleatorio entre 1 y 3
        CONCAT('pass', @i), -- Contrase�a de ejemplo
        'NO' -- Eliminado, con valor fijo 'NO'
    );

    SET @i = @i + 1;
END;

---Vericamos que se hayan insertado los datos
select count (*) from usuario;
select count (*) from Tipo_Perfil;
select top 30 * from usuario order by Fecha_nacimiento asc;

-------------------------------------- 2. Busqueda por periodo ----------------------------------------------

---Busquemos los usuarios nacidos en la decada del 90:

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM Usuario WHERE Fecha_nacimiento >= '1990-01-01' AND Fecha_nacimiento <= '1999-12-31';

/* Plan de ejecucion y tiempos de respuesta:

(121549 rows affected)
Table 'Usuario'. Scan count 1, logical reads 33334, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 281 ms,  elapsed time = 4006 ms.

*/

-------------------------------------- 3. Creaci�n del indice ----------------------------------------------

---Para definir un indice agrupado sobre la columna fecha, debemos borrar el primary key de la tabla usuarios.
---(Esto se debe a que solo puede existir un indice clusterisado por tabla). Para ello eliminaremos tambien las
---claves foraneas asociadas.

ALTER TABLE Detalle_Domicilio
DROP CONSTRAINT FK_detalle_domicilios_usuario;
ALTER TABLE Mensajes
DROP CONSTRAINT FK_mensajes_usuario;
ALTER TABLE Factura
DROP CONSTRAINT FK_factura_usuario;

ALTER TABLE Usuario
DROP CONSTRAINT PK_usuario;

---Creamos el indice.

CREATE CLUSTERED INDEX Index_FechaNacimiento_Usuario
ON Usuario (Fecha_nacimiento);

---Volvemos a crear las keys eliminadas.

ALTER TABLE usuario add constraint  PK_usuario PRIMARY KEY (DNI);

ALTER TABLE Mensajes
ADD CONSTRAINT FK_mensajes_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);
ALTER TABLE Detalle_Domicilio
ADD CONSTRAINT FK_detalle_domicilios_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);
ALTER TABLE Factura
ADD CONSTRAINT FK_factura_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);

--- Ahora ya con el indice creado, ejecutamos la consulta nuevamente:

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM Usuario WHERE Fecha_nacimiento >= '1990-01-01' AND Fecha_nacimiento <= '1999-12-31';

/* Plan de ejecucion y tiempos de respuesta:

(121549 rows affected)
Table 'Usuario'. Scan count 1, logical reads 4190, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 93 ms,  elapsed time = 3901 ms.
*/

-------------------------------------- 4. Eliminaci�n el indice ----------------------------------------------

DROP INDEX [Index_FechaNacimiento_Usuario] ON Usuario;

----------------------------------- 5. Creaci�n del nuevo indice ----------------------------------------------

---Para definir un indice agrupado sobre la columna fecha, debemos borrar el primary key de la tabla usuarios.
---(Esto se debe a que solo puede existir un indice clusterisado por tabla). Para ello eliminaremos tambien las
---claves foraneas asociadas.

ALTER TABLE Detalle_Domicilio
DROP CONSTRAINT FK_detalle_domicilios_usuario;
ALTER TABLE Mensajes
DROP CONSTRAINT FK_mensajes_usuario;
ALTER TABLE Factura
DROP CONSTRAINT FK_factura_usuario;

ALTER TABLE Usuario
DROP CONSTRAINT PK_usuario;

---Creamos el indice.

CREATE CLUSTERED INDEX Index_ColumnasSeleccionadas_Usuario ON Usuario (Fecha_nacimiento, Nombre, Apellido, DNI, Correo);

---Volvemos a crear las keys eliminadas.

ALTER TABLE usuario add constraint  PK_usuario PRIMARY KEY (DNI);

ALTER TABLE Mensajes
ADD CONSTRAINT FK_mensajes_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);
ALTER TABLE Detalle_Domicilio
ADD CONSTRAINT FK_detalle_domicilios_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);
ALTER TABLE Factura
ADD CONSTRAINT FK_factura_usuario
FOREIGN KEY (DNI) REFERENCES Usuario(DNI);

--- Ahora ya con el indice creado, ejecutamos la consulta nuevamente:

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM Usuario WHERE Fecha_nacimiento >= '1990-01-01' AND Fecha_nacimiento <= '1999-12-31';

/* Plan de ejecucion y tiempos de respuesta:

(121549 rows affected)
Table 'Usuario'. Scan count 1, logical reads 4183, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 203 ms,  elapsed time = 3673 ms.

*/

--- DROP INDEX Index_ColumnasSeleccionadas_Usuario ON Usuario;

------------------------------------------ 6. Conclusiones ----------------------------------------------------
/*
En base a los resultados obtenidos podemos concluir que la creaci�n de un �ndice agrupado en la columna 
`Fecha_nacimiento` redujo significativamente el n�mero de lecturas l�gicas necesarias para la consulta, 
lo que sugiere que la consulta fue m�s eficiente y aprovech� mejor la estructura de los datos.
Por otro lado la inclusi�n de otras columnas en un �ndice agrupado adicional, si bien no redujo dr�sticamente 
el tiempo de ejecuci�n comparado con el primer �ndice, optimiz� el acceso a los datos que se estaban buscando, 
reduciendo un poco las lecturas l�gicas adicionales.

Adem�s se observ� una mejora en el tiempo de CPU despu�s de agregar los �ndices, de 281 ms a 93 ms en 
la primera prueba con el �ndice agrupado simple. 
El �ndice agrupado extendido mostr� un tiempo de CPU de 203 ms y un tiempo de ejecuci�n de 3673 ms, 
lo cual fue una mejora sobre la consulta sin �ndice, pero no tan optimizada como el primer �ndice.

En base a lo anterior podemos concluir que:
El uso de �ndices agrupados puede reducir de manera significativa la cantidad de lecturas necesarias y 
optimizar el tiempo de respuesta de las consultas, especialmente en columnas que se utilizan frecuentemente 
en las cl�usulas `WHERE`.
Sin embargo, la elecci�n de las columnas para un �ndice debe ser cuidadosa, ya que la inclusi�n de 
m�ltiples columnas puede no siempre traducirse en mejoras adicionales sustanciales.

*/


