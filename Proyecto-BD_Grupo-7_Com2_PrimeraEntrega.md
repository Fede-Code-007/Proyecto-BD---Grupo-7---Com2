"# Proyecto-BD---Grupo-7---Com2" Primera Entrega.

Alumnos: 
        Diaz, Isaac
        Pérez, Bruno Ezequiel
	      Pérez, Santiago Ezequiel 
	      Pérez Ruiz, Federico
Profesores: 
        Villegas, Darío
	      Cuzziol, Juan José
	      Vallejos, Walter
        Badaracco, Numa 
Institución Educativa: Universidad Nacional del Nordeste – Facultad de Ciencias Exactas y Naturales y Agrimensura 
Carrera: Licenciatura en Sistemas de Información
Fecha de Entrega: 02/10/2024

Año: 2024 

INDICE
Capitulo I: INTRODUCCIÓN	37
        Tema 41
        Planteamiento del Problema 45
        Objetivo del Trabajo	49
        Objetivo Generales	53
        Objetivos Específicos	57
Capítulo II: MARCO CONCEPTUAL	65
Capítulo III: METODOLOGÍA SEGUIDA	67
        Descripción de la elaboración del trabajo	69
        Herramientas	71
Capítulo IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS	73
        Modelo Relacional	75
        Diccionario de Datos	77
Capítulo V: CONCLUSIONES	358
Capítulo VI: BIBLIOGRAFÍA	360


Capítulo I: INTRODUCCIÓN 

Este capítulo introduce el Trabajo Práctico que consiste en el desarrollo de una base de datos para la página web NutriFood, la cual gestionará las operaciones de venta de productos saludables y suplementos. A continuación, se describen el tema, el problema a investigar y los objetivos de la tarea.

Tema 

El tema de este Trabajo Práctico se enfoca en el diseño e implementación de una base de datos para NutriFood, una página web destinada a la gestión de ventas y productos en una tienda de alimentos saludables. La base de datos debe ser robusta y estar optimizada para manejar múltiples transacciones de manera simultánea. Este sistema debe registrar, almacenar y gestionar datos relacionados con productos, usuarios, ventas, inventarios y quejas, asegurando la integridad y seguridad de la información. 

Planteamiento del Problema 

El principal problema que este Trabajo Práctico aborda es la ausencia de una base de datos centralizada y estructurada que permita la gestión eficiente de grandes volúmenes de información en NutriFood. Actualmente, la tienda opera sin un sistema unificado para almacenar y manejar datos críticos, lo que puede resultar en inconsistencias, pérdidas de información, y dificultades en la gestión del inventario y las ventas. Este trabajo plantea las siguientes preguntas: ¿Cómo puede una base de datos relacional optimizar la administración de productos, usuarios y ventas en NutriFood? y ¿Qué estructuras de datos y relaciones son más adecuadas para asegurar la integridad y seguridad de la información en este contexto?

Objetivo del Trabajo 

El objetivo principal del Trabajo Práctico es desarrollar una base de datos que permita a NutriFood gestionar sus productos, usuarios, ventas e inventario de manera eficiente y segura, mejorando así los procesos operativos de la tienda.

Objetivo Generales

Diseñar e implementar una base de datos relacional que soporte la aplicación NutriFood, optimizando el almacenamiento y la gestión de la información relacionada con ventas, productos, usuarios y quejas.

Objetivos Específicos 
 
- Definir las entidades clave del sistema, como productos, usuarios, ventas, inventario y quejas, y sus respectivas relaciones.
- Implementar tablas que permitan realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) de manera eficiente, garantizando la consistencia de los datos.
- Crear mecanismos de seguridad, como encriptación de contraseñas y restricciones de acceso, para proteger la información sensible.
- Optimizar la base de datos para soportar múltiples usuarios y transacciones simultáneas sin degradar el rendimiento del sistema.
- Implementar validaciones y triggers que aseguren la integridad referencial entre las distintas tablas (productos, ventas, usuarios).

Capítulo II: MARCO CONCEPTUAL

Capítulo III: METODOLOGÍA SEGUIDA

Descripción de la elaboración del trabajo

Herramientas 

Capítulo IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

Modelo Relacional 
	
Diccionario de Datos

Características de la Tabla
Nombre	Factura
Módulo	Factura
Descripción	Tabla para almacenar la cabecera de las facturas de las ventas realizadas
Características de los Datos
Campo	          Tipo	Long	Significado
Número Factura	INT	 	      Indica el número de la factura
Fecha	          DATE		    Indica la fecha en que se realizó la venta
Total	          FLOAT	 	    Indica el monto total de la factura
DNI	            INT	 	      DNI de un usuario
Restricciones 
Campo	          Tipo restricción
Número_Factura	PRIMARY KEY
Claves Foráneas
Campo	          Entidad asociada 
DNI	            Usuario

