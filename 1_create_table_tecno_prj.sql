 
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

 CREATE DATABASE IF NOT EXISTS TECNO_PRJ; 
 USE TECNO_PRJ;
 
 CREATE TABLE CLIENTES (
 ClienteID INT NOT NULL,
 Nombre VARCHAR(25),
 Apellido VARCHAR(25), 
 CUIT CHAR(16),
 Direccion VARCHAR(50),
 Comentarios VARCHAR(50),
 PRIMARY KEY (ClienteID)
 );
 
 CREATE TABLE ARTICULOS (
 ArticuloID INT NOT NULL ,
 Nombre VARCHAR(50),
 Precio DOUBLE,
 Stock INT,
 PRIMARY KEY (ArticuloID)
 );
 
 CREATE TABLE FACTURAS (
 FacturaID INT NOT NULL,
 Letra CHAR(1),
 Número INT,
 ClienteID INT, 
 Fecha DATE, 
 Monto DOUBLE,
 PRIMARY KEY (FacturaID),
 FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ClienteID)
);
 
 CREATE TABLE DETALLE (
 DetalleID INT NOT NULL,
 ArticuloID INT,
 FacturaID INT,
 Cantidad INT,
 PRIMARY KEY (DetalleID),
 FOREIGN KEY (ArticuloID) REFERENCES ARTICULOS(ArticuloID),
 FOREIGN KEY (FacturaID) REFERENCES FACTURAS(FacturaID)
 );