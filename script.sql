-- Base de Datos I - Unidad 4 - Ej04: ComercioElectronico
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS DETALLE_PEDIDO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS TRANSPORTISTA;
DROP TABLE IF EXISTS DIRECCION;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS CATEGORIA;

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    id_categoria_padre INT,
    nombre_categoria VARCHAR(50),
    descripcion VARCHAR(50),
    FOREIGN KEY (id_categoria_padre) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE PRODUCTO (
    id_producto INT PRIMARY KEY,
    id_categoria INT,
    sku VARCHAR(50) UNIQUE,
    nombre_producto VARCHAR(50),
    precio DECIMAL(12,2),
    stock INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    dni INT UNIQUE,
    telefono VARCHAR(100)
);

CREATE TABLE DIRECCION (
    id_direccion INT PRIMARY KEY,
    id_cliente INT,
    calle VARCHAR(50),
    numero INT,
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(100),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE TRANSPORTISTA (
    id_transportista INT PRIMARY KEY,
    nombre_transportista VARCHAR(50),
    cuit VARCHAR(50) UNIQUE,
    telefono VARCHAR(50),
    tipo_servicio VARCHAR(50)
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    id_direccion INT,
    id_transportista INT,
    fecha_pedido DATE,
    estado_pedido VARCHAR(100),
    total DECIMAL(12,2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES DIRECCION(id_direccion),
    FOREIGN KEY (id_transportista) REFERENCES TRANSPORTISTA(id_transportista)
);

CREATE TABLE DETALLE_PEDIDO (
    id_detalle_pedido INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(12,2),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- Datos de CATEGORIA
INSERT INTO CATEGORIA (id_categoria, id_categoria_padre, nombre_categoria, descripcion) VALUES (1, NULL, 'Electrónica', 'Dispositivos electrónicos');
INSERT INTO CATEGORIA (id_categoria, id_categoria_padre, nombre_categoria, descripcion) VALUES (2, 1, 'Notebooks', 'Computadoras portátiles');
INSERT INTO CATEGORIA (id_categoria, id_categoria_padre, nombre_categoria, descripcion) VALUES (3, NULL, 'Hogar', 'Artículos para el hogar');
INSERT INTO CATEGORIA (id_categoria, id_categoria_padre, nombre_categoria, descripcion) VALUES (4, 3, 'Cocina', 'Utensilios de cocina');

-- Datos de PRODUCTO
INSERT INTO PRODUCTO (id_producto, id_categoria, sku, nombre_producto, precio) VALUES (1, 2, 'SKU-1002', 'Lenovo IdeaPad 3', 780000);
INSERT INTO PRODUCTO (id_producto, id_categoria, sku, nombre_producto, precio) VALUES (2, 2, 'SKU-1003', 'HP 15 Laptop', 820000);
INSERT INTO PRODUCTO (id_producto, id_categoria, sku, nombre_producto, precio) VALUES (3, 4, 'SKU-1004', 'Set de ollas Essen', 95000);
INSERT INTO PRODUCTO (id_producto, id_categoria, sku, nombre_producto, precio) VALUES (4, 4, 'SKU-1005', 'Sartén Hudson 24cm', 32000);

-- Datos de CLIENTE
INSERT INTO CLIENTE (id_cliente, nombre, apellido, email, dni) VALUES (1, 'Lucía', 'Fernández', 'lucia.f@mail.com', 38111000);
INSERT INTO CLIENTE (id_cliente, nombre, apellido, email, dni) VALUES (2, 'Mateo', 'Romero', 'mateo.r@mail.com', 39222000);
INSERT INTO CLIENTE (id_cliente, nombre, apellido, email, dni) VALUES (3, 'Camila', 'Acosta', 'camila.a@mail.com', 40333000);
INSERT INTO CLIENTE (id_cliente, nombre, apellido, email, dni) VALUES (4, 'Franco', 'Medina', 'franco.m@mail.com', 41444000);

-- Datos de DIRECCION
INSERT INTO DIRECCION (id_direccion, id_cliente, calle, numero, ciudad) VALUES (1, 1, 'Belgrano', 1280, 'Godoy Cruz');
INSERT INTO DIRECCION (id_direccion, id_cliente, calle, numero, ciudad) VALUES (2, 2, 'Las Heras', 77, 'Mendoza');
INSERT INTO DIRECCION (id_direccion, id_cliente, calle, numero, ciudad) VALUES (3, 3, 'Mitre', 905, 'Luján');
INSERT INTO DIRECCION (id_direccion, id_cliente, calle, numero, ciudad) VALUES (4, 4, 'Sarmiento', 330, 'Maipú');

-- Datos de TRANSPORTISTA
INSERT INTO TRANSPORTISTA (id_transportista, nombre_transportista, cuit, telefono, tipo_servicio) VALUES (1, 'Andreani', '30-50000001-1', '0800-222-0001', 'Domicilio');
INSERT INTO TRANSPORTISTA (id_transportista, nombre_transportista, cuit, telefono, tipo_servicio) VALUES (2, 'OCA', '30-50000002-2', '0800-222-0002', 'Domicilio');
INSERT INTO TRANSPORTISTA (id_transportista, nombre_transportista, cuit, telefono, tipo_servicio) VALUES (3, 'Correo Argentino', '30-50000003-3', '0800-222-0003', 'Domicilio');
INSERT INTO TRANSPORTISTA (id_transportista, nombre_transportista, cuit, telefono, tipo_servicio) VALUES (4, 'Cruz del Sur', '30-50000004-4', '0800-222-0004', 'Sucursal');

-- Datos de PEDIDO
INSERT INTO PEDIDO (id_pedido, id_cliente, id_direccion, id_transportista, fecha_pedido) VALUES (1, 2, 2, 2, '2026-09-05');
INSERT INTO PEDIDO (id_pedido, id_cliente, id_direccion, id_transportista, fecha_pedido) VALUES (2, 3, 3, 3, '2026-09-11');
INSERT INTO PEDIDO (id_pedido, id_cliente, id_direccion, id_transportista, fecha_pedido) VALUES (3, 1, 1, 1, '2026-09-20');
INSERT INTO PEDIDO (id_pedido, id_cliente, id_direccion, id_transportista, fecha_pedido) VALUES (4, 4, 4, 4, '2026-10-01');

-- Datos de DETALLE_PEDIDO
INSERT INTO DETALLE_PEDIDO (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario) VALUES (1, 1, 1, 1, 780000);
INSERT INTO DETALLE_PEDIDO (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario) VALUES (2, 2, 2, 2, 820000);
INSERT INTO DETALLE_PEDIDO (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario) VALUES (3, 3, 3, 1, 95000);
INSERT INTO DETALLE_PEDIDO (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario) VALUES (4, 4, 4, 3, 32000);
