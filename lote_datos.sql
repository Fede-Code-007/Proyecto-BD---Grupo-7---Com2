USE proyecto_BDD;

-- LOTE DE DATOS

-- =======================
-- DATOS PARA Tipo_Perfil
-- =======================
INSERT INTO Tipo_Perfil (Descripcion) VALUES
('Administrador'),
('Cliente'),
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
INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT, Eliminado) VALUES
('Proteína Whey', 50, 10, 1500.00, 1200.00, 20123456789, 'NO'),
('Aceite de Coco Orgánico', 30, 5, 500.00, 300.00, 20345678901, 'NO'),
('Barras Energéticas', 80, 20, 120.00, 80.00, 20456789012, 'NO'),
('Batido Proteico', 60, 10, 1800.00, 1400.00, 20567890123, 'NO'),
('Jugo Detox', 100, 15, 250.00, 180.00, 20345678901, 'NO');

-- =======================
-- DATOS PARA Usuario
-- =======================
INSERT INTO Usuario (DNI, Correo, Nombre, Apellido, Fecha_nacimiento, Codigo_Perfil, Contrasena, Eliminado) VALUES
(12345678, 'admin@nutrifood.com', 'Juan', 'Pérez', '1980-05-15', 1, dbo.hashpass('administrador'), 'NO'),
(23456789, 'cliente@nutrifood.com', 'Ana', 'García', '1990-07-22', 2, dbo.hashpass('cliente'), 'NO'),
(45678901, 'gerente@nutrifood.com', 'María', 'Martínez', '1978-12-05', 3, dbo.hashpass('gerente'), 'NO');

-- =======================
-- DATOS PARA Factura
-- =======================
INSERT INTO Factura (Numero_Factura, Total, Fecha, DNI) VALUES
(1001, 2000.00, '2024-09-30', 23456789),
(1002, 3700.00, '2024-09-29', 12345678),
(1003, 4200.00, '2024-09-28', 45678901);

-- =======================
-- DATOS PARA Mensajes
-- =======================
INSERT INTO Mensajes (Asunto, Descripcion, Fecha, DNI) VALUES
('Consulta sobre envío', '¿Cuándo llegará mi pedido?', '2024-09-29', 23456789),
('Problema con el pago', 'No pude completar el pago con tarjeta', '2024-09-28', 45678901),
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

Select * from Factura;

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
(45678901, 2),
(12345678, 3);



