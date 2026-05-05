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

-- Funciones de Texto

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
	

-- Funciones de Numero

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

-- Funciones de Fecha

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

-- Funciones de Conversion

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

-- Funciones de Control

-- NVL
SELECT
    nombre,
    nvl(telefono, 'Sin teléfono') AS telefono
FROM
    proveedor;

-- NVL2
SELECT
    nombre,
    coalesce(telefono, 'Si', 'No') as tiene_telefono
FROM
    proveedor;

-- COALESCE
SELECT
    nombre,
    coalesce(telefono, NULL, 'No tiene telefono', 'Sin telefono') AS telefono
FROM
    proveedor;

-- Multitabla (INNER JOIN)

-- Muestra el nombre del producto y de su fabricante usando INNER JOIN.
SELECT
    p.nombre,
    f.nombre
FROM
         producto p
    JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Muestra el nombre del producto y de su fabricante (forma antigua).
SELECT
    p.nombre AS nombre_producto,
    f.nombre AS nombre_fabricante
FROM
    producto   p,
    fabricante f
WHERE
    p.codigo_fabricante = f.codigo;

-- Agrupaciones

-- Funciones agregadas

-- Mostrar la media de todos los productos
SELECT
    AVG(precio) AS media
FROM
    producto;
	
-- Mostrar el precio mayor de todos los productos
SELECT
    MAX(precio) AS maximo
FROM
    producto;

-- Mostrar el precio menor de todos los productos
SELECT
    MIN(precio) AS minimo
FROM
    producto;

-- Sumar el precio de todos los productos
SELECT
    SUM(precio) AS suma
FROM
    producto;

-- Contar el numero de productos
SELECT
    COUNT(*) AS numero_productos
FROM
    producto;

-- Contar el numero de proveedores que tengan un codigo fabricante
SELECT
    COUNT(codigo_fabricante) AS numero_proveedor
FROM
    proveedor;

-- Contar el numero de fabricantes que hayan fabricado algun producto.
SELECT
    count(distinct codigo_fabricante) as numero_fabricantes
FROM
    producto;

-- Muestra para cada fabricante (codigo) la suma del precio de sus productos y el numero de productos.
SELECT
    codigo_fabricante,
    SUM(precio) AS suma,
    COUNT(*)    AS numero_productos
FROM
    producto
GROUP BY
    codigo_fabricante
ORDER BY
    codigo_fabricante;

-- Muestra para cada fabricante (nombre) la suma del precio de sus productos y el numero de productos.
SELECT
    f.nombre,
    SUM(precio) AS suma,
    COUNT(*)    AS numero_productos
FROM
         producto p
    JOIN fabricante f ON p.codigo_fabricante = f.codigo
GROUP BY
    f.nombre
ORDER BY
    f.nombre;

-- HAVING

-- Mostrar la media de precio de los productos de cada fabricante que sea superior a 200.
SELECT
    codigo_fabricante,
    AVG(precio) AS media
FROM
    producto
GROUP BY
    codigo_fabricante
HAVING
    AVG(precio) > 200
ORDER BY
    codigo_fabricante;

-- Mostrar la media de precio de los productos de cada fabricante que sea superior a 200 y con mas de dos productos.
SELECT
    codigo_fabricante,
    AVG(precio) AS media,
    COUNT(*)    AS numero
FROM
    producto
GROUP BY
    codigo_fabricante
HAVING AVG(precio) > 100
       AND COUNT(*) > 1
ORDER BY
    codigo_fabricante;


-- SUBCONSULTAS

-- Muestra el nombre y precio del producto mas caro
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio = (
        SELECT
            MAX(precio)
        FROM
            producto
    );

-- Muestra el nombre de los fabricantes que hayan fabricado productos
SELECT
    nombre
FROM
    fabricante
WHERE
    codigo IN (
        SELECT DISTINCT
            codigo_fabricante
        FROM
            producto
    );

-- Muestra el nombre y precio del producto mas caro del fabricante ASUS
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio = (
        SELECT
            MAX(precio)
        FROM
            producto
        WHERE
            codigo_fabricante = (
                SELECT
                    codigo
                FROM
                    fabricante
                WHERE
                    nombre = 'Asus'
            )
    );

-- Productos mas caros que la media de su fabricante
SELECT
    nombre,
    precio,
    codigo_fabricante
FROM
    producto p
WHERE
    precio > (
        SELECT
            AVG(precio)
        FROM
            producto
        WHERE
            codigo_fabricante = p.codigo_fabricante
    );

-- Muestra el nombre de los fabricantes que hayan fabricado productos usando EXISTS
SELECT
    nombre
FROM
    fabricante f
WHERE
    EXISTS (
        SELECT
            codigo
        FROM
            producto
        WHERE
            codigo_fabricante = f.codigo
    );

-- Muestra el nombre de los fabricantes que NO hayan fabricado productos usando NOT EXISTS
SELECT
    nombre
FROM
    fabricante f
WHERE
    NOT EXISTS (
        SELECT
            codigo
        FROM
            producto
        WHERE
            codigo_fabricante = f.codigo
    );

-- Muestra el nombre y precio que superen a todos producto del codigo_fabricante 1 usando ALL
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio > ALL (
        SELECT
            precio
        FROM
            producto
        WHERE
            codigo_fabricante = 1
    );


