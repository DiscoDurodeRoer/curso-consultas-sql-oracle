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

-- Funciones

-- Texto

-- Mostrar los nombres de los fabricantes en mayusculas.
SELECT
    upper(nombre) as nombre_mayusculas
FROM
    fabricante;

-- Mostrar los nombres de los fabricantes en minusculas.
SELECT
    lower(nombre) as nombre_minusculas
FROM
    fabricante;

-- Mostrar los nombres de los productos capitalizados.
SELECT
    initcap(nombre) as nombre_capitalizado
FROM
    producto;

-- Mostrar el nombre y la longitud de caracteres de cada fabricante.
SELECT
    nombre,
    length(nombre) AS longitud_nombre
FROM
    fabricante;

-- Mostrar el codigo y el nombre del fabricante con el siguiente formato:

-- codigo-nombre

SELECT
    codigo
    || '-'
    || nombre AS formato_personalizado
FROM
    fabricante;
	

-- Numero

-- Muestra los precios de los productos redondeados.
-- NOTA: para ver que realmente redondea, se debe usar TO_CHAR
SELECT
    precio,
    round (precio, 3) as precio_redondeado,
    TO_CHAR(ROUND(precio, 3), '9990.000') as precio_redondeado_formateado
FROM
    producto;
	
-- Muestra los precios de los productos redondeados por la parte entera.
SELECT
    precio,
    round (precio, -1) as precio_redondeado
FROM
    producto;

-- Muestra los precios de los productos truncados, es decir, sin decimales.
SELECT
    precio,
    trunc(precio) AS precio_truncado
FROM
    producto;
	
	-- Muestra los precios de los productos truncados por la parte entera.
SELECT
    precio,
    trunc(precio, -1) AS precio_truncado
FROM
    producto;

-- Muestra los precios de los productos redondeados hacia abajo
SELECT
    precio,
    floor(precio) AS precio_redondeado_abajo
FROM
    producto;

-- Muestra los precios de los productos redondeados hacia arriba
SELECT
    precio,
    ceil(precio) AS precio_redondeado_abajo
FROM
    producto;

-- Fecha

-- SYSDATE
SELECT
    sysdate AS fecha_hoy
FROM
    dual;

-- Suma de fechas
SELECT
    sysdate + 1 AS fecha_mañana
FROM
    dual;

-- Suma de meses
SELECT
    add_months(sysdate, 3) AS fecha_3_meses
FROM
    dual;

-- Suma de fechas moderno usando interval
SELECT
    sysdate + INTERVAL '3' DAY AS fecha_3_dias
FROM
    dual;

SELECT
    sysdate + INTERVAL '3' MONTH AS fecha_3_meses
FROM
    dual;

SELECT
    sysdate + INTERVAL '3' YEAR AS fecha_3_anios
FROM
    dual;

-- Diferencia de fechas
SELECT
    ( sysdate + 5 ) - sysdate AS diferencia_dias
FROM
    dual;

-- Diferencia de meses
SELECT
    months_between(
        add_months(sysdate, 30),
        sysdate
    ) AS diferencia_meses
FROM
    dual;

-- Diferncia de años
SELECT
    months_between(
        add_months(sysdate, 30),
        sysdate
    ) / 12 AS diferencia_anios
FROM
    dual;

-- Conversion

-- Convertir de numero a cadena
SELECT
    TO_NUMBER('1234.56', '9999.99') AS numero_formateado
FROM
    dual;

-- Convertir de cadena a fecha
SELECT
    TO_DATE('2026-01-01', 'YYYY-MM-DD') AS fecha_formateada
FROM
    dual;

-- Convertir de cadena a fecha y tiempo
SELECT
    TO_TIMESTAMP('2026-01-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS') AS ts
FROM
    dual;

-- Formatear los precios de nuestro productos con este formato: xxx.xx
SELECT
    to_char(precio, '990.99') AS precio_formateado
FROM
    producto;

-- Formatear los precios de nuestro productos con este formato: xxx.xx€
SELECT
    nombre,
    to_char(precio, '9900D00L') AS precio_formateado
FROM
    producto;

-- Convertir la fehca de hoy a formato DD/MM/YYYY
SELECT
    to_char(sysdate, 'DD/MM/YYYY') AS fecha_formateada
FROM
    dual;

-- Convertir una fecha a cadena formateado a DD/MM/YYYY
SELECT
    to_char(TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'DD/MM/YYYY') AS fecha_formateada
FROM
    dual;