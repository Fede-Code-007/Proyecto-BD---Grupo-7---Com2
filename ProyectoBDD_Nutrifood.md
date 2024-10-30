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

    - Vistas y vistas indexadas

[Capítulo III: Metodología Seguida](#capítulo-iii-metodología-seguida)

[Capítulo IV: Desarrollo del Tema / Presentación de Resultados](#capítulo-iv-desarrollo-del-tema--presentación-de-resultados)

    - Modelo Relacional
    - Diccionario de Datos
    - Modelo Físico
    - Lote de datos
    
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

### Herramientas 

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
| DNI             | INT    |      | DNI de un usuario                         |

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

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| Codigo_Producto | PRIMARY KEY       |

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

#### Restricciones
| Campo     | Tipo restricción |
|-----------|------------------|
| CUIT      | PRIMARY KEY       |
| Correo    | UNIQUE            |
| Telefono  | UNIQUE, OPTIONAL  |

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
| Codigo_Perfil   | INT      |      | Código identificador del perfil    |

#### Restricciones
| Campo  | Tipo restricción |
|--------|------------------|
| DNI    | PRIMARY KEY       |
| Correo | UNIQUE            |

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
| Codigo_Direccion | PRIMARY KEY       |
| Dpto             | OPTIONAL          |

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

CREATE TABLE Tipo_Perfil (
    Codigo_Perfil INT IDENTITY(1,1) NOT NULL,
    Descripcion CHAR(100) NOT NULL,
    CONSTRAINT PK_tipo_perfil PRIMARY KEY (Codigo_Perfil)
);

CREATE TABLE Categoria (
    Codigo_categoria INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    CONSTRAINT PK_categorias PRIMARY KEY (Codigo_Categoria)
);

CREATE TABLE Pais (
    Codigo_Pais INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_pais PRIMARY KEY (Codigo_Pais)
);

CREATE TABLE Proveedor (
    CUIT BIGINT NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono BIGINT,
    Nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_proveedores PRIMARY KEY (CUIT),
    CONSTRAINT UQ_proveedores_correo UNIQUE (Correo),
    CONSTRAINT UQ_proveedores_telefono UNIQUE (Telefono)
);

CREATE TABLE Medios_de_Pago (
    Codigo_MP INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_medios_pago PRIMARY KEY (Codigo_MP)
);

CREATE TABLE Producto (
    Codigo_Producto INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Stock INT NOT NULL,
    Stock_Min INT NOT NULL,
    Precio FLOAT NOT NULL,
    Costo FLOAT NOT NULL,
    CUIT BIGINT NOT NULL,
    CONSTRAINT PK_producto PRIMARY KEY (Codigo_Producto),
    CONSTRAINT FK_producto_proveedores FOREIGN KEY (CUIT) REFERENCES Proveedor(CUIT)
);

CREATE TABLE Usuario (
    DNI INT NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Nombre CHAR(100) NOT NULL,
    Apellido CHAR(100) NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    Codigo_Perfil INT NOT NULL,
    CONSTRAINT PK_usuario PRIMARY KEY (DNI),
    CONSTRAINT FK_usuario_perfil FOREIGN KEY (Codigo_Perfil) REFERENCES Tipo_Perfil(Codigo_Perfil),
    CONSTRAINT UQ_usuario_correo UNIQUE (Correo)
);

CREATE TABLE Factura (
    Numero_Factura INT NOT NULL,
    Total FLOAT NOT NULL,
    Fecha DATE NOT NULL,
    DNI INT NOT NULL,
    CONSTRAINT PK_factura PRIMARY KEY (Numero_Factura),
    CONSTRAINT FK_factura_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI)
);

CREATE TABLE Mensajes (
    Codigo_Mensaje INT IDENTITY(1,1) NOT NULL,
    Asunto VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(300) NOT NULL,
    Fecha DATE NOT NULL,
    DNI INT NOT NULL,
    CONSTRAINT PK_mensajes PRIMARY KEY (Codigo_Mensaje),
    CONSTRAINT FK_mensajes_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI)
);

CREATE TABLE Provincia (
    Codigo_Provincia INT IDENTITY(1,1) NOT NULL,
    Nombre CHAR(100) NOT NULL,
    Codigo_Pais INT NOT NULL,
    CONSTRAINT PK_provincia PRIMARY KEY (Codigo_Provincia),
    CONSTRAINT FK_provincia_pais FOREIGN KEY (Codigo_Pais) REFERENCES Pais(Codigo_Pais)
);

