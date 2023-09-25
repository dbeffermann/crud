-- Crear la tabla "cliente"
CREATE TABLE cliente (
    id serial PRIMARY KEY,
    nombre text,
    email text,
    direccion text
);

-- Crear la tabla "categoria"
CREATE TABLE categoria (
    id serial PRIMARY KEY,
    nombre text
);

-- Crear la tabla "producto"
CREATE TABLE producto (
    id serial PRIMARY KEY,
    nombre text,
    categoria_id int REFERENCES categorias(id)
);

-- Crear la tabla "pedido"
CREATE TABLE pedido (
    id serial PRIMARY KEY,
    fecha_hora timestamp,
    cliente_id int REFERENCES clientes(id)
);

-- Crear la tabla "detallepedido"
CREATE TABLE detallepedido (
    id serial PRIMARY KEY,
    cantidad integer,
    precio_unitario numeric(10,2),
    pedido_id int REFERENCES pedidos(id),
    producto_id int REFERENCES productos(id)
);