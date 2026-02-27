/* ======================================================================
Proyecto: TECNO_PRJ - Gestión de bases de datos
Estudiante: Gustavo Astorga
GitHub: https://github.com/Gustider
==========================================================================
NOTA: Las instrucciones 'DESCRIBE' y 'SHOW' han sido comentadas para 
      garantizar una ejecución fluida y limpia del sistema. 
      Pueden descomentarse para tareas de verificación.
==========================================================================
*/

USE tecno_prj;

/* 
Se necesita obtener el siguiente reporte:
1 - Listado que incluya tanto los
artículos como las categorías en el
mismo informe.
2 - Listado que incluya tanto los clientes
como las localidades en el mismo
informe.
*/

SELECT ArticuloID AS ID, Nombre, Precio, Stock, 'Articulo' AS Tipo FROM ARTICULOS
UNION
SELECT CategoriaID AS ID, Nombre, NULL AS Precio, NULL AS Stock, 'Categoria' AS Tipo FROM CATEGORIA;


SELECT ClienteID AS ID, Nombre, Apellido, Direccion, 'Cliente' AS Tipo FROM CLIENTES
UNION
SELECT LocalidadID AS ID, Nombre, Provincia, NULL, 'Localidad' AS Tipo FROM LOCALIDADES;

/* Se necesitan aplicar ciertos filtros en los
reportes, por lo que:
- En el listado se deben seleccionar
solo a los CLIENTES, cuyo Apellido
comience con la letra 'G' y aquellas
localidades que pertenecen a la
provincia 'Buenos Aires'.
 */
 
SELECT Nombre, Apellido, 'Cliente' AS Tipo FROM CLIENTES
WHERE Apellido LIKE 'G%' 
UNION
SELECT Nombre, Provincia AS Apellido, 'Localidad' AS Tipo FROM LOCALIDADES
WHERE Provincia = 'Buenos Aires'; 

/* 
- Crear un prompt para que primero muestre
los artículos con más de 50 unidades
disponibles y luego muestre los detalles
relacionados. Debe combinar los resultados
en una sola lista, asegurándose una
estrategia que combine los resultados de
dos consultas.
- Ejecutar el código propuesto. 
*/
-- Consulta 1: Artículos con stock mayor a 50
SELECT ArticuloID AS ID, Nombre, Stock, 'Mucho Stock' AS Observacion
FROM articulos
WHERE Stock > 50
UNION
-- Consulta 2: Artículos con stock de 50 o menos (detalles relacionados)
SELECT ArticuloID AS ID, Nombre, Stock, 'Stock Limitado' AS Observacion
FROM articulos WHERE Stock <= 50;

/*
Se necesita obtener el siguiente reporte:
- Listado de clientes junto con los
datos de la localidad en la que se
encuentran.
*/
SELECT c.nombre, c.apellido, l.nombre, l.provincia, l.CP
FROM clientes c 
JOIN localidades l 
ON c.LocalidadID = l.LocalidadID 

/*
Se necesita un listado de todas las facturas
junto con los detalles de los artículos que
están asociados a cada una de ellas, no es
necesaria la información de los artículos
*/

SELECT f.FacturaID, f.Letra, f.Número, f.Fecha, f.Monto, d.ArticuloID, d.Cantidad
FROM FACTURAS f
JOIN DETALLE d
ON f.FacturaID = d.FacturaID;

/*
Se necesita el mismo listado, pero
incluyendo el nombre de los artículos
vendidos.
*/
SELECT
f.FacturaID, f.Letra, f.Número, f.Fecha, f.Monto,
d.ArticuloID, a.Nombre AS NombreArticulo,
d.Cantidad
FROM FACTURAS f
JOIN DETALLE d
ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a
ON d.ArticuloID = a.ArticuloID;

/*
Se necesitan los datos de las facturas que
están a nombre del cliente con apellido
"García".
*/

SELECT
f.FacturaID, f.Letra, f.Número, f.Fecha, f.Monto,
c.Nombre, c.Apellido
FROM FACTURAS f
JOIN CLIENTES c
ON f.ClienteID = c.ClienteID
WHERE c.Apellido = 'García';

/*
Y, por último, obtener los artículos que
compró el cliente con apellido "López"
*/
 
SELECT
a.Nombre AS ArticuloNombre,
c.Nombre AS ClienteNombre,
c.Apellido AS ClienteApellido
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
WHERE c.Apellido = 'López';

 