-- 1.

DROP DATABASE IF EXISTS Recitronic;

CREATE DATABASE Recitronic;

USE Recitronic;


CREATE TABLE Articulos
(
  id_articulo   INT         NOT NULL  AUTO_INCREMENT,
  tipo_articulo varchar(50) NOT NULL,
  estado        varchar(50) NOT NULL,
  id_cliente    INT         NOT NULL  ,
  PRIMARY KEY (id_articulo)
);

CREATE TABLE Citas
(
  id_cita    INT      NOT NULL  AUTO_INCREMENT,
  fecha_hora DATETIME NOT NULL,
  id_cliente INT      NOT NULL ,
  PRIMARY KEY (id_cita)
);

CREATE TABLE Clientes
(
  id_cliente INT          NOT NULL  AUTO_INCREMENT,
  nombre     varchar (50) NOT NULL,
  telefono   varchar(50)  NOT NULL,
  direccion  varchar(100) NULL    ,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE Pagos
(
  id_pago    INT      NOT NULL  AUTO_INCREMENT,
  monto      DECIMAL  NOT NULL,
  fecha_pago DATETIME NULL    ,
  id_cliente INT      NOT NULL  ,
  PRIMARY KEY (id_pago)
);

ALTER TABLE Articulos
  ADD CONSTRAINT FK_Clientes_TO_Articulos
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

ALTER TABLE Citas
  ADD CONSTRAINT FK_Clientes_TO_Citas
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

ALTER TABLE Pagos
  ADD CONSTRAINT FK_Clientes_TO_Pagos
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

----------------------------------------------------------------
--2.


USE Recitronic;

INSERT INTO Clientes (nombre, telefono, direccion) VALUES
('Bart Simpson', '555-1234', 'Calle Falsa 123'),
('Maggie Simpson', '555-5678', 'Avenida Siempre Viva 742'),
('Ned Flanders', '555-9876', 'Av. Siempre Viva 742'),
('Moe Szyslak', '555-5432', 'Calle Falsa 123'),
('Homer Simpson', '555-8765', 'Boulevard Central 456'),
('Lisa Simpson', '555-4321', 'Calle Falsa 789');

INSERT INTO Articulos (tipo_articulo, estado, id_cliente) VALUES
('Laptop', 'En reparación', 1),
('Smartphone', 'Reparado', 2),
('Tablet', 'En espera de piezas', 3),
('Desktop', 'Reparado', 4),
('Smartwatch', 'En reparación', 5),
('E-reader', 'Reparado', 6),
('Smartphone', 'Reparado', 1),
('Laptop', 'En espera de piezas', 2),
('Tablet', 'En reparación', 3),
('Desktop', 'Reparado', 4),
('Smartwatch', 'En espera de piezas', 5),
('E-reader', 'Reparado', 6),
('Smartphone', 'Reparado', 1),
('Laptop', 'En espera de piezas', 2),
('Tablet', 'En reparación', 3),
('Desktop', 'Reparado', 4),
('Smartwatch', 'En espera de piezas', 5),
('E-reader', 'Reparado', 6),
('Smartphone', 'Reparado', 1);

INSERT INTO citas (fecha_hora, id_cliente) VALUES
('2024-10-01 10:00:00', 1),
('2024-10-02 11:30:00', 2),
('2024-10-03 14:00:00', 3),
('2024-10-04 09:00:00', 4),
('2024-10-05 15:30:00', 5),
('2024-10-06 13:00:00', 6),
('2024-10-07 10:30:00', 1),
('2024-10-08 11:00:00', 2),
('2024-10-09 14:30:00', 3),
('2024-10-10 09:30:00', 4),
('2024-10-11 15:00:00', 5),
('2024-10-12 13:30:00', 6),
('2024-10-13 10:15:00', 1),
('2024-10-14 11:45:00', 2),
('2024-10-15 14:15:00', 3),
('2024-10-16 09:15:00', 4),
('2024-10-17 15:45:00', 5),
('2024-10-18 13:15:00', 6),
('2024-10-19 10:45:00', 1);

INSERT INTO pagos (monto, fecha_pago, id_cliente) VALUES
(1000.00, '2024-10-01 10:00:00', 1),
(2000.00, '2024-10-02 11:30:00', 2),
(3000.00, '2024-10-03 14:00:00', 3),
(4000.00, '2024-10-04 09:00:00', 4),
(5000.00, '2024-10-05 15:30:00', 5),
(6000.00, '2024-10-06 13:00:00', 6),
(7000.00, '2024-10-07 10:30:00', 1),
(8000.00, '2024-10-08 11:00:00', 2),
(9000.00, '2024-10-09 14:30:00', 3),
(10000.00, '2024-10-10 09:30:00', 4),
(11000.00, '2024-10-11 15:00:00', 5),
(12000.00, '2024-10-12 13:30:00', 6),
(13000.00, '2024-10-13 10:15:00', 1),
(14000.00, '2024-10-14 11:45:00', 2),
(15000.00, '2024-10-15 14:15:00', 3),
(16000.00, '2024-10-16 09:15:00', 4),
(17000.00, '2024-10-17 15:45:00', 5),
(18000.00, '2024-10-18 13:15:00', 6),
(19000.00, '2024-10-19 10:45:00', 1),
(20000.00, '2024-10-20 12:00:00', 2),
(21000.00, '2024-10-21 14:30:00', 3),
(22000.00, '2024-10-22 16:00:00', 4),
(23000.00, '2024-10-23 18:30:00', 5),
(24000.00, '2024-10-24 20:00:00', 6) 

----------------------------------------------------------------
-- 3.
USE Recitronic;
START TRANSACTION;

-- Insertar 1 Pagos
INSERT INTO Pagos (monto, fecha_pago, id_cliente) VALUES
(25000.00, '2024-10-25 10:00:00', 1);

-- Cambiar estado de 1 Articulos
UPDATE Articulos
SET estado = 'Reparado'
WHERE id_articulo = 1;

-- verificar que el estado se ha cambiado
DELIMITER //
CREATE PROCEDURE ActualizarEstadoArticulo()
BEGIN
    START TRANSACTION;
    UPDATE Articulos
    SET estado = 'Reparado'
    WHERE id_articulo = 1;
    IF ROW_COUNT() > 0 THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;

USE Recitronic;
START TRANSACTION;
UPDATE Articulos
SET estado = 'Reparado'
WHERE id_articulo = 3;
COMMIT;


USE Recitronic;
START TRANSACTION;
UPDATE Citas
SET fecha_hora = '2024-11-01 10:00:00'
WHERE id_cita = 1;
COMMIT;

USE Recitronic;

DELETE FROM Citas
WHERE id_cita = 2;
COMMIT;


----------------------------------------------------------------
-- 4.
USE Recitronic;

select * from articulos;

ALTER TABLE Articulos AUTO_INCREMENT = 101;

INSERT INTO Articulos (tipo_articulo, estado, id_cliente) VALUES
('Laptop', 'En reparación', 1);

select * from Articulos;

----------------------------------------------------------------
-- 5.
USE Recitronic;