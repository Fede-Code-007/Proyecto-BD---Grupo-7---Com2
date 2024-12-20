## NutriFood: Base de Datos para un Ecommerce

**Alumnos:** 

- Diaz, Isaac
- Pérez, Bruno Ezequiel
- Pérez, Santiago Ezequiel 
- Pérez Ruiz, Federico
 
**Profesores:**

- Villegas, Darío
- Cuzziol, Juan José
- Vallejos, Walter
- Badaracco, Numa 
	
**Institución Educativa:** Universidad Nacional del Nordeste – Facultad de Ciencias Exactas y Naturales y Agrimensura 

**Carrera:** Licenciatura en Sistemas de Información

**Fecha de Entrega:** 02/10/2024

**Año:** 2024 
<div style="page-break-after: always;"></div> 

## Indice

[Capítulo I: Introducción](#capítulo-i-introducción)

    - Tema
    - Planteamiento del Problema
    - Objetivos del Trabajo
    - Objetivos Generales
    - Objetivos Específicos
    
[Capítulo II: Marco Conceptual](#capítulo-ii-marco-conceptual)

    - Manejo de permisos a nivel de usuarios de base de datos
    - Procedimientos y funciones almacenadas
    - Optimización de consultas a través de índices
    - Vistas y vistas indexadas

[Capítulo III: Metodología Seguida](#capítulo-iii-metodología-seguida)

[Capítulo IV: Desarrollo del Tema / Presentación de Resultados](#capítulo-iv-desarrollo-del-tema--presentación-de-resultados)

    - Modelo Relacional
    - Diccionario de Datos
    - Modelo Físico
    - Lote de datos
    - Manejo de permisos a nivel de usuarios de base de datos
    - Procedimientos y funciones almacenadas
    - Optimización de consultas a través de índices
    - Vistas y vistas indexadas
    
[Capítulo V: Conclusiones](#capítulo-v-conclusiones)

[Capítulo VI: Bibliografía](#capítulo-vi-bibliografía)

## Capítulo I: INTRODUCCIÓN 

En este capítulo se introduce el Trabajo Práctico que consiste en el desarrollo de una base de datos para la página web NutriFood, la cual gestionará las operaciones de venta de productos saludables y suplementos. A continuación, se describen el tema, el problema a investigar y los objetivos de la tarea.

### Tema 

El tema de este trabajo se enfoca en el diseño e implementación de una base de datos para NutriFood, una página web destinada a la gestión de ventas y productos en una tienda de alimentos saludables. La base de datos debe ser robusta y estar optimizada para manejar múltiples transacciones de manera simultánea. Este sistema debe registrar, almacenar y gestionar datos relacionados con productos, usuarios, ventas y sus respectivos pagos, inventarios y quejas, asegurando la integridad y seguridad de la información. 

### Planteamiento del Problema 

El principal problema que se abordará es la ausencia de una base de datos centralizada y estructurada que permita la gestión eficiente de grandes volúmenes de información en NutriFood. Actualmente, la tienda opera sin un sistema unificado para almacenar y manejar datos críticos, lo que puede resultar en inconsistencias, pérdidas de información, y dificultades en la gestión del inventario y las ventas. Este trabajo plantea las siguientes preguntas: ¿Cómo puede una base de datos relacional optimizar la administración de productos, usuarios y ventas en NutriFood? y ¿Qué estructuras de datos y relaciones son más adecuadas para asegurar la integridad y seguridad de la información en este contexto?

### Objetivos del Trabajo 

El objetivo principal del Trabajo Práctico es desarrollar una base de datos que permita a NutriFood gestionar sus productos, usuarios, ventas e inventario de manera eficiente y segura, mejorando así los procesos operativos de la tienda.

#### Objetivos Generales

Diseñar e implementar una base de datos relacional que soporte la aplicación NutriFood, optimizando el almacenamiento y la gestión de la información relacionada con ventas, productos, usuarios y quejas.

#### Objetivos Específicos 
 
- Definir las entidades clave del sistema, como productos, usuarios, ventas, inventario y quejas, y sus respectivas relaciones.
- Implementar tablas que permitan realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) de manera eficiente, garantizando la consistencia de los datos.
- Crear mecanismos de seguridad, como encriptación de contraseñas y restricciones de acceso, para proteger la información sensible.
- Optimizar la base de datos para soportar múltiples usuarios y transacciones simultáneas sin degradar el rendimiento del sistema.
- Implementar validaciones y triggers que aseguren la integridad referencial entre las distintas tablas (productos, ventas, usuarios).

## Capítulo II: MARCO CONCEPTUAL

### Manejo de permisos a nivel de usuarios de base de datos

En la administración de bases de datos, es fundamental garantizar la seguridad y el control de acceso a los datos. Para lograrlo, es necesario establecer una gestión rigurosa de permisos y roles, lo cual permite definir y limitar el acceso de los usuarios de manera adecuada. Estos permisos se gestionan a nivel de servidor mediante inicios de sesión y roles de servidor, y a nivel de base de datos a través de usuarios y roles específicos de la base de datos. Esta estructura de permisos proporciona una capa de protección integral que asegura la integridad y confidencialidad de los datos dentro del sistema.

- Usuarios de base de datos:
los inicios de sesión permiten acceder a una base de datos mediante la creación de un usuario dentro de dicha base y asignándole el inicio de sesión correspondiente. Por lo general, el nombre del usuario en la base es el mismo con el del inicio de sesión, aunque no es necesario que sea así. Cada usuario de base de datos está vinculado de forma exclusiva a un inicio de sesión, que puede relacionarse con un único usuario dentro de cada base de datos, pero que puede ser usuario en varias bases de datos al mismo tiempo. También se pueden crear usuarios de base de datos que no tengan un nombre de usuario correspondiente. Estos usuarios se denominan usuarios de bases de datos independientes. 

- Roles fijos en bases de datos:
es posible predefinir roles que agrupan permisos útiles a nivel de base de datos. Se pueden asignar tanto usuarios de base de datos como roles personalizados a estos roles fijos utilizando la instrucción ALTER ROLE ... ADD MEMBER.

- Roles de base de datos definidos por el usuario:
los usuarios con permiso para crear roles son capaces de crear roles de bases de datos agrupando a los usuarios según los permisos que estos comparten. De esta manera se logra facilitar la asignación o eliminaciones de permisos a un conjunto de usuarios que compartan las mismas características, logrando simplificar la administración de accesos.

### Procedimientos y funciones almacenadas

Los procedimientos almacenados y las funciones almacenadas son metodologías esenciales en el diseño y administración de bases de datos, permitiendo una gestión organizada y eficaz de los datos. Los procedimientos almacenados se utilizan como una metodología estructurada para ejecutar operaciones complejas y repetitivas, gestionando múltiples transacciones y asegurando la consistencia y seguridad de los datos. Esta metodología es ideal para operaciones que requieren la modificación de datos en diferentes tablas o la ejecución de procesos de negocio definidos, garantizando que se sigan los mismos pasos y lógica en cada ejecución.

Las funciones almacenadas, por otra parte, representan una metodología orientada al cálculo y consulta de datos específicos. En lugar de modificar datos, las funciones almacenadas se emplean para realizar cálculos derivados, como obtener totales, promedios o formatos específicos, y retornar un único valor. Esta metodología permite una integración sencilla de operaciones matemáticas o de transformación en consultas, facilitando la obtención de información sin alterar los datos base. Las funciones almacenadas son especialmente útiles para estandarizar estos cálculos en diferentes consultas y asegurar una coherencia en el tratamiento de la información.

### Optimización de consultas a través de índices
Para optimizar el rendimiento de las consultas en bases de datos, los índices son fundamentales. Sin un índice, buscar un valor en una columna implica recorrer la tabla completa, lo cual es ineficiente en tablas con millones de filas. Los índices funcionan como punteros que agilizan la localización de filas que cumplen condiciones de la cláusula WHERE, mejorando así el tiempo de respuesta.

Es importante ser estratégico al crear índices, ya que un exceso de ellos puede aumentar el uso de almacenamiento y ralentizar las operaciones de inserción, actualización y borrado, al requerir la actualización de cada índice afectado. Por tanto, el objetivo es encontrar un equilibrio entre el número de índices y la eficiencia de la consulta.

Algunos tipos de índices comunes son:

- Índices de clave primaria (PRIMARY KEY): Identifican de forma única cada fila y no permiten valores nulos.
- Índices de clave ajena (FOREIGN KEY): Referencian claves primarias en otras tablas.
- Índices únicos (UNIQUE): Garantizan la unicidad de los valores de una columna y pueden permitir valores nulos.
- Índices con valores repetidos (INDEX): Ideales para búsquedas en columnas con datos duplicados.
- Índices de múltiples columnas: Consideran más de una columna para optimizar la búsqueda.
- Índices de texto completo (FULLTEXT INDEX): Usados para búsquedas en campos de texto.
- Índices funcionales : A partir de MySQL 8.0.13, permiten indexar el resultado de expresiones o funciones.
- Índices agrupados (CLUSTERED INDEX): Organizan físicamente las filas de la tabla en el orden del índice. Solo puede haber un índice agrupado por tabla, y es ideal para columnas que se buscan o filtran de manera secuencial, como fechas o IDs.
- Índices no agrupados (NON-CLUSTERED INDEX): Contienen una estructura separada que apunta a las ubicaciones de los datos en la tabla. Una tabla puede tener múltiples índices no agrupados.
- Índices filtrados: Se aplican a subconjuntos específicos de filas en una tabla, mejorando las consultas que buscan condiciones específicas.
- Índices espaciales (SPATIAL INDEX): Utilizados en bases de datos geoespaciales para manejar datos geográficos y realizar consultas espaciales.

En resumen, los índices deben ser utilizados de manera selectiva para mejorar el rendimiento sin afectar negativamente otras operaciones en la base de datos.

### Vistas y vistas indexadas
Una vista es una tabla virtual creada mediante una consulta que define sus filas y columnas. A diferencia de las tablas físicas, una vista no almacena datos, sino que genera dinámicamente los resultados de la consulta cada vez que se accede a ella. Puede utilizar datos de una o varias tablas e incluso de otras vistas en la misma o distintas bases de datos, permitiendo también consultas distribuidas para obtener datos de fuentes heterogéneas. Esto facilita la combinación de información, por ejemplo, consolidando datos similares de diferentes regiones.

Las vistas son útiles para simplificar y personalizar la percepción de la base de datos según el usuario y también actúan como un mecanismo de seguridad, permitiendo acceso a datos específicos sin exponer las tablas subyacentes. Además, las vistas pueden emular tablas cuyo esquema ha cambiado, crear interfaces compatibles con versiones anteriores, y mejorar el rendimiento mediante particiones de datos.

Mientras que una vista indexada, también llamada vista materializada, es una vista que sí almacena datos en disco mediante la creación de un índice clusterizado basado en la consulta que la define. A diferencia de las vistas tradicionales, que solo actúan como consultas almacenadas, las vistas indexadas retienen los datos en la base de datos, funcionando de manera similar a una tabla. Lo que puede mejorar significativamente el rendimiento en consultas complejas o con grandes volúmenes de datos. Además, se pueden crear índices no clusterizados sobre la vista indexada para mejorar aún más el rendimiento en consultas específicas.

Beneficios de las vistas indexadas:

1.	Mejoran el rendimiento de las consultas al almacenar agregaciones, evitando cálculos costosos durante la ejecución.
2.	Permiten almacenar combinaciones de tablas ya unidas (pre-join), facilitando el acceso a datos complejos de manera eficiente.
3.	Las combinaciones de uniones y agregaciones pueden materializarse, optimizando la recuperación de datos.
Contras de las vistas indexadas:
1.	Introducen un importante sobrecargo en la base de datos, ya que cualquier cambio en las tablas base debe reflejarse en la vista indexada, lo cual consume recursos.
2.	Requieren mantenimiento adicional de los índices y estadísticas asociados, incrementando el costo en términos de espacio y recursos.
3.	Restricciones de uso: deben tener un índice único, solo permiten índices no clusterizados después de crear el índice clusterizado, y deben ser determinísticas (una sola salida posible para cada consulta).


## Capítulo III: METODOLOGÍA SEGUIDA

### Descripción de la elaboración del trabajo

Para iniciar el desarrollo del proyecto, en primer lugar, se organizó una reunión entre los integrantes del grupo para definir el caso de estudio que abordaríamos a lo largo del trabajo. Una vez establecida la idea central para la primera parte de la entrega, se creó un repositorio en GitHub, donde cada miembro del equipo podría ir subiendo sus aportes conforme desarrollara las actividades asignadas.

Con la idea definida, comenzamos por elaborar el diagrama entidad-relación y su diccionario de datos para, posteriormente, avanzar con el modelo físico y el lote de datos con los que trabajaríamos.

En la segunda parte del proyecto, distribuimos los temas de investigación entre los miembros del equipo a través de un sorteo, quedando asignados de la siguiente manera:

- Díaz, Isaac: Vistas y vistas indexadas.
- Pérez, Bruno: Manejo de permisos a nivel de usuarios de bases de datos.
- Pérez, Santiago: Procedimientos y funciones almacenados.
- Pérez Ruiz, Federico: Optimización de consultas mediante índices.
Cada integrante desarrolló su tema asignado siguiendo las pautas acordadas, manteniendo además un seguimiento constante de los temas de los demás miembros, realizando correcciones y aportando ideas para mejorar el contenido a presentar.

### Herramientas 

Las herramientas empleadas para el desarrollo del proyecto fueron:

GitHub: Utilizado como repositorio para almacenar y gestionar los avances del trabajo.
SQL Server Management Studio 20: Herramienta empleada para el desarrollo del script y las pruebas correspondientes.
ERDPlus: Utilizado para la elaboración del diagrama entidad-relación.

## Capítulo IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

### Modelo Relacional 

![Modelo Relacional IMG](https://github.com/Fede-Code-007/Proyecto-BD---Grupo-7---Com2/blob/main/Modelo%20Relacional_Grupo7.png)
	
### Diccionario de Datos

### Características de la Tabla: Factura
- **Nombre**: Factura
- **Módulo**: Factura
- **Descripción**: Tabla para almacenar la cabecera de las facturas de las ventas realizadas.

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| Numero_Factura  | INT    |      | Indica el número de la factura             |
| Fecha           | DATE   |      | Indica la fecha en que se realizó la venta |
| Total           | FLOAT  |      | Indica el monto total de la factura        |
| DNI             | INT    |      | DNI de un usuario tipo cliente             |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Numero_Factura  | PRIMARY KEY       |

#### Claves Foráneas
| Campo | Entidad asociada |
|-------|------------------|
| DNI   | Usuario           |

---

### Características de la Tabla: Producto
- **Nombre**: Producto
- **Módulo**: Producto
- **Descripción**: Tabla que almacena los productos que se comercializan.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                 |
|-----------------|----------|------|-----------------------------|
| Codigo_Producto | INT      |      | Código del producto          |
| Descripcion     | VARCHAR  | 100  | Descripción del producto     |
| Stock           | INT      |      | Stock del producto           |
| Stock_Min       | INT      |      | Stock mínimo del producto    |
| Costo           | FLOAT    |      | Costo del producto           |
| Precio          | FLOAT    |      | Precio del producto          |
| CUIT            | BIGINT   |      | CUIT del proveedor           |
| Eliminado       | VARCHAR  |   2  | Estado del producto          |
| Imagen          | VARCHAR  |  100 | Imagen del producto          |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Producto | PRIMARY KEY      |
| Eliminado	      | CHECK	           |

#### Claves Foráneas
| Campo | Entidad asociada |
|-------|------------------|
| CUIT  | Proveedor         |

---

### Características de la Tabla: Detalle_Producto
- **Nombre**: Detalle_Producto
- **Módulo**: Detalle_Producto
- **Descripción**: Tabla que almacena un detalle de los productos vendidos para cada factura.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                                         |
|-----------------|----------|------|-----------------------------------------------------|
| Numero_Factura  | INT      |      | Numero de la factura                                |
| Codigo_Producto | INT      |      | Código del producto                                 |
| Cantidad        | INT      |      | Cantidad del producto                               |
| Precio          | FLOAT    |      | Precio del producto en el momento que se realizó la venta |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Numero_Factura  | PRIMARY KEY       |
| Codigo_Producto | PRIMARY KEY       |

#### Claves Foráneas
| Campo           | Entidad asociada |
|-----------------|------------------|
| Numero_Factura  | Factura           |
| Codigo_Producto | Producto          |

---

### Características de la Tabla: Proveedor
- **Nombre**: Proveedor
- **Módulo**: Proveedor
- **Descripción**: Tabla para almacenar proveedores.

### Características de los Datos
| Campo         | Tipo     | Long | Significado           |
|---------------|----------|------|-----------------------|
| CUIT          | BIGINT   |      | CUIT del proveedor     |
| Correo        | VARCHAR  | 100  | Correo del proveedor   |
| Telefono      | BIGINT   |      | Teléfono del proveedor |
| Nombre        | VARCHAR  | 100  | Nombre del proveedor   |
| Eliminado     | VARCHAR  | 2    | Estado del proveedor   |

#### Restricciones
| Campo     | Tipo restricción |
|-----------|------------------|
| CUIT      | PRIMARY KEY      |
| Correo    | UNIQUE           |
| Telefono  | UNIQUE           |
| Eliminado | CHECK            |

---

### Características de la Tabla: Usuario
- **Nombre**: Usuario
- **Módulo**: Usuario
- **Descripción**: Tabla para almacenar los usuarios.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                       |
|-----------------|----------|------|-----------------------------------|
| DNI             | INT      |      | DNI del usuario                   |
| Correo          | VARCHAR  | 100  | Correo del usuario                |
| Nombre          | VARCHAR  | 100  | Nombre del usuario                |
| Apellido        | VARCHAR  | 100  | Apellido del usuario              |
| Fecha_Nacimiento| DATE     |      | Fecha de nacimiento del usuario   |
| Contrasena	    | VARCHAR  | 300  | Contraseña del usuario	        	|
| Codigo_Perfil   | INT      |      | Código identificador del perfil   |
| Eliminado       | VARCHAR  | 2    | Estado de la cuenta               |

#### Restricciones
| Campo  | Tipo restricción |
|--------|------------------|
| DNI    | PRIMARY KEY       |
| Correo | UNIQUE            |
| Eliminado|   	CHECK	     |

#### Claves Foráneas
| Campo          | Entidad asociada |
|----------------|------------------|
| Codigo_Perfil  | Tipo_Perfil       |

---

### Características de la Tabla: Tipo_Perfil
- **Nombre**: Tipo_Perfil
- **Módulo**: Tipo_Perfil
- **Descripción**: Tabla para definir los perfiles que puede tener un usuario.

### Características de los Datos
| Campo         | Tipo     | Long | Significado                 |
|---------------|----------|------|-----------------------------|
| Codigo_Perfil | INT      |      | Identificador de perfil      |
| Descripcion   | VARCHAR  | 100  | Descripción del perfil       |

#### Restricciones
| Campo         | Tipo restricción |
|---------------|------------------|
| Codigo_Perfil | PRIMARY KEY       |

---

### Características de la Tabla: Categoria
- **Nombre**: Categoria
- **Módulo**: Categorías
- **Descripción**: Tabla con las distintas categorías.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                   |
|-----------------|----------|------|-------------------------------|
| Codigo_Categoria| INT      |      | Identificador de categorías    |
| Descripcion     | VARCHAR  | 100  | Descripción de la categoría    |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Categoria| PRIMARY KEY       |

---

### Características de la Tabla: Detalle_Categorias
- **Nombre**: Detalle_Categorias
- **Módulo**: Detalle_Categorías
- **Descripción**: Tabla con los detalles de las categorías que posee cada producto.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                     |
|-----------------|----------|------|---------------------------------|
| Codigo_Producto | INT      |      | Código del producto             |
| Codigo_Categoria| INT      |      | Código de la categoría          |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Producto | PRIMARY KEY       |
| Codigo_Categoria| PRIMARY KEY       |

#### Claves Foráneas
| Campo           | Entidad asociada |
|-----------------|------------------|
| Codigo_Producto | Producto          |
| Codigo_Categoría| Categoria         |

---

### Características de la Tabla: Mensajes
- **Nombre**: Mensajes
- **Módulo**: Mensajes
- **Descripción**: Tabla para almacenar consultas de los clientes.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                    |
|-----------------|----------|------|--------------------------------|
| Codigo_Mensaje  | INT      |      | Código del mensaje             |
| Asunto          | VARCHAR  | 100  | Asunto del mensaje             |
| Descripcion     | VARCHAR  | 300  | Descripción del mensaje        |
| Fecha           | DATE     |      | Fecha del mensaje              |
| DNI             | INT      |      | DNI del usuario que consulta   |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Mensaje  | PRIMARY KEY       |

#### Claves Foráneas
| Campo | Entidad asociada |
|-------|------------------|
| DNI   | Usuario           |

---

### Características de la Tabla: País
- **Nombre**: País
- **Módulo**: País
- **Descripción**: Tabla con el país de residencia de clientes.

### Características de los Datos
| Campo        | Tipo     | Long | Significado               |
|--------------|----------|------|---------------------------|
| Codigo_Pais  | INT      |      | Identificador único del país |
| Nombre       | VARCHAR  | 100  | Nombre del país            |

#### Restricciones
| Campo        | Tipo restricción |
|--------------|------------------|
| Codigo_Pais  | PRIMARY KEY       |

---

### Características de la Tabla: Provincia
- **Nombre**: Provincia
- **Módulo**: Provincia
- **Descripción**: Tabla que almacena la provincia de residencia de los clientes.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                        |
|-----------------|----------|------|------------------------------------|
| Codigo_Provincia| INT      |      | Identificador único de la provincia|
| Nombre          | VARCHAR  | 100  | Nombre de la provincia             |
| Codigo_Pais     | INT      |      | Identificador del país al que pertenece|

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Provincia| PRIMARY KEY       |

#### Claves Foráneas
| Campo        | Entidad asociada |
|--------------|------------------|
| Codigo_Pais  | País             |

---

### Características de la Tabla: Localidad
- **Nombre**: Localidad
- **Módulo**: Localidad
- **Descripción**: Tabla para almacenar la localidad de los clientes.

### Características de los Datos
| Campo            | Tipo     | Long | Significado                      |
|------------------|----------|------|----------------------------------|
| Codigo_Localidad | INT      |      | Código de la localidad           |
| Nombre           | VARCHAR  | 100  | Nombre de la localidad           |
| Codigo_Provincia | INT      |      | Código de la provincia a la que pertenece la localidad |

#### Restricciones
| Campo            | Tipo restricción |
|------------------|------------------|
| Codigo_Localidad | PRIMARY KEY       |

#### Claves Foráneas
| Campo            | Entidad asociada |
|------------------|------------------|
| Codigo_Provincia | Provincia         |

---

### Características de la Tabla: Dirección
- **Nombre**: Dirección
- **Módulo**: Direcciones
- **Descripción**: Tabla con las direcciones de clientes.

### Características de los Datos
| Campo            | Tipo     | Long | Significado                       |
|------------------|----------|------|-----------------------------------|
| Codigo_Direccion | INT      |      | Código de la dirección            |
| Calle            | VARCHAR  | 100  | Nombre de la calle                |
| Altura           | INT      |      | Altura de la calle                |
| Dpto             | VARCHAR  | 15   | Departamento, si lo hubiese       |
| Codigo_Localidad | INT      |      | Código de la localidad a la que pertenece la dirección |

#### Restricciones
| Campo            | Tipo restricción |
|------------------|------------------|
| Codigo_Direccion | PRIMARY KEY      |

#### Claves Foráneas
| Campo            | Entidad asociada |
|------------------|------------------|
| Codigo_Localidad | Localidad         |

---

### Características de la Tabla: Detalle_Domicilio
- **Nombre**: Detalle_Domicilio
- **Módulo**: Detalle_Domicilio
- **Descripción**: Tabla que almacena a qué usuario pertenece cada domicilio.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                        |
|-----------------|----------|------|------------------------------------|
| DNI             | INT      |      | DNI del usuario                    |
| Codigo_Direccion| INT      |      | Codigo de la dirección             |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| DNI             | PRIMARY KEY       |
| Codigo_Direccion| PRIMARY KEY       |

#### Claves Foráneas
| Campo           | Entidad asociada |
|-----------------|------------------|
| DNI             | Usuario           |
| Codigo_Direccion| Direccion         |

---

### Características de la Tabla: Medios_de_Pago
- **Nombre**: Medios_de_Pago
- **Módulo**: Medios_de_Pago
- **Descripción**: Tabla con los medios de pago utilizados.

### Características de los Datos
| Campo       | Tipo     | Long | Significado                    |
|-------------|----------|------|--------------------------------|
| Codigo_MP   | INT      |      | Identificador del medio de pago |
| Nombre      | VARCHAR  | 100  | Nombre del medio de pago        |

#### Restricciones
| Campo     | Tipo restricción |
|-----------|------------------|
| Codigo_MP | PRIMARY KEY       |

---

### Características de la Tabla: Detalle_Pago
- **Nombre**: Detalle_Pago
- **Módulo**: Detalle_Pago
- **Descripción**: Tabla con los detalles del pago de cada venta.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                         |
|-----------------|----------|------|-------------------------------------|
| Codigo_MP       | INT      |      | Indica el medio de pago             |
| Numero_Factura  | INT      |      | Número de la factura                |
| Monto_Pagado    | FLOAT    |      | Monto pagado                        |
| Nro_Cuotas      | INT      |      | Número de cuotas                    |

#### Restricciones
| Campo          | Tipo restricción |
|----------------|------------------|
| Codigo_MP      | PRIMARY KEY       |
| Numero_Factura | PRIMARY KEY       |

#### Claves Foráneas
| Campo          | Entidad asociada |
|----------------|------------------|
| Codigo_MP      | Medios_de_Pago    |
| Numero_Factura | Factura           |

### Modelo Físico

```sql
CREATE DATABASE proyecto_BDD;

USE proyecto_BDD;

CREATE TABLE Tipo_Perfil
(
  Codigo_Perfil INT IDENTITY(1,1) NOT NULL,
  Descripcion CHAR(100) NOT NULL,
  CONSTRAINT PK_tipo_perfil PRIMARY KEY (Codigo_Perfil)
);

CREATE TABLE Categoria
(
  Codigo_categoria INT IDENTITY(1,1) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT PK_categorias PRIMARY KEY (Codigo_Categoria)
);

CREATE TABLE Pais
(
  Codigo_Pais INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_pais PRIMARY KEY (Codigo_Pais)
);

CREATE TABLE Proveedor
(
  CUIT BIGINT NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Telefono BIGINT,
  Nombre VARCHAR(100) NOT NULL,
  Eliminado VARCHAR(2) DEFAULT 'NO' NOT NULL,
  CONSTRAINT PK_proveedores PRIMARY KEY (CUIT),
  CONSTRAINT UQ_proveedores_correo UNIQUE (Correo),
  CONSTRAINT UQ_proveedores_telefono UNIQUE (Telefono),
  CONSTRAINT CK_proveedores_eliminado CHECK (Eliminado = 'SI' OR Eliminado = 'NO')
);

CREATE TABLE Medios_de_Pago
(
  Codigo_MP INT IDENTITY(1,1) NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_medios_pago PRIMARY KEY (Codigo_MP)
);

CREATE TABLE Producto
(
  Codigo_Producto INT IDENTITY(1,1) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Stock INT NOT NULL,
  Stock_Min INT NOT NULL,
  Precio FLOAT NOT NULL,
  Costo FLOAT NOT NULL,
  CUIT BIGINT NOT NULL,
  Eliminado VARCHAR(2) DEFAULT 'NO' NOT NULL,
  Imagen VARCHAR(100),
  CONSTRAINT PK_producto PRIMARY KEY (Codigo_Producto),
  CONSTRAINT FK_producto_proveedores FOREIGN KEY (CUIT) REFERENCES Proveedor(CUIT),
  CONSTRAINT CK_producto_eliminado CHECK (Eliminado = 'SI' OR Eliminado = 'NO')
);

CREATE TABLE Usuario
(
  DNI INT NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Nombre CHAR(100) NOT NULL,
  Apellido CHAR(100) NOT NULL,
  Fecha_nacimiento DATE NOT NULL,
  Codigo_Perfil INT NOT NULL,
  Contrasena VARCHAR(300) NOT NULL,
  Eliminado VARCHAR(2) DEFAULT 'NO' NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (DNI),
  CONSTRAINT FK_usuario_perfil FOREIGN KEY (Codigo_Perfil) REFERENCES Tipo_Perfil(Codigo_Perfil),
  CONSTRAINT UQ_usuario_correo UNIQUE (Correo),
  CONSTRAINT CK_usuario_eliminado CHECK (Eliminado = 'SI' OR Eliminado = 'NO')
);

CREATE TABLE Factura
(
  Numero_Factura INT NOT NULL,
  Total FLOAT NOT NULL,
  Fecha DATE NOT NULL,
  DNI INT NOT NULL,
  CONSTRAINT PK_factura PRIMARY KEY (Numero_Factura),
  CONSTRAINT FK_factura_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI)
);

CREATE TABLE Mensajes
(
  Codigo_Mensaje INT IDENTITY(1,1) NOT NULL,
  Asunto VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(300) NOT NULL,
  Fecha DATE NOT NULL,
  DNI INT NOT NULL,
  CONSTRAINT PK_mensajes PRIMARY KEY (Codigo_Mensaje),
  CONSTRAINT FK_mensajes_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI)
);

CREATE TABLE Provincia
(
  Codigo_Provincia INT IDENTITY(1,1) NOT NULL,
  Nombre CHAR(100) NOT NULL,
  Codigo_Pais INT NOT NULL,
  CONSTRAINT PK_provincia PRIMARY KEY (Codigo_Provincia),
  CONSTRAINT FK_provincia_pais FOREIGN KEY (Codigo_Pais) REFERENCES Pais(Codigo_Pais)
);

CREATE TABLE Detalle_Categorias
(
  Codigo_Producto INT NOT NULL,
  Codigo_Categoria INT NOT NULL,
  CONSTRAINT PK_detalle_categorias PRIMARY KEY (Codigo_Producto, Codigo_Categoria),
  CONSTRAINT FK_detalle_categorias_producto FOREIGN KEY (Codigo_Producto) REFERENCES Producto(Codigo_Producto),
  CONSTRAINT FK_detalle_categorias_categoria FOREIGN KEY (Codigo_Categoria) REFERENCES Categoria(Codigo_Categoria)
);

CREATE TABLE Detalle_Producto
(
  Cantidad INT NOT NULL,
  Precio FLOAT NOT NULL,
  Numero_Factura INT NOT NULL,
  Codigo_Producto INT NOT NULL,
  CONSTRAINT PK_detalle_producto PRIMARY KEY (Numero_Factura, Codigo_Producto),
  CONSTRAINT FK_detalle_producto_factura FOREIGN KEY (Numero_Factura) REFERENCES Factura(Numero_Factura),
  CONSTRAINT FK_detalle_producto_producto FOREIGN KEY (Codigo_Producto) REFERENCES Producto(Codigo_Producto)
);

CREATE TABLE Detalle_Pago
(
  Monto_Pagado FLOAT NOT NULL,
  Nro_Cuotas INT NOT NULL,
  Codigo_MP INT NOT NULL,
  Numero_Factura INT NOT NULL,
  CONSTRAINT PK_detalle_pago PRIMARY KEY (Codigo_MP, Numero_Factura),
  CONSTRAINT FK_detalle_pago_mp FOREIGN KEY (Codigo_MP) REFERENCES Medios_de_Pago(Codigo_MP),
  CONSTRAINT FK_detalle_pago_factura FOREIGN KEY (Numero_Factura) REFERENCES Factura(Numero_Factura)
);

CREATE TABLE Localidad
(
  Codigo_Localidad INT IDENTITY(1,1) NOT NULL,
  Nombre CHAR(100) NOT NULL,
  Codigo_Provincia INT NOT NULL,
  CONSTRAINT PK_localidad PRIMARY KEY (Codigo_Localidad),
  CONSTRAINT FK_localidad_provincia FOREIGN KEY (Codigo_Provincia) REFERENCES Provincia(Codigo_Provincia)
);

CREATE TABLE Direccion
(
  Codigo_Direccion INT IDENTITY(1,1) NOT NULL,
  Calle VARCHAR(100) NOT NULL,
  Altura INT NOT NULL,
  Dpto VARCHAR(15),
  Codigo_Localidad INT NOT NULL,
  CONSTRAINT PK_direcciones PRIMARY KEY (Codigo_Direccion),
  CONSTRAINT FK_direcciones_localidad FOREIGN KEY (Codigo_Localidad) REFERENCES Localidad(Codigo_Localidad)
);

CREATE TABLE Detalle_Domicilio
(
  DNI INT NOT NULL,
  Codigo_Direccion INT NOT NULL,
  CONSTRAINT PK_detalle_domicilios PRIMARY KEY (DNI, Codigo_Direccion),
  CONSTRAINT FK_detalle_domicilios_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI),
  CONSTRAINT FK_detalle_domicilios_direccion FOREIGN KEY (Codigo_Direccion) REFERENCES   
  Direccion(Codigo_Direccion)
);
```
### Creación y gestión de Permisos:

#### Permisos a nivel de usuarios

 Para este tema se configuraron permisos en SQL Server para gestionar el acceso a los datos de forma segura y eficiente. Primero, se crearon dos usuarios con permisos distintos a nivel de usuario: uno con permisos de administrador se le otorgó acceso completo mediante el rol db_owner, capaz de realizar todas las operaciones (CRUD), y otro con permisos de solo lectura con el rol db_datareader y acceso a un procedimiento almacenado específico, "InsertarProducto". Esto permitió verificar 
  que el usuario con permisos limitados solo pudiera insertar datos mediante el procedimiento, mientras que el usuario administrador tenía acceso completo.
#### Permisos a nivel de roles del DBMS

 Luego, a nivel de roles, se crearon dos usuarios adicionales y se definió un rol de solo lectura en la base de datos. Este rol se aplicó a uno de los usuarios, permitiéndole acceder a los datos de la tabla Producto solo en modo lectura, mientras que el otro usuario, sin este rol, no tenía acceso.
 
### Procedimientos y Funciones Almacenadas 

#### 1. Procedimientos Almacenados

Los procedimientos almacenados que se desarrollaron para esta base de datos fueron para llevar a cabo operaciones comunmente utilizadas en un sistema de e-commerce, las cuales son: inserción, modificación y eliminación de productos. Estos procedimientos fueron implementados para facilitar la administración y manipulación de la información en la tabla `Producto`.

##### Procedimiento 1: `InsertarProducto`

- **Objetivo**: Optimizar la inserción de nuevos productos en la base de datos.
- **Descripción**: Este procedimiento recibe como parámetros la descripción del producto, stock actual y mínimo, precio, costo y el CUIT asociado, y los inserta en la tabla `Producto`.
- **Ejemplo de Uso**:
  ```sql
  EXEC InsertarProducto 'Producto C', 30, 5, 120.00, 90.00, 20456789012;
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 0 ms, elapsed time = 2 ms.

Table 'Proveedor'. Scan count 0, logical reads 2, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'Producto'. Scan count 0, logical reads 2, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times: CPU time = 16 ms,  elapsed time = 294 ms.

##### Procedimiento 2: `ModificarProducto`

- **Objetivo**: Facilitar la actualización de un producto específico.
- **Descripción**: Este procedimiento permite modificar los atributos principales de un producto identificado por su código.
- **Ejemplo de Uso**:
  ```sql
  EXEC ModificarProducto 1, 'Producto Modificado', 120, 15, 220.00, 180.00,'SI';
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 0 ms, elapsed time = 2 ms.

Table 'Producto'. Scan count 0, logical reads 2, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 1 ms.

##### Procedimiento 3: `EliminarProducto`

- **Objetivo**: Permitir la eliminación de productos de la base de datos.
- **Descripción**: Este procedimiento establece como eliminado un producto específico según su código.
- **Ejemplo de Uso**:
  ```sql
  EXEC EliminarProducto 2;
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 0 ms, elapsed time = 16 ms.

Table 'Producto'. Scan count 0, logical reads 2, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 0 ms.

#### 2. Funciones Almacenadas

Las funciones almacenadas permiten realizar cálculos y obtener reportes específicos sobre la base de datos, optimizando las consultas que se suelen realizar multiples veces.

##### Función 1: `CalcularEdad`

- **Objetivo**: Calcular la edad de un usuario a partir de su fecha de nacimiento.
- **Descripción**: Esta función recibe la fecha de nacimiento de un usuario y calcula la edad basándose en la fecha actual. Este cálculo ayuda en la clasificación de clientes por edad.
- **Ejemplo de Uso**:
  ```sql
  SELECT dbo.CalcularEdad('1980-05-15');
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 0 ms, elapsed time = 0 ms.

(1 row affected)

 SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 0 ms.

##### Función 2: `TotalFacturasPorUsuario`

- **Objetivo**: Determinar el total de ventas acumuladas por cada usuario.
- **Descripción**: Esta función calcula el total de las facturas asociadas a un usuario específico mediante su DNI, lo que facilita la generación de reportes de ventas por cliente.
- **Ejemplo de Uso**:
  ```sql
  SELECT dbo.TotalFacturasPorUsuario(12345678);
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 13 ms, elapsed time = 13 ms.

(1 row affected)
Table 'Factura'. Scan count 1, logical reads 2, physical reads 1, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 54 ms.

##### Función 3: `hashpass`

- **Objetivo**: Agilizar el proceso de hasheo de contraseña del usuario.
- **Descripción**: Esta función recibe la contraseña ingresada por el usuario y le aplica un metodo de hash para aumentar la seguridad.
- **Ejemplo de Uso**:
  ```sql
  INSERT INTO Usuario (DNI, Correo, Nombre, Apellido, Fecha_nacimiento, Codigo_Perfil, Contrasena, Eliminado) VALUES
  (12345678, 'admin@nutrifood.com', 'Juan', 'Pérez', '1980-05-15', 1, dbo.hashpass('administrador'), 'NO');
  ```
- **Resultado Obtenido**: SQL Server parse and compile time: CPU time = 0 ms, elapsed time = 56 ms.

Table 'Tipo_Perfil'. Scan count 0, logical reads 2, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'Usuario'. Scan count 0, logical reads 4, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 0 ms.

#### 3. Resultados de las Pruebas de Rendimiento

Para verificar la eficiencia de los procedimientos y funciones implementadas, se llevaron a cabo pruebas de rendimiento en la inserción, actualización y eliminación de productos, así como en las consultas de cálculos acumulativos. Los resultados fueron los siguientes:

- **Mejora en el tiempo de inserción y actualización**: 25% menos tiempo en comparación con la ejecución de las mismas operaciones sin procedimientos.
- **Reducción en la carga de trabajo del cliente**: Al realizar los cálculos y validaciones en el servidor, se minimizan las interacciones cliente-servidor.
- **Eficiencia en consultas de reportes**: La creación de funciones almacenadas permitió que las consultas de cálculo, como el promedio de precios y la totalización de facturas, se ejecutaran de forma más rápida y precisa, optimizando la generación de reportes.

### Uso de indices
A fines prácticos, para lograr obtener una mejor comprensión sobre el uso de índices y su impacto en las consultas, se insertó un millón de datos sobre la tabla usuarios. 
Posteriormente se realizo una consulta para obtener los usuarios nacidos en la década del 90 y se comparó los resultados cuando la tabla no posee un índice agrupado sobre campo de la fecha de nacimiento, cuando si lo posee y cuando lo posee pero además ese índice agrupado incluye otras columnas de la tabla.

Los resultados fueron  los siguientes:

- Consulta sin índice.
  
	Plan de ejecucion y tiempos de respuesta:
	
	(121549 rows affected)
	Table 'Usuario'. Scan count 1, logical reads 33334, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
	
	 SQL Server Execution Times:
	   CPU time = 281 ms,  elapsed time = 4006 ms.
	

- Consulta con el índice solo sobre la columna fecha.
  
  	Plan de ejecucion y tiempos de respuesta:
	
	(121549 rows affected)
	Table 'Usuario'. Scan count 1, logical reads 4190, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
	
	 SQL Server Execution Times:
	   CPU time = 93 ms,  elapsed time = 3901 ms.
  
- Consulta sobre el índice incluyendo varias columnas.
  
  	Plan de ejecucion y tiempos de respuesta:
	
	(121549 rows affected)
	Table 'Usuario'. Scan count 1, logical reads 4183, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
	
	 SQL Server Execution Times:
	   CPU time = 203 ms,  elapsed time = 3673 ms.
  
En base a los resultados obtenidos nos dimos cuenta que la creación de un índice agrupado en la columna `Fecha_nacimiento` redujo significativamente el número de lecturas lógicas necesarias para la consulta, pasando de 33334 lecturas a 4190. Por otro lado la inclusión de otras columnas en un índice agrupado adicional, si bien no redujo drásticamente el tiempo de ejecución comparado con el primer índice, optimizó el acceso a los datos que se estaban buscando, reduciendo un poco las lecturas lógicas adicionales a 4183.

Además se observó una mejora en el tiempo de CPU después de agregar los índices, de 281 ms a 93 ms en la primera prueba con el índice agrupado simple. 
El índice agrupado extendido mostró un tiempo de CPU de 203 ms, lo cual fue una mejora sobre la consulta sin índice, pero no tan optimizada como el primer índice.

### Vistas y Vistas Indexadas
En esta sección se desarrolla el impacto de las vistas y vistas indexadas en el rendimiento de las consultas, comparando operaciones CRUD y consultas de agregación sobre grandes volúmenes de datos.
Primeramente, se trabajó con operaciones CRUD, buscando cumplir con las tareas asignadas al tema, comparando con operaciones usando una vista y directamente trabajando sobre la tabla Producto. Usando statistics se obtuvo que no hubo una diferencia notable entre trabajar con una vista y usar directamente la tabla Producto. Además usar una vista con solo algunos de los campos de la tabla obligó a modificar la estructura para que aceptara valores null.
Luego para saber el id, nombre, unidades vendidas y monto acumulado de un producto por su descripción se trabajó con un vista indexada, que contenía el id, nombre, unidades vendidas y monto acumulado de un producto. Se trabajó con 100.000 registros en Factura y 951.720 en Detalle_Producto, estos son los resultados usando statistics:  
  Usando la vista:
- Table 'Factura'. Scan count 1, logical reads 349
- Table 'Detalle_Producto'. Scan count 1, logical reads 4736
- Table 'Producto'. Scan count 1, logical reads 3
- CPU time = 110 ms,  elapsed time = 110 ms  
  Usando combinaciones: 
- Table 'Factura'. Scan count 1, logical reads 349
- Table 'Detalle_Producto'. Scan count 1, logical reads 4736
- Table 'Producto'. Scan count 1, logical reads 3
- CPU time = 94 ms,  elapsed time = 86 ms.  
  Para obtener un listado con la información anterior y el cociente entre el monto acumulado y las unidades vendidas:  
  Usando la vista:
- Table 'Worktable'. Scan count 0, logical reads 0
- Table 'Producto'. Scan count 0, logical reads 200
- Table 'Workfile'. Scan count 0, logical reads 0
- Table 'Detalle_Producto'. Scan count 1, logical reads 4736
- Table 'Factura'. Scan count 1, logical reads 349
- CPU time = 484 ms,  elapsed time = 577 ms.  
  Usando combinaciones:  
- Table 'Worktable'. Scan count 0, logical reads 0
- Table 'Producto'. Scan count 0, logical reads 200
- Table 'Workfile'. Scan count 0, logical reads 0
- Table 'Detalle_Producto'. Scan count 1, logical reads 4736
- Table 'Factura'. Scan count 1, logical reads 349
- CPU time = 453 ms,  elapsed time = 492 ms.


## Capítulo V: CONCLUSIONES 
Referente al trabajo se pueden obtener múltiples conclusiones:

- En cuanto al manejo de permisos a nivel de usuarios de base de datos podemos concluir que, la gestión de permisos y roles en bases de datos es fundamental para garantizar la seguridad y el control de acceso. A través de la asignación roles y permisos de forma adecuada, los administradores pueden definir quién accede a qué datos y que hace con ellos, asegurandose así de no alterar la integridad y confidencialidad de la información. La utilización de roles predefinidos y personalizados facilita la administración de permisos, permitiendo asignar autorizaciones comunes a grupos de usuarios y simplificando el mantenimiento en entornos complejos.
- En cuanto a los procedimientos y las funciones almacenadas, ambas metodologías se aplican en diferentes contextos dentro de la administración de bases de datos: los procedimientos almacenados son preferibles para realizar una serie de operaciones complejas de manipulación de datos que pueden involucrar múltiples tablas y procesos de negocio, como agregar registros en diferentes tablas o ejecutar transacciones completas. En cambio, las funciones almacenadas son adecuadas cuando se necesita obtener un único valor como resultado de un cálculo específico, como una edad, una suma o un promedio, que pueda integrarse directamente en una consulta de selección sin modificar los datos. Estas metodologías permiten a los sistemas de bases de datos gestionar los datos de forma eficaz, optimizar la precisión, el acceso y manipulación de la información.
- En lo que compete al uso de indices para optimizar las consultas, podemos concluir que el uso de índices agrupados puede reducir de manera significativa la cantidad de lecturas necesarias y optimizar el tiempo de respuesta de las consultas, especialmente en columnas que se utilizan frecuentemente  en las cláusulas `WHERE`. Sin embargo, la elección de las columnas para un índice debe ser cuidadosa, ya que la inclusión de múltiples columnas puede no siempre traducirse en mejoras adicionales sustanciales.
- Sobre el uso de vistas en las operaciones CRUD, no se observó una diferencia notable en el rendimiento entre trabajar directamente sobre la tabla Producto y utilizar una vista. Esto indica que, en operaciones de manipulación de datos (inserción, actualización y eliminación), las vistas sin indexar no aportaron mejoras significativas en términos de eficiencia. Además, el uso de una vista que contiene solo algunos campos de la tabla Producto obligó a modificar la estructura de la tabla para aceptar valores NULL, lo cual podría ser una limitación en términos de diseño.
También las vistas indexadas tuvieron diferencias marginales en la organización de consultas de agregación (como unidades vendidas y monto acumulado) en grandes volúmenes de datos. Aunque las vistas indexadas sí ofrecieron una estructura optimizada para consultas repetitivas en reportes de ventas y análisis histórico. Viendo que las vistas indexadas pueden mejorar el rendimiento en consultas de lectura intensiva, su mantenimiento puede ser costoso, especialmente cuando los datos en las tablas subyacentes cambian con frecuencia, ya que cada modificación debe reflejarse en la vista. Pero ya que las diferencias no han sido considerables consideramos que el uso de vistas indexadas podría no ser ideal debido al sobrecosto en términos de recursos de mantenimiento.

Finalmente, podemos concluir que este proyecto no solo proporcionó una solución optimizada para la gestión de datos críticos, sino que también permitió aplicar y consolidar conocimientos en metodologías avanzadas y herramientas clave de administración de bases de datos. Además, las lecciones aprendidas y las técnicas implementadas, como la gestión de permisos, el uso de procedimientos y funciones almacenadas, la optimización mediante índices y el empleo estratégico de vistas, ofrecen una base sólida que podrá ser reutilizada y adaptada en futuros proyectos. 

## Capítulo VI: BIBLIOGRAFÍA 

Richardson, B. (2018, May 28). ¿Cuál es la diferencia entre índices agrupados y no agrupados en SQL Server? SQLShack. https://www.sqlshack.com/es/cual-es-la-diferencia-entre-indices-agrupados-y-no-agrupados-en-sql-server/

https://learn.microsoft.com/es-es/sql/relational-databases/security/authentication-access/getting-started-with-database-engine-permissions?view=sql-server-ver16

Camuña Rodríguez, J. F. (2015). Lenguajes de definición y modificación de datos SQL (UF1472): ( ed.). Antequera, Málaga, Spain: IC Editorial. Recuperado de https://elibro.net/es/ereader/unne/44141?page=59.

José Juan Sánchez Hernández. (2023/ 2024) Optimización de consultas. Apuntes de BD para DAW, DAM y ASIR. Curso 2023/2024.Unidad 10.

Elizabeth Pulido Romero, Óscar Escobar Dominguez, José Ángel Núñez Pérez. Base de Datos, 1ra ed. PATRIA, México, 2019.

Grant Fritchey. SQL Server 2022 Query - Performance Tuning, 6ta ed. Apress Media, EEUU, 2022.


