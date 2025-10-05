-- =======================
--  Consultas SQL TP-2
-- =======================

USE facturacion_1;

-- 1. Mostrar todos los clientes registrados en la base de datos.
SELECT * FROM E01_CLIENTE;

-- 2. Listar solo el nombre y apellido de todos los clientes.
SELECT nombre, apellido FROM E01_CLIENTE;

-- 3. Mostrar todos los productos con sus precios y stock.
SELECT nombre, precio, stock FROM E01_PRODUCTO;

-- 4. Mostrar clientes con activo > 100.
SELECT nombre, apellido, direccion FROM E01_CLIENTE WHERE activo > 100;

-- 5. Listar productos con precio > 800.
SELECT * FROM E01_PRODUCTO WHERE precio > 800;

-- 6. Clientes cuyo apellido comience con M.
SELECT * FROM E01_CLIENTE WHERE apellido LIKE 'M%';

-- 7. Productos cuyo nombre contenga 'meat'.
SELECT * FROM E01_PRODUCTO WHERE nombre LIKE '%meat%';

-- 8. Obtener marcas distintas.
SELECT DISTINCT marca FROM E01_PRODUCTO;

-- 9. Clientes con activo entre 50 y 100.
SELECT * FROM E01_CLIENTE WHERE activo BETWEEN 50 AND 100;

-- 10. Productos con precio > 500 y stock > 400.
SELECT * FROM E01_PRODUCTO WHERE precio > 500 AND stock > 400;

-- 11. Clientes cuyo apellido sea 'Rose' o 'Allen'.
SELECT * FROM E01_CLIENTE WHERE apellido IN ('Rose', 'Allen');

-- 12. Clientes cuyo nombre contenga 'a'.
SELECT * FROM E01_CLIENTE WHERE nombre LIKE '%a%';

-- 13. Productos con precio entre 200 y 600.
SELECT * FROM E01_PRODUCTO WHERE precio BETWEEN 200 AND 600;

-- 14. Productos con stock < 100.
SELECT * FROM E01_PRODUCTO WHERE stock < 100;

-- 15. Clientes cuya dirección contenga 'Avenida'.
SELECT * FROM E01_CLIENTE WHERE direccion LIKE '%avenida%';

-- 16. Productos con 'Nulla' en la descripción.
SELECT * FROM E01_PRODUCTO WHERE descripcion LIKE '%nulla%';

-- 17. Productos con precio < 300 o stock > 900.
SELECT * FROM E01_PRODUCTO WHERE precio < 300 OR stock > 900;

-- 18. Clientes con activo = 0, 50 o 100.
SELECT * FROM E01_CLIENTE WHERE activo IN (0, 50, 100);

-- 19. Productos cuya marca termine con 'Company'.
SELECT * FROM E01_PRODUCTO WHERE marca LIKE '%Company';

-- 20. Clientes cuyo nombre empiece con 'C' y activo > 80.
SELECT * FROM E01_CLIENTE WHERE nombre LIKE 'C%' AND activo > 80;

-- 21. Productos ordenados por precio descendente.
SELECT * FROM E01_PRODUCTO ORDER BY precio DESC;

-- 22. Mostrar los 10 primeros clientes.
SELECT * FROM E01_CLIENTE ORDER BY nro_cliente ASC LIMIT 10;

-- 23. Producto más caro y más barato.
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo FROM E01_PRODUCTO;
SELECT * FROM E01_PRODUCTO
WHERE precio = (SELECT MAX(precio) FROM E01_PRODUCTO)
   OR precio = (SELECT MIN(precio) FROM E01_PRODUCTO);

-- 24. Contar clientes.
SELECT COUNT(*) AS total_clientes FROM E01_CLIENTE;

-- 25. Contar productos con precio > 500.
SELECT COUNT(*) AS productos_caros FROM E01_PRODUCTO WHERE precio > 500;

-- 26. Promedio de precios.
SELECT AVG(precio) AS promedio_precios FROM E01_PRODUCTO;

-- 27. Stock total.
SELECT SUM(stock) AS stock_total FROM E01_PRODUCTO;

-- SELECT * FROM E01_CLIENTE WHERE nro_cliente IN (101, 102);
-- DELETE FROM E01_CLIENTE WHERE nro_cliente IN (101, 102);
-- SELECT * FROM E01_CLIENTE WHERE nro_cliente IN (101, 102);

-- ( Ya habia creado los clientes anteriormente, pero al intentar insertarlos nuevamente
-- el sistema arrojaba error por registros duplicados. Por eso, primero tuve que 
-- eliminarlos para poder agregarlos otra vez correctamente )

-- 28. Insertar dos clientes nuevos (IDs únicos)
INSERT INTO E01_CLIENTE (nro_cliente, nombre, apellido, direccion, activo)
VALUES
(101, 'Brenda', 'Martinez', 'Viamonte 736', 30),
(102, 'Juan Cruz', 'Funes', 'Las Magnolias 1227', 70);

-- 29. Insertar dos productos nuevos (IDs únicos)
INSERT INTO E01_PRODUCTO (codigo_producto, marca, nombre, descripcion, precio, stock)
VALUES
(101, 'Paty', 'Hamburguesa Morron Asado', 'Productos Congelados', 4210, 50),
(102, 'Sadia', 'Lasagna Bolognesa', 'Productos Congelados', 3470, 20);

-- 30. Actualizar la dirección de un cliente
UPDATE E01_CLIENTE
SET direccion = 'Neuquen 36'
WHERE nro_cliente = 101;

-- 31. Actualizar stock de un producto restando 10 unidades
UPDATE E01_PRODUCTO
SET stock = stock - 10
WHERE codigo_producto = 102;

-- 32. Subir 10% precio de todos los productos de una marca específica 
UPDATE E01_PRODUCTO
SET precio = precio * 1.10
WHERE marca = 'Paty';

-- 33. Eliminar un cliente
DELETE FROM E01_CLIENTE WHERE nro_cliente = 102;

-- 34. Eliminar un producto
DELETE FROM E01_PRODUCTO WHERE codigo_producto = 102;
