**Modelo Conceptual** 🌟 (Versión 2)

- **Entidades:**
  - Cliente
  - Categoría
  - Producto
  - Pedido
  - Detalle de Pedido

- **Relaciones:**
  - Un cliente puede realizar varios pedidos.
  - Un pedido puede contener varios productos.
  - Un producto pertenece a una categoría.
  - Un detalle de pedido está asociado a un pedido y a un producto.

**Modelo Lógico** 📝 (Versión 2)

- **Tablas:**
  - Tabla `cliente`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - email
      - direccion
      - CONSTRAINT cliente_email_unique UNIQUE (email) -- Restricción UNIQUE
  - Tabla `categoria`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - CONSTRAINT categoria_nombre_unique UNIQUE (nombre) -- Restricción UNIQUE
  - Tabla `producto`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - categoria_id (Clave Foránea a categorias)
  - Tabla `pedido`
    - Campos:
      - id (Clave Primaria)
      - fecha_hora
      - cliente_id (Clave Foránea a clientes)
  - Tabla `detallepedido`
    - Campos:
      - id (Clave Primaria)
      - cantidad
      - precio_unitario
      - pedido_id (Clave Foránea a pedidos)
      - producto_id (Clave Foránea a productos)
      - CONSTRAINT detallepedido_cantidad_check CHECK (cantidad >= 0) -- Restricción CHECK
      - CONSTRAINT detallepedido_precio_unitario_check CHECK (precio_unitario >= 0) -- Restricción CHECK

**Modelo Físico** 💽 (Versión 2)

- **Definiciones SQL:**

```sql
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
