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

CREATE TABLE LOCALIDADES (
LocalidadID INT,
Nombre VARCHAR(40),
CP VARCHAR(10),
Provincia VARCHAR(20), 
PRIMARY KEY (LocalidadID)
);

-- mostrar databases:
-- SHOW DATABASES; 

-- mostrar todas las tablas:
-- SHOW TABLES;

-- describir tabla clientes:
-- DESCRIBE CLIENTES;

-- modificar tabla facturas 
ALTER TABLE FACTURAS 
MODIFY MONTO DOUBLE UNSIGNED;

-- describir ahora tabla facturas: 
-- DESCRIBE FACTURAS; 

-- modificar tabla articulos 
ALTER TABLE articulos 
MODIFY Nombre VARCHAR(75),
MODIFY Precio DOUBLE UNSIGNED NOT NULL,
MODIFY Stock INT UNSIGNED NOT NULL

-- describir tabla clientes antes de modificar:
-- DESCRIBE CLIENTES;

-- modificar la tabla clientes
-- paso 1:
ALTER TABLE clientes
MODIFY Nombre VARCHAR(30) NOT NULL,
MODIFY Apellido varchar(35) NOT NULL,
CHANGE Comentarios Observaciones VARCHAR(255); 

-- paso 2:
ALTER TABLE clientes 
ADD COLUMN LocalidadID INT, 
ADD CONSTRAINT fk_clientes_final 
FOREIGN KEY (LocalidadID) REFERENCES LOCALIDADES(LocalidadID);

-- describir tabla clientes:
-- DESCRIBE CLIENTES;

