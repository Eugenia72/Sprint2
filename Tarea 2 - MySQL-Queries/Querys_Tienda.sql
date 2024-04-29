use tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, CONCAT(precio, ' €') AS precioEuro, CONCAT(ROUND(precio * 1.08, 2), ' $') AS precioDolar from producto;
SELECT nombre AS nombre_producto, ROUND(precio, 2) AS euros, ROUND(precio * 1.08, 2) AS dolares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2))  FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto; 
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC;
SELECT nombre, precio FROM producto ORDER BY precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = codigo_fabricante; 
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = codigo_fabricante ORDER BY fabricante.nombre ASC;
SELECT producto.codigo AS codigo_de_producto, producto.nombre AS nombre_de_producto, fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1; 
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200; 
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate'; 
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre AS nombre_de_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo  WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.codigo AS codigo_fabricante, fabricante.nombre AS nombre_fabricante FROM fabricante LEFT JOIN producto ON  fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;
SELECT nombre AS nombre_producto FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');