Características de la Tabla
Nombre	Producto
Módulo	Producto
Descripción	Tabla que almacena los productos que se comercializan
Características de los Datos
Campo	          Tipo	    Long	Significado
Código_Producto	INT	 	          Código del producto
Descripción	    VARCHAR	  100 	Descripción del producto
Stock	          INT	 	          Stock del producto
Stock Min	      INT	 	          Stock mínimo del producto
Costo	          FLOAT		        Costo del producto
Precio	        FLOAT	 	        Precio del producto
CUIT	          BIGINT	 	      CUIT del proveedor 
Restricciones 
Campo	          Tipo restricción
Código_Producto	PRIMARY KEY
Claves Foráneas
Campo	          Entidad asociada 
CUIT	          Proveedor

Características de la Tabla
Nombre	Detalle_Producto
Módulo	Detalle_Producto
Descripción	Tabla que almacena un detalle de los productos vendidos para cada factura
Características de los Datos
Campo	          Tipo	Long	Significado
Número_Factura	INT	 	      Número de la factura
Código_Producto	INT	        Código del producto
Cantidad	      INT	 	      Cantidad del producto 
Precio	        FLOAT	 	    Precio del producto en el momento que se realizó la venta 
Restricciones 
Campo	          Tipo restricción
Número_Factura	PRIMARY KEY
Código_Producto	PRIMARY KEY
Claves Foráneas
Campo	          Entidad asociada 
Número_Factura	Factura
Código_Producto	Producto

Características de la Tabla
Nombre	Proveedor
Módulo	Proveedor
Descripción	Tabla para almacenar proveedores
Características de los Datos
Campo	    Tipo	    Long	Significado
CUIT	    BIGINT	 	      CUIT del proveedor
Correo	  VARCHAR	  100	  Correo del proveedor
Teléfono	BIGINT	 	      Teléfono del proveedor
Nombre	  VARCHAR	  100 	Nombre del proveedor
Restricciones 
Campo	    Tipo restricción
CUIT	    PRIMARY KEY
Correo	  UNIQUE
Teléfono	UNIQUE, OPTIONAL
Claves Foráneas
Campo	 Entidad asociada 
  -	         -

Características de la Tabla
Nombre	Usuario
Módulo	Usuario
Descripción	Tabla para almacenar los usuarios
Características de los Datos
Campo	            Tipo	  Long	  Significado
DNI	              INT 	         	DNI del usuario
Correo	          VARCHAR	 100	  Correo del usuario
Nombre	          VARCHAR	 100	  Nombre del usuario
Apellido	        VARCHAR	 100	  Apellido del usuario
Fecha Nacimiento	DATE	 	        Fecha nacimiento del usuario
Código_Perfil	    INT	 	          Código identificador del perfil
Restricciones 
Campo	  Tipo restricción
DNI	    PRIMARY KEY
Correo	UNIQUE
Claves Foráneas
Campo	          Entidad asociada 
Código_Perfil	  Tipo_Perfil 

Características de la Tabla
Nombre	Tipo_Perfil
Módulo	Tipo_Perfil
Descripción	 Tabla para definir los perfiles que puede tener un usuario
Características de los Datos
Campo	          Tipo	    Long	Significado
Código_Perfil	  INT	 	          Identificador de perfil 
Descripción	    VARCHAR	  100  	Descripción del perfil
Restricciones 
Campo	        Tipo restricción
Código_Perfil	PRIMARY KEY
Claves Foráneas
Campo	Entidad asociada 
  -	        -

Características de la Tabla
Nombre	Categorías
Módulo	Categorías
Descripción	 Tabla con las distintas categorías
Características de los Datos
Campo	            Tipo	  Long	Significado
Código_Categoria	INT	 	        identificador de categorías
Descripción	      VARCHAR	100 	Descripción de la categoría
Restricciones 
Campo	            Tipo restricción
Código_Categoria	PRIMARY KEY
Claves Foráneas
Campo	Entidad asociada 
  -          	-

Características de la Tabla
Nombre	Detalle_Categorías
Módulo	Detalle_Categorías
Descripción	Tabla con los detalles de las categorías que posee cada producto 
Características de los Datos
Campo	            Tipo	Long	Significado
Código_Producto	  INT 	 	    Código del producto 
Código_Categoría	INT	 	      Código de la categoría
Restricciones 
Campo	            Tipo restricción
Código_Producto	  PRIMARY KEY
Código_Categoria	PRIMARY KEY
Claves Foráneas
Campo	            Entidad asociada 
Código_Producto	  Producto
Código_Categoria  Categoría

