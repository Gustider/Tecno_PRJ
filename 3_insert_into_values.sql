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

-- describo localidades:
-- DESCRIBE LOCALIDADES; 

-- inserto la información:
INSERT INTO LOCALIDADES (LocalidadID, Nombre, CP, Provincia) VALUES
(1, 'CABA', '1000', 'Buenos Aires'),
(2, 'Rosario', '2000', 'Santa Fe'),
(3, 'Córdoba', '5000', 'Córdoba'),
(4, 'San Miguel de Tucumán', '4000', 'Tucumán'),
(5, 'Neuquén', '8300', 'Neuquén')

-- describe la tabla clientes:
-- DESCRIBE CLIENTES;

INSERT INTO CLIENTES (ClienteID, Nombre, Apellido, CUIT, Direccion, Observaciones, LocalidadID) VALUES 
(5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP',3),
(14, 'Gloria', 'Fernández', ' 23-35965852-5', 'Constitución 323', 'GBA',1),
(17, 'Gonzalo', 'López', '23-33587416-0',' Arias 2624', 'GBA', 5),
(26, 'Carlos', 'García', ' 23-42321230-9', ' Pasteur 322 - 2ºC', 'VIP',2),
(50, 'Micaela', 'Altieri', '23-22885566-5', ' Santamarina 1255', 'GBA',4)

-- describe la tabla artículos: 
-- DESCRIBE ARTICULOS;

INSERT INTO ARTICULOS (ArticuloID, Nombre, Precio, Stock) VALUES 
(95,'Webcam con Micrófono Plug & Play', ' 513.35', 39),
(157, 'Apple AirPods Pro', '979.75', 152),
(335, 'Lavasecarropas Automático Samsung', '1589.50', 12),
(411, ' Gloria Trevi / Gloria / CD+DVD', ' 2385.70', 2)

-- describe la tabla facturas:
-- DESCRIBE FACTURAS;

INSERT INTO FACTURAS (FacturaID, Letra, Número, ClienteID, Fecha, MONTO) VALUES 
(1, 'A', 28, 14, '2021-03-18', 1589.50),
(2, 'A', 39, 26, '2021-04-12',  979.75),
(3, 'B', 8, 17, '2021-04-25', 513.35), 
(4, 'B', 12, 5, '2021-05-01',  2385.70),
(5, 'B', 19, 50, '2022-05-26',  979.75)

-- insertamos 15 registros que le pedimos a la IA (Gemini) generados aleatoriamente:
INSERT INTO DETALLE (DetalleID, ArticuloID, FacturaID, Cantidad) VALUES 
(1, 95, 1, 2),
(2, 335, 1, 1),
(3, 157, 2, 3),
(4, 411, 2, 1),
(5, 95, 3, 5),
(6, 157, 3, 2),
(7, 335, 4, 1),
(8, 411, 4, 4),
(9, 95, 5, 1),
(10, 157, 5, 10),
(11, 335, 5, 2),
(12, 95, 2, 3),
(13, 411, 1, 2),
(14, 157, 4, 1),
(15, 335, 3, 1);

-- Insertamos otra tabla, esta vez con ayuda de la IA (Gemini):
CREATE TABLE IF NOT EXISTS CATEGORIA (
    CategoriaID INT NOT NULL AUTO_INCREMENT, -- Se numera solo
    Nombre VARCHAR(50) NOT NULL UNIQUE,      -- No permite nombres repetidos
    Descripcion VARCHAR(255) DEFAULT 'Sin descripción', -- Valor por defecto si se olvida
    PRIMARY KEY (CategoriaID)
) ENGINE=InnoDB; -- Define el motor de almacenamiento estándar


-- Le pedimos a la IA que genere 10 registros para "categoria":
INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Smartphones', 'Dispositivos móviles de gama alta y media con las últimas innovaciones.'),
('Laptops', 'Computadoras portátiles para oficina, diseño gráfico y alto rendimiento.'),
('Monitores', 'Pantallas de alta resolución, 4K y ultra-wide para productividad y gaming.'),
('Audio', 'Auriculares inalámbricos, barras de sonido y sistemas de audio profesional.'),
('Wearables', 'Relojes inteligentes y dispositivos de seguimiento de salud y deporte.'),
('Networking', 'Equipos de conectividad, routers Wi-Fi 6 y soluciones de red empresarial.'),
('Almacenamiento', 'Discos SSD, unidades externas y tarjetas de memoria de gran velocidad.'),
('Periféricos', 'Teclados mecánicos, ratones ergonómicos y accesorios de entrada.'),
('Realidad Virtual', 'Visores y accesorios para experiencias inmersivas y desarrollo.'),
('Cables y Adaptadores', 'Conectividad esencial, cargadores rápidos y adaptadores de video.'); 

-- Se vinculan las tablas categoria con articulos mediante foreign key:
-- primero agregamos columna (DDL)
ALTER TABLE ARTICULOS 
ADD COLUMN CategoriaID INT NOT NULL DEFAULT 1;

-- después creamos la relacion (Foreign key):
ALTER TABLE ARTICULOS
ADD CONSTRAINT fk_articulos_categoria
FOREIGN KEY (CategoriaID) REFERENCES CATEGORIA(CategoriaID);

