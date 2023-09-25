-- Crear la tabla "cliente"
CREATE TABLE cliente (
    id serial PRIMARY KEY,
    nombre text,
    email text UNIQUE,
    direccion text
);

-- Crear la tabla "categoria"
CREATE TABLE categoria (
    id serial PRIMARY KEY,
    nombre text UNIQUE
);

-- Crear la tabla "producto"
CREATE TABLE producto (
    id serial PRIMARY KEY,
    nombre text,
    categoria_id int REFERENCES categoria(id)
);

-- Crear la tabla "pedidos"
CREATE TABLE pedido (
    id serial PRIMARY KEY,
    fecha_hora timestamp,
    cliente_id int REFERENCES cliente(id)
);

-- Crear la tabla "detalles_pedidos"
CREATE TABLE detallepedido (
    id serial PRIMARY KEY,
    cantidad integer CHECK (cantidad >= 0),
    precio_unitario numeric(10,2) CHECK (precio_unitario >= 0),
    pedido_id int REFERENCES pedido(id),
    producto_id int REFERENCES producto(id)
);


-- Insertar Datos en la Tabla de Categorías:
INSERT INTO categoria (nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Alimentación');

-- Insertar Datos en la Tabla de Clientes:
INSERT INTO cliente (nombre, email, direccion) VALUES
('Cliente 1', 'cliente1@example.com', 'Dirección Cliente 1'),
('Cliente 2', 'cliente2@example.com', 'Dirección Cliente 2'),
('Cliente 3', 'cliente3@example.com', 'Dirección Cliente 3');

-- Insertar Datos en la Tabla de Pedidos:
INSERT INTO pedido (fecha_hora, cliente_id) VALUES
('2023-09-15 10:00:00', 1),
('2023-09-16 14:30:00', 2),
('2023-09-17 09:15:00', 3);

-- Insertar Datos en la Tabla de Productos:
INSERT INTO producto (nombre, categoria_id) VALUES
('Smartphone', 1),
('Camiseta', 2),
('Sartén', 3),
('Leche', 4);

-- Insertar Datos en la Tabla de Detalles de Pedidos:
INSERT INTO detallepedido (cantidad, precio_unitario, pedido_id, producto_id) VALUES
(2, 150.00, 1, 1),
(1, 75.00, 1, 2),
(3, 30.00, 2, 3),
(1, 200.00, 3, 4),
(2, 50.00, 3, 1);