CREATE TABLE Detalle_Categorias (
    Codigo_Producto INT NOT NULL,
    Codigo_Categoria INT NOT NULL,
    CONSTRAINT PK_detalle_categorias PRIMARY KEY (Codigo_Producto, Codigo_Categoria),
    CONSTRAINT FK_detalle_categorias_producto FOREIGN KEY (Codigo_Producto) REFERENCES Producto(Codigo_Producto),
    CONSTRAINT FK_detalle_categorias_categoria FOREIGN KEY (Codigo_Categoria) REFERENCES Categoria(Codigo_Categoria)
);

CREATE TABLE Detalle_Producto (
    Cantidad INT NOT NULL,
    Precio FLOAT NOT NULL,
    Numero_Factura INT NOT NULL,
    Codigo_Producto INT NOT NULL,
    CONSTRAINT PK_detalle_producto PRIMARY KEY (Numero_Factura, Codigo_Producto),
    CONSTRAINT FK_detalle_producto_factura FOREIGN KEY (Numero_Factura) REFERENCES Factura(Numero_Factura),
    CONSTRAINT FK_detalle_producto_producto FOREIGN KEY (Codigo_Producto) REFERENCES Producto(Codigo_Producto)
);

CREATE TABLE Detalle_Pago (
    Monto_Pagado FLOAT NOT NULL,
    Nro_Cuotas INT NOT NULL,
    Codigo_MP INT NOT NULL,
    Numero_Factura INT NOT NULL,
    CONSTRAINT PK_detalle_pago PRIMARY KEY (Codigo_MP, Numero_Factura),
    CONSTRAINT FK_detalle_pago_mp FOREIGN KEY (Codigo_MP) REFERENCES Medios_de_Pago(Codigo_MP),
    CONSTRAINT FK_detalle_pago_factura FOREIGN KEY (Numero_Factura) REFERENCES Factura(Numero_Factura)
);

CREATE TABLE Localidad (
    Codigo_Localidad INT IDENTITY(1,1) NOT NULL,
    Nombre CHAR(100) NOT NULL,
    Codigo_Provincia INT NOT NULL,
    CONSTRAINT PK_localidad PRIMARY KEY (Codigo_Localidad),
    CONSTRAINT FK_localidad_provincia FOREIGN KEY (Codigo_Provincia) REFERENCES Provincia(Codigo_Provincia)
);

CREATE TABLE Direccion (
    Codigo_Direccion INT IDENTITY(1,1) NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    Altura INT NOT NULL,
    Dpto VARCHAR(15),
    Codigo_Localidad INT NOT NULL,
    CONSTRAINT PK_direcciones PRIMARY KEY (Codigo_Direccion),
    CONSTRAINT FK_direcciones_localidad FOREIGN KEY (Codigo_Localidad) REFERENCES Localidad(Codigo_Localidad)
);

CREATE TABLE Detalle_Domicilio (
    DNI INT NOT NULL,
    Codigo_Direccion INT NOT NULL,
    CONSTRAINT PK_detalle_domicilios PRIMARY KEY (DNI, Codigo_Direccion),
    CONSTRAINT FK_detalle_domicilios_usuario FOREIGN KEY (DNI) REFERENCES Usuario(DNI),
    CONSTRAINT FK_detalle_domicilios_direccion FOREIGN KEY (Codigo_Direccion) REFERENCES Direccion(Codigo_Direccion)
);

```

### Lote de datos:

```sql
USE proyecto_BDD;

-- LOTE DE DATOS

-- =======================
-- DATOS PARA Tipo_Perfil
-- =======================
INSERT INTO Tipo_Perfil (Descripcion) VALUES 
    ('Administrador'), 
    ('Cliente'), 
    ('Vendedor'), 
    ('Gerente');

-- =======================
-- DATOS PARA Categoria
-- =======================
INSERT INTO Categoria (Descripcion) VALUES 
    ('Suplementos'), 
    ('Comida Orgánica'), 
    ('Bebidas'), 
    ('Frutas y Verduras'), 
    ('Snacks Saludables');

-- =======================
-- DATOS PARA Pais
-- =======================
INSERT INTO Pais (Nombre) VALUES 
    ('Argentina'), 
    ('Brasil'), 
    ('Chile'), 
    ('Uruguay');

-- =======================
-- DATOS PARA Proveedor
-- =======================
INSERT INTO Proveedor (CUIT, Correo, Telefono, Nombre) VALUES 
    (20123456789, 'proveedor1@nutrifood.com', 123456789, 'Proveedor 1'), 
    (20345678901, 'proveedor2@nutrifood.com', 987654321, 'Proveedor 2'), 
    (20456789012, 'proveedor3@nutrifood.com', 456789123, 'Proveedor 3'), 
    (20567890123, 'proveedor4@nutrifood.com', 789123456, 'Proveedor 4');

-- =======================
-- DATOS PARA Medios_de_Pago
-- =======================
INSERT INTO Medios_de_Pago (Nombre) VALUES 
    ('Tarjeta de Crédito'), 
    ('Transferencia Bancaria'), 
    ('Efectivo'), 
    ('Pago en Cuotas');