Características de la Tabla
Nombre	Mensajes
Módulo	Mensajes
Descripción	Tabla para almacenar consultas de los clientes
Características de los Datos
Campo	          Tipo	    Long	Significado
Código_Mensaje	INT	 	          Código del mensaje
Asunto	        VARCHAR	  100 	Asunto del mensaje
Descripción	    VARCHAR	  300 	Descripción del mensaje
Fecha	          DATE		        Fecha del mensaje
DNI	            INT	 	          DNI del usuario que consulta
Restricciones 
Campo	          Tipo restricción
Código_Mensaje	PRIMARY KEY
Claves Foráneas
Campo	          Entidad asociada 
DNI	            Usuario

Características de la Tabla
Nombre	País
Módulo	País
Descripción	Tabla con el país de residencia de clientes
Características de los Datos
Campo	        Tipo	    Long	Significado
Código_Pais	  INT	 	          Identificador único del país 
Nombre	      VARCHAR 	100 	Nombre del país 
Restricciones 
Campo	      Tipo restricción
Codigo_Pais	PRIMARY KEY
Claves Foráneas
Campo	      Entidad asociada 
  -	              - 

Características de la Tabla
Nombre	Provincia 
Módulo	Provincia 
Descripción	Tabla que almacena la provincia de residencia de los clientes
Características de los Datos
Campo	              Tipo	    Long	Significado
Codigo_Provincia	  INT	 	          Identificador único de la provincia 
Nombre	            VARCHAR	  100	  Nombre de la provincia
Codigo_Pais	        INT		          Identificador del país al que pertenece
Restricciones 
Campo	            Tipo restricción
Codigo_Provincia	PRIMARY KEY
Claves Foráneas
Campo	            Entidad asociada 
Codigo_Pais	      Pais

Características de la Tabla
Nombre	Localidad
Módulo	Localidad
Descripción	Tabla para almacenar la localidad de los clientes
Características de los Datos
Campo	            Tipo	  Long	Significado
Código_Localidad	INT	 	        Código de la localidad
Nombre	          VARCHAR	100 	Nombre de la localidad
Código_Provincia	INT	 	        Código de la provincia a la que pertenece la localidad
Restricciones 
Campo	            Tipo restricción
Código_Localidad	PRIMARY KEY
Claves Foráneas
Campo	            Entidad asociada 
Código_Provincia	Provincia 

Características de la Tabla
Nombre	Dirección
Módulo	Direcciones
Descripción	Tabla con las direcciones de clientes
Características de los Datos
Campo	             Tipo	    Long	Significado
Codigo_Direccion	 INT	 	        Indica la dirección del usuario 
Calle	             VARCHAR	100	  Indica el nombre de la calle
Altura	           INT		        La altura de la calle
Dpto	             VARCHAR	15	  El departamento, si lo tuviese
Codigo_Localidad	 INT	 	        Indica la localidad a la que pertenece la dirección.
Restricciones 
Campo	            Tipo restricción
Codigo_Direccion	PRIMARY KEY
Dpto	            OPTIONAL
Claves Foráneas
Campo	             Entidad asociada 
Codigo_Localidad	 Localidad

	
Características de la Tabla
Nombre	Detalle_Domicilio
Módulo	Detalle_Domicilio
Descripción	Tabla que almacena a que usuario pertenece cada domicilio
Características de los Datos
Campo	            Tipo	Long	Significado
DNI	              INT 	 	    Indica el DNI del usuario
Codigo_Direccion	INT	 	      Indica la dirección del usuario
Restricciones 
Campo	            Tipo restricción
DNI	              PRIMARY KEY
Codigo_Direccion	PRIMARY KEY
Claves Foráneas
Campo	            Entidad asociada 
DNI	              Usuario
Codigo_Direccion	Dirección

Características de la Tabla
Nombre	Medios_de_Pago
Módulo	Medios_de_Pago
Descripción	Tabla con los medios de pago utilizados
Características de los Datos
Campo	      Tipo	  Long	Significado
Codigo_MP	  INT	 	        Identificador del medio de pago 
Nombre	    VARCHAR	100	  Nombre del medio de pago
Restricciones 
Campo	      Tipo restricción
Codigo_MP	  PRIMARY KEY
Claves Foráneas
Campo      	Entidad asociada 
  -	                -

Características de la Tabla
Nombre	Detalle_Pago
Módulo	Detalle_Pago
Descripción	Tabla con los detalles del pago de cada venta
Características de los Datos
Campo	          Tipo	Long	Significado
Codigo_MP	      INT 	 	    Indica el medio de pago
Número_Factura	INT	 	      Número de la factura 
Monto_Pagado	  FLOAT	 	    Monto a pagar
Nro_Cuotas	    INT	 	      Número de cuotas
Restricciones 
Campo	          Tipo restricción
Codigo_MP	      PRIMARY KEY
Numero_Factura	PRIMARY KEY
Claves Foráneas
Campo	          Entidad asociada 
Codigo_MP	      Medios_de_Pago
Número_Factura	Detalle_Factura


Capítulo V: CONCLUSIONES 

Capítulo VI: BIBLIOGRAFÍA 
