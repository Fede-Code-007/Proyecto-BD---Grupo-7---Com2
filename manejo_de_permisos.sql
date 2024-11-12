/* 

Tema: Manejo de permisos a nivel de usuarios de base de datos.

Objetivos de Aprendizaje:
	- Entender el manejo de permisos y roles en bases de datos.
	- Aplicar permisos de lectura, escritura y ejecución para diferentes roles y usuarios.

Criterios de Evaluación:
	- Precisión en la configuración de permisos y roles para usuarios de base de datos.
	- Correcta implementación y prueba de restricciones de acceso.
	- Documentación detallada del comportamiento de los usuarios según los permisos asignados.

Tareas: 

	1. Verificar que la base de datos esté configurada en modo mixto (autenticación integrada con windows y por usuario de base de datos).
	2. Manejo de permisos a nivel de roles y de usuarios. Implementar un caso práctico para cada uno.

Permisos a nivel de usuarios:
	1. Crear dos usuarios de base de datos.
	2. A un usuario darle el permiso de administrador y al otro usuario solo permiso de lectura.
	3. Utilizar los procedimientos almacenados creados anteriormente.
	4. Al usuario con permiso de solo lectura, darle permiso de ejecución sobre este procedimiento. 
	5. Realizar INSERT con sentencia SQL sobre la tabla del procedimiento con ambos usuarios.
	6. Realizar un INSERT a través del procedimiento almacenado con el usuario con permiso de solo lectura

Permisos a nivel de roles del DBMS:
	1. Crear dos usuarios de base de datos.
	2. Crear un rol que solo permita la lectura de alguna de las tablas creadas.
	3. Darle permiso a uno de los usuarios sobre el rol creado anteriormente.
	4. Verificar el comportamiento de ambos usuarios (el que tiene permiso sobre el rol y el que no tiene), cuando intentan leer el contenido de la tabla
	5. Expresar sus conclusiones
*/


-- Permisos a nivel de usuarios:

  -- 1. Crear un usuario en la base de datos -- 
     
	CREATE LOGIN UsuarioAdmin WITH PASSWORD = 'UsuarioAdmin'; 
	CREATE LOGIN UsuarioLectura WITH PASSWORD = 'UsuarioLectura';
	USE proyecto_BDD;
	CREATE USER UsuarioAdmin FOR LOGIN UsuarioAdmin;
	CREATE USER UsuarioLectura FOR LOGIN UsuarioLectura;

  -- 2. Asignación de permisos -- 
     
	-- concede permiso como administrador
	ALTER ROLE db_owner ADD MEMBER UsuarioAdmin; 


	-- concede permiso únicamente de lectura a un usuario
	ALTER ROLE db_datareader ADD MEMBER UsuarioLectura; 
	
 -- 3. Asignar permiso para el uso de procedimientos almacenados (usuario de solo lectura) --

	GRANT EXECUTE ON InsertarProducto TO UsuarioLectura;

 -- 4. Realizar carga de datos por parte de los usuarios --

	USE proeyecto_BDD;
	INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT) VALUES 
	('Proteína Whey', 50, 10, 1500.00, 1200.00, 20123456789), 
	('Aceite de Coco Orgánico', 30, 5, 500.00, 300.00, 20345678901), 
	('Barras Energéticas', 80, 20, 120.00, 80.00, 20456789012), 
	('Batido Proteico', 60, 10, 1800.00, 1400.00, 20567890123), 
	('Jugo Detox', 100, 15, 250.00, 180.00, 20345678901);

	/*
	Cuando el usuario con permiso de solo lectura quiere realizar un insert este no podrá hacerlo ya que no cuenta con los permisos necesarios para hacerlo. Sin 	embargo, el usuario al cual le fue asignado el permiso como Administrador no debería contar con problemas para hacerlo.
  	*/

  -- 5. Realizar un insert a través del procedimiento almacenado con el usuario con permiso de solo lectura--

	USE proyecto_BDD;
	EXEC InsertarProducto @Descripcion = Jugo Detox, @Stock = 100, @Stock_Min = 15, @Precio = 250.00, @Costo = 180.00, @CUIT = 20345678901; 
	-- Si el permiso fue otorgado correctamente el usuario podría insertar un producto con éxito.

-- Permisos a nivel de roles del DBMS:

  -- 1. Creación de usuarios -- 

   	CREATE LOGIN UsuarioRolLectura WITH PASSWORD = 'ContraseñaLectura';
	CREATE LOGIN UsuarioSinRol WITH PASSWORD = 'ContraseñaSinRol';
	USE proyecto_BDD;
	CREATE USER UsuarioRolLectura FOR LOGIN UsuarioRolLectura;
	CREATE USER UsuarioSinPermiso FOR LOGIN UsuarioSinRol;

 -- 2. Crear rol, otorgar permisos y asignar rol a un usuario --

	CREATE ROLE RolSoloLectura;
	GRANT SELECT ON Producto TO RolSoloLectura;
	ALTER ROLE RolSoloLectura ADD MEMBER UsuarioRolLectura;

 -- 3. Verificación del comportamiento de ambos usuarios --

	-- Para realizar la verificación podemos hacerlo a través de una consulta.
	USE proyecto_BDD;
	SELECT * FROM Producto;

   /*
  	Al hacerlo desde el usuario “UsuarioRolLectura” este no tendría inconvenientes para realizar la consulta ya que cuenta con los permisos necesarios para realizarlo.
	Si lo hacemos desde el “UsuarioSinRol” debería recibir un mensaje de error de permisos, ya que no cuenta con los permisos necesarios para poder realizar la consulta. 
  */

 -- 4. Conclusiones -- 

   /*
	el manejo de roles simplifica la gestión de permisos en nuestro servidor, ya que nos permite asignar funciones a determinados usuarios permitiendo así tener 	mayor control en caso de tener múltiples usuarios en nuestro sistema. 
   */