-- =======================
-- DATOS PARA Producto
-- =======================
INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT) VALUES 
    ('Proteína Whey', 50, 10, 1500.00, 1200.00, 20123456789), 
    ('Aceite de Coco Orgánico', 30, 5, 500.00, 300.00, 20345678901), 
    ('Barras Energéticas', 80, 20, 120.00, 80.00, 20456789012), 
    ('Batido Proteico', 60, 10, 1800.00, 1400.00, 20567890123), 
    ('Jugo Detox', 100, 15, 250.00, 180.00, 20345678901);

-- =======================
-- DATOS PARA Usuario
-- =======================
INSERT INTO Usuario (DNI, Correo, Nombre, Apellido, Fecha_nacimiento, Codigo_Perfil) VALUES 
    (12345678, 'admin@nutrifood.com', 'Juan', 'Pérez', '1980-05-15', 1), 
    (23456789, 'cliente@nutrifood.com', 'Ana', 'García', '1990-07-22', 2), 
    (34567890, 'vendedor@nutrifood.com', 'Carlos', 'López', '1985-09-10', 3), 
    (45678901, 'gerente@nutrifood.com', 'María', 'Martínez', '1978-12-05', 4);

-- =======================
-- DATOS PARA Factura
-- =======================
INSERT INTO Factura (Numero_Factura, Total, Fecha, DNI) VALUES 
    (1001, 2000.00, '2024-09-30', 23456789), 
    (1002, 3700.00, '2024-09-29', 34567890), 
    (1003, 4200.00, '2024-09-28', 45678901);

-- =======================
-- DATOS PARA Mensajes
-- =======================
INSERT INTO Mensajes (Asunto, Descripcion, Fecha, DNI) VALUES 
    ('Consulta sobre envío', '¿Cuándo llegará mi pedido?', '2024-09-29', 23456789), 
    ('Problema con el pago', 'No pude completar el pago con tarjeta', '2024-09-28', 34567890), 
    ('Cambio de dirección', 'Quiero cambiar la dirección de entrega', '2024-09-27', 12345678);

-- =======================
-- DATOS PARA Provincia
-- =======================
INSERT INTO Provincia (Nombre, Codigo_Pais) VALUES 
    ('Buenos Aires', 1), 
    ('Río de Janeiro', 2), 
    ('Santiago', 3), 
    ('Montevideo', 4);

-- =======================
-- DATOS PARA Detalle_Categorias
-- =======================
INSERT INTO Detalle_Categorias (Codigo_Producto, Codigo_Categoria) VALUES 
    (1, 1), 
    (2, 1), 
    (3, 2), 
    (4, 2), 
    (1, 3);

-- =======================
-- DATOS PARA Detalle_Producto
-- =======================
INSERT INTO Detalle_Producto (Cantidad, Precio, Numero_Factura, Codigo_Producto) VALUES 
    (2, 1500.00, 1001, 1), 
    (3, 120.00, 1002, 3), 
    (1, 1800.00, 1003, 4);

-- =======================
-- DATOS PARA Detalle_Pago
-- =======================
INSERT INTO Detalle_Pago (Monto_Pagado, Nro_Cuotas, Codigo_MP, Numero_Factura) VALUES 
    (2000.00, 1, 1, 1001), 
    (3700.00, 2, 4, 1002), 
    (4200.00, 1, 3, 1003);

-- =======================
-- DATOS PARA Localidad
-- =======================
INSERT INTO Localidad (Nombre, Codigo_Provincia) VALUES 
    ('Capital Federal', 1), 
    ('Niterói', 2), 
    ('Providencia', 3), 
    ('Punta Carretas', 4);

-- =======================
-- DATOS PARA Direccion
-- =======================
INSERT INTO Direccion (Calle, Altura, Dpto, Codigo_Localidad) VALUES 
    ('Av. Siempre Viva', 123, 'A', 1), 
    ('Rua das Flores', 456, 'B', 2), 
    ('Calle Falsa', 789, 'C', 3), 
    ('Av. Libertador', 321, NULL, 4);

-- =======================
-- DATOS PARA Detalle_Domicilio
-- =======================
INSERT INTO Detalle_Domicilio (DNI, Codigo_Direccion) VALUES 
    (23456789, 1), 
    (34567890, 2), 
    (12345678, 3), 
    (45678901, 4);

```

## Capítulo V: CONCLUSIONES 

## Capítulo VI: BIBLIOGRAFÍA 
Elizabeth Pulido Romero, Óscar Escobar Dominguez, José Ángel Núñez Pérez. Base de Datos, 1ra ed. PATRIA, México, 2019.
Grant Fritchey. SQL Server 2022 Query - Performance Tuning, 6ta ed. Apress Media, EEUU, 2022.

