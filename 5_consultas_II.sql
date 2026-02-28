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

-- EJERCICIO 1:
/* 
1- Utilizar la tabla Clientes y generar una
consulta que muestre las columnas ClienteID
y Dirección. En el resultado de la consulta, se
debe mostrar una nueva columna llamada
Nombre completo que concatene las
columnas Apellido, Nombre, separando los
valores de estos campos por un guion.
Para este primer ejercicio, utilizar la función
CONCAT.
*/

-- SELECT*FROM clientes;
SELECT ClienteID, Direccion, CONCAT(Apellido, '-', Nombre) AS 'Nombre completo'
FROM clientes;

/*
2 - Repetir el ejercicio anterior, utilizando la
función CONCAT_WS.
*/

SELECT ClienteID, Direccion, CONCAT_WS('-', Nombre, Apellido) AS 'Nombre completo' 
FROM clientes;

/*
3 - Modificar el ejercicio anterior para mostrar en
mayúsculas los valores cargados en el campo
Nombre.
*/

SELECT ClienteID, Direccion, CONCAT_WS('-', UPPER(Nombre), Apellido) AS 'Nombre completo' 
FROM clientes;

/*
4 - Generar una consulta que muestre la columna
Nombre. En el resultado de la consulta, se
debe mostrar una nueva columna con el
nombre Inicial que muestre la inicial de los
datos cargados en el campo Nombre.
*/

SELECT Nombre, LEFT(Nombre, 1) AS 'Inicial' FROM clientes;

/*
5 - Utilizar la tabla Facturas y obtener una
lista de todas las facturas cargadas en la
tabla. Generar una nueva columna con el
nombre IVA que calcule el 21% del total de
cada factura, obteniendo un valor
numérico que, como máximo, contenga 2
decimales.
*/

SELECT FacturaID, Letra, Número, ClienteID, Fecha, MONTO, ROUND(MONTO * 0.21, 2) AS IVA 
FROM facturas;

/* 
Modificar la consulta anterior, agregando una nueva
columna con el nombre NETO, que calcule el total a
pagar por cada cliente por las compras realizadas
(es decir, sumándole el IVA al cargo original,
manteniendo como máximo 2 decimales).
*/

SELECT FacturaID, Letra, Número, ClienteID, Fecha, MONTO, ROUND(MONTO * 0.21, 2) AS IVA,
ROUND(MONTO * 1.21, 2) AS NETO 
FROM facturas;

/*
Modificar la consulta anterior, agregando una nueva
columna con el nombre REDONDEO A FAVOR
CLIENTE que devuelva el valor entero inferior del
neto calculado anteriormente.
*/

SELECT FacturaID, Letra, Número, ClienteID, Fecha, MONTO, ROUND(MONTO * 0.21, 2) AS IVA,
ROUND(MONTO * 1.21, 2) AS NETO,
FLOOR(ROUND(MONTO * 1.21, 2)) AS 'Redondeo a favor cliente' 
FROM facturas;
