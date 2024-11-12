-- Procedimiento de Inserción: Permite añadir un nuevo producto en la base de datos, capturando todos los detalles necesarios para su ----- administración, como descripción, stock y precio.
use proyecto_BDD
    CREATE PROCEDURE InsertarProducto
        @Descripcion VARCHAR(100),
        @Stock INT,
        @Stock_Min INT,
        @Precio FLOAT,
        @Costo FLOAT,
        @CUIT BIGINT
    AS
    BEGIN
        INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo,Eliminado, CUIT)
        VALUES (@Descripcion, @Stock, @Stock_Min, @Precio, @Costo,'NO', @CUIT);
    END;

-- Procedimiento de Modificación: Permite modificar los detalles de un producto existente, permitiendo la facilidad en la actualización --- de datos y mantenimiento de la información.

    CREATE PROCEDURE ModificarProducto
        @Codigo_Producto INT,
        @Descripcion VARCHAR(100),
        @Stock INT,
        @Stock_Min INT,
        @Precio FLOAT,
        @Costo FLOAT,
        @Eliminado VARCHAR(2)
    AS
    BEGIN
        UPDATE Producto
        SET Descripcion = @Descripcion,
            Stock = @Stock,
            Stock_Min = @Stock_Min,
            Precio = @Precio,
            Costo = @Costo,
            Eliminado = @Eliminado
        WHERE Codigo_Producto = @Codigo_Producto;
    END;

-- Procedimiento de Eliminación: Este procedimiento se encarga de la eliminación de un producto.

    CREATE PROCEDURE EliminarProducto
        @Codigo_Producto INT
    AS
    BEGIN
        UPDATE Producto
        SET Eliminado = 'SI'
        WHERE Codigo_Producto = @Codigo_Producto;
    END;


-- ### Funciones Almacenadas para Cálculos y Reportes

-- **Funciones Implementadas:**

-- Calcular Edad de Usuarios: Esta función permite calcular la edad de un usuario en función de su fecha de nacimiento.

    CREATE FUNCTION CalcularEdad (@FechaNacimiento DATE)
    RETURNS INT
    AS
    BEGIN
        RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE()) -
               CASE WHEN MONTH(@FechaNacimiento) > MONTH(GETDATE()) OR 
                         (MONTH(@FechaNacimiento) = MONTH(GETDATE()) AND DAY(@FechaNacimiento) > DAY(GETDATE()))
                    THEN 1 ELSE 0 END;
    END;

-- Total de Facturas por Usuario: Proporciona el total de ventas acumuladas por usuario, ayudando al análisis de clientes y de ventas.

    CREATE FUNCTION TotalFacturasPorUsuario (@DNI INT)
    RETURNS FLOAT
    AS
    BEGIN
        DECLARE @Total FLOAT;
        SELECT @Total = SUM(Total) FROM Factura WHERE DNI = @DNI;
        RETURN ISNULL(@Total, 0);
    END;

-- Función para aplicar hash a la contraseña ingresada por el usuario.

    CREATE FUNCTION dbo.HashPass(@pass NVARCHAR(MAX))
    RETURNS NVARCHAR(128)
    AS
    BEGIN
        DECLARE @hashedPass NVARCHAR(128);
        SET @hashedPass = CONVERT(NVARCHAR(128), HASHBYTES('SHA2_256', @pass), 2);   
        RETURN @hashedPass;
    END;

-- ### Pruebas de Inserción y Manipulación de Datos

-- ### Inserción Directa de Lote de Datos

INSERT INTO Producto (Descripcion, Stock, Stock_Min, Precio, Costo, CUIT)
VALUES 
('Producto A', 100, 10, 200.00, 150.00, 20123456789),
('Producto B', 50, 5, 100.00, 75.00, 20345678901);

-- ### Inserción a través de Procedimientos Almacenados

-- Para comparar la eficiencia en el uso de procedimientos, se realizó la inserción de datos mediante llamadas a `InsertarProducto`, -- --- verificando la facilidad de uso y la estructura controlada de datos.

EXEC InsertarProducto 'Producto C', 30, 5, 120.00, 90.00, 20456789012;
EXEC InsertarProducto 'Producto D', 60, 8, 180.00, 130.00, 20567890123;

-- ### Actualización y Eliminación de Datos

-- Actualizar un producto
EXEC ModificarProducto 1, 'Producto Modificado', 120, 15, 220.00, 180.00;

-- Eliminar un producto
EXEC EliminarProducto 2;

