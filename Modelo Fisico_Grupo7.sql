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