-- Muestra el nombre y precio que superen a algun producto del codigo_fabricante 1 usando ANY
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio > ANY (
        SELECT
            precio
        FROM
            producto
        WHERE
            codigo_fabricante = 1
    );


-- Muestra el nombre, precio y media de precio de su fabricante
SELECT
    nombre,
    precio,
    (
        SELECT
            AVG(precio)
        FROM
            producto
        WHERE
            codigo_fabricante = p.codigo_fabricante
    ) as media_fabricante
FROM
    producto p;

-- Muestra la media de precio de los productos cada fabricante que superen en 300.
SELECT
    t.codigo_fabricante, avg(t.precio)
FROM
    (
        SELECT
            codigo_fabricante,
            precio
        FROM
            producto
        WHERE
            precio > 300
    ) t
group by t.codigo_fabricante;

-- Multitabla avanzado

-- LEFT JOIN

-- Muestra los proveedores y su fabricante, aunque los proveedores no tengan un fabricante.
SELECT
    p.nombre                        AS proveedor,
    nvl(f.nombre, 'Sin fabricante') AS fabricante
FROM
    proveedor  p
    LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Muestra los proveedores que no tienen fabricante
SELECT
    p.nombre AS proveedor
FROM
    proveedor  p
    LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    f.codigo IS NULL;

-- RIGHT JOIN

-- Muestra los proveedores y su fabricante, aunque los fabricantes no tengan un proveedor.
SELECT
    nvl(p.nombre, 'Sin proveedor') AS proveedor,
    f.nombre                       AS fabricante
FROM
    proveedor  p
    RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Muestra los fabricantes que no tienen proveedor
SELECT
    nvl(p.nombre, 'Sin proveedor') AS proveedor,
    f.nombre                       AS fabricante
FROM
    proveedor  p
    RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    p.codigo_fabricante IS NULL;

-- FULL OUTER JOIN

-- Muestra los proveedores y su fabricante, aunque los fabricantes no tengan un proveedor y viceversa.
SELECT
    nvl(p.nombre, 'Sin proveedor')  AS nombre_proveedor,
    nvl(f.nombre, 'Sin fabricante') AS nombre_fabricante
FROM
    proveedor  p
    FULL OUTER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Muestra los fabricantes y proveedores que no tengan relacion entre sí.
SELECT
    nvl(p.nombre, 'Sin proveedor')  AS nombre_proveedor,
    nvl(f.nombre, 'Sin fabricante') AS nombre_fabricante
FROM
    proveedor  p
    FULL OUTER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE
    p.codigo IS NULL
    OR f.codigo IS NULL;


-- Conjuntos

-- Muestra los codigos de fabricantes de producto y proveedor sin repetir.
SELECT
    codigo_fabricante
FROM
    producto
UNION
SELECT
    codigo_fabricante
FROM
    proveedor;

-- Muestra los codigos de fabricantes de producto y proveedor repetidos.
SELECT
    codigo_fabricante
FROM
    producto
UNION ALL
SELECT
    codigo_fabricante
FROM
    proveedor;

-- Muestra los codigos de fabricantes que sean comunes entre producto y proveedor.
SELECT
    codigo_fabricante
FROM
    producto
INTERSECT
SELECT
    codigo_fabricante
FROM
    proveedor;
	
-- Muestra los codigos de fabricantes de producto que no esten en proveedor
SELECT
    codigo_fabricante
FROM
    producto
MINUS
SELECT
    codigo_fabricante
FROM
    proveedor;

-- VISTAS

-- Almacena la media de los productos de cada fabricante usando una vista.
CREATE OR REPLACE VIEW media_fabricantes AS
    SELECT
        f.nombre,
        AVG(precio) AS media_fabricante
    FROM
             producto p
        JOIN fabricante f ON p.codigo_fabricante = f.codigo
    GROUP BY
        f.nombre;
		
-- Muestra a los fabricantes con una media mayor a 200.
SELECT
    nombre,
    media_fabricante
FROM
    media_fabricantes
WHERE
    media_fabricante > 200;

-- Eliminar vista media_fabricantes
DROP VIEW media_fabricantes;

-- Almacena la media de los productos de cada fabricante usando un with.
-- Muestra a los fabricantes con una media mayor a 200.
WITH media_fabricantes AS (
    SELECT
        f.nombre,
        AVG(precio) AS media_fabricante
    FROM
             producto p
        JOIN fabricante f ON p.codigo_fabricante = f.codigo
    GROUP BY
        f.nombre
)
SELECT
    nombre,
    media_fabricante
FROM
    media_fabricantes
WHERE
    media_fabricante > 200;

-- Funciones Analíticas en Oracle

-- ROWNUM

-- Top 3 productos mas caros
SELECT
    ROWNUM,
    nombre,
    precio
FROM
    (
        SELECT
            nombre,
            precio
        FROM
            producto
        ORDER BY
            precio DESC
    )
WHERE
    ROWNUM <= 3;
	
-- Top 3 productos mas caros (mas moderno)
SELECT
    nombre,
    precio
FROM
    producto
ORDER BY
    precio DESC
FETCH FIRST 3 ROWS ONLY;

-- Muestra los productos empezando por el siguiente al tercero y mostrando los 3 siguientes.
SELECT
    nombre,
    precio
FROM
    producto
ORDER BY
    precio DESC
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;

-- Muestra la explicacion de una consulta
EXPLAIN PLAN
    FOR
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio > 100
order by precio;
    
SELECT * FROM TABLE(DBMS_XPLAN.display);