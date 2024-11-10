/*
Tema: Optimización de consultas a través de índices

Objetivos de Aprendizaje:

	- Conocer los tipos de índices y sus aplicaciones.
	- Evaluar el impacto de los índices en el rendimiento de las consultas.

Criterios de Evaluación:

	- Medición correcta de los tiempos de respuesta antes y después de aplicar índices.
	- Documentación detallada de los planes de ejecución de las consultas.
	- Evaluación de la mejora en el rendimiento.

Tareas: 

	1. Realizar una carga masiva de por lo menos un millón de registro sobre alguna tabla que contenga un 
	campo fecha (sin índice). Hacerlo con un script para poder automatizarlo.

	2. Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los 
	tiempos de respuesta.

	3. Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior. Registrar el plan 
	de ejecución utilizado por el motor y los tiempos de respuesta.

	4. Borrar el índice creado

	5. Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas 
	seleccionadas y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el 
	motor y los tiempos de respuesta.

	6. Expresar las conclusiones en base a las pruebas realizadas.
*/

USE proyecto_BDD

------------------------------------ 1. Carga Masiva de los datos --------------------------------------------

-- Declaración de variables para la carga masiva
DECLARE @i INT = 1;

-- Bucle para insertar registros de forma masiva
WHILE @i <= 1000000
BEGIN
    INSERT INTO Usuario (DNI, Correo, Nombre, Apellido, Fecha_nacimiento, Codigo_Perfil, Contraseña, Eliminado)
    VALUES (
        @i, -- DNI (simplemente usa el contador para tener valores únicos)
        CONCAT('correo', @i, '@ejemplo.com'), -- Correo electrónico único
        CHAR(65 + (@i % 26)), -- Nombre, usando caracteres alfabéticos (A-Z)
        CHAR(90 - (@i % 26)), -- Apellido, usando caracteres alfabéticos (Z-A)
        DATEADD(YEAR, -(18 + (RAND() * 82)), GETDATE()), -- Fecha de nacimiento aleatoria
        1 + (@i % 3), -- Código_Perfil aleatorio entre 1 y 3
        CONCAT('pass', @i), -- Contraseña de ejemplo
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

-------------------------------------- 3. Creación del indice ----------------------------------------------

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

-------------------------------------- 4. Eliminación el indice ----------------------------------------------

DROP INDEX [Index_FechaNacimiento_Usuario] ON Usuario;

----------------------------------- 5. Creación del nuevo indice ----------------------------------------------

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
En base a los resultados obtenidos podemos concluir que la creación de un índice agrupado en la columna 
`Fecha_nacimiento` redujo significativamente el número de lecturas lógicas necesarias para la consulta, 
lo que sugiere que la consulta fue más eficiente y aprovechó mejor la estructura de los datos.
Por otro lado la inclusión de otras columnas en un índice agrupado adicional, si bien no redujo drásticamente 
el tiempo de ejecución comparado con el primer índice, optimizó el acceso a los datos que se estaban buscando, 
reduciendo un poco las lecturas lógicas adicionales.

Además se observó una mejora en el tiempo de CPU después de agregar los índices, de 281 ms a 93 ms en 
la primera prueba con el índice agrupado simple. 
El índice agrupado extendido mostró un tiempo de CPU de 203 ms y un tiempo de ejecución de 3673 ms, 
lo cual fue una mejora sobre la consulta sin índice, pero no tan optimizada como el primer índice.

En base a lo anterior podemos concluir que:
El uso de índices agrupados puede reducir de manera significativa la cantidad de lecturas necesarias y 
optimizar el tiempo de respuesta de las consultas, especialmente en columnas que se utilizan frecuentemente 
en las cláusulas `WHERE`.
Sin embargo, la elección de las columnas para un índice debe ser cuidadosa, ya que la inclusión de 
múltiples columnas puede no siempre traducirse en mejoras adicionales sustanciales.

*/


