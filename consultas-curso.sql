-- Consultas básicas

-- mostrar todos los productos
SELECT
    *
FROM
    producto;

-- mostrar el nombre y precio de todos los productos
SELECT
    nombre,
    precio
FROM
    producto;

-- mostrar nombre, precio y codigo_fabricante con un alias
SELECT
    nombre,
    precio as precio_producto,
    codigo_fabricante as fabricante
FROM
    producto;

-- mostrar los codigos de fabricante de todos los productos sin repetir
-- NOTA: para que DISTINCT elimine repetidos los datos de una fila deben ser identicos
SELECT DISTINCT
    codigo_fabricante
FROM
    producto;

-- Ordenacion

-- ordenar los productos por nombre de forma ascendente
-- NOTA: por defecto, se ordena de forma ascendente, si se quiere indicar se debe hacer usando ASC despues del campo.
SELECT
    *
FROM
    producto
ORDER BY
    nombre;

-- ordenar los productos por nombre de forma descendente
SELECT
    *
FROM
    producto
ORDER BY
    nombre DESC;

-- ordenar los productos por precio de forma descendente usando un alias
SELECT
    nombre,
    precio as precio_producto
FROM
    producto
ORDER BY
    precio_producto DESC;

-- ordenar por codigo_fabricante de forma ascendente y precio de forma descendente
SELECT
    nombre,
    precio,
    codigo_fabricante
FROM
    producto
ORDER BY
    codigo_fabricante ASC,
    precio ASC;

-- Filtrado

-- Mostrar nombre y precio de los productos con un precio mayor de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio > 200;

-- Mostrar nombre y precio de los productos con un precio menor de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio < 200;

-- Mostrar nombre y precio de los productos con un precio mayor o igual de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio >= 200;

-- Mostrar nombre y precio de los productos con un precio menor o igual de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio <= 200;

-- Mostrar nombre y precio de los productos con un precio igual de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio = 120;

-- Mostrar nombre y precio de los productos con un precio distinto de 200 
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio <> 120;

-- Mostrar nombre y precio de los productos con precio entre 200 y 600
SELECT
    nombre,
    precio
FROM
    producto
WHERE
        precio >= 200
    AND precio <= 600;

-- Mostrar nombre y precio de los productos con precio entre 200 y 600 usando el operador BETWEEN
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio BETWEEN 200 AND 600;

-- Mostrar nombre, precio y codigo_fabricante de los productos del fabricante 1 o 2
SELECT
    nombre,
    precio,
    codigo_fabricante
FROM
    producto
WHERE
    codigo_fabricante = 1
    OR codigo_fabricante = 2;

-- Mostrar nombre, precio y codigo_fabricante de los productos del fabricante 1 o 2 usando IN
SELECT
    nombre,
    precio,
    codigo_fabricante
FROM
    producto
WHERE
    codigo_fabricante IN ( 1, 2 );

-- Muestra el nombre de los productos que contengan 'Full' en su nombre
SELECT
    nombre
FROM
    producto
WHERE
    nombre LIKE '%Full%'

-- Muestra el nombre de los productos que comiencen 'GeForce' en su nombre
SELECT
    nombre
FROM
    producto
WHERE
    nombre LIKE 'GeForce%'
	
-- Muestra el nombre de los productos que terminen 'GeForce' en su nombre
SELECT
    nombre
FROM
    producto
WHERE
    nombre LIKE '%HD';

-- Muestra el nombre de los productos donde su segunda letra sea una 'o'
SELECT
    nombre
FROM
    producto
WHERE
    nombre LIKE '_o%';

-- Muestra el nombre de los proveedores que no tengan telefono
SELECT
    nombre
FROM
    proveedor
WHERE
    telefono IS NULL;

-- Muestra el nombre de los proveedores que tengan telefono
SELECT
    nombre,
    telefono
FROM
    proveedor
WHERE
    telefono IS NOT NULL;

