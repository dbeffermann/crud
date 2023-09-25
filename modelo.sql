-- Crear la tabla "clientes"
CREATE TABLE clientes (
    id serial PRIMARY KEY,
    nombre text,
    email text,
    direccion text
);

-- Crear la tabla "categorias"
CREATE TABLE categorias (
    id serial PRIMARY KEY,
    nombre text
);

-- Crear la tabla "productos"
CREATE TABLE productos (
    id serial PRIMARY KEY,
    nombre text,
    categoria_id int REFERENCES categorias(id)
);

-- Crear la tabla "pedidos"
CREATE TABLE pedidos (
    id serial PRIMARY KEY,
    fecha_hora timestamp,
    cliente_id int REFERENCES clientes(id)
);

-- Crear la tabla "detalles_pedidos"
CREATE TABLE detalles_pedidos (
    id serial PRIMARY KEY,
    cantidad integer,
    precio_unitario numeric(10,2),
    pedido_id int REFERENCES pedidos(id),
    producto_id int REFERENCES productos(id)
);