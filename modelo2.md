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
  - Tabla `clientes`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - email
      - direccion
      - CONSTRAINT clientes_email_unique UNIQUE (email) -- Restricción UNIQUE
  - Tabla `categorias`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - CONSTRAINT categorias_nombre_unique UNIQUE (nombre) -- Restricción UNIQUE
  - Tabla `productos`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - categoria_id (Clave Foránea a categorias)
  - Tabla `pedidos`
    - Campos:
      - id (Clave Primaria)
      - fecha_hora
      - cliente_id (Clave Foránea a clientes)
  - Tabla `detalles_pedidos`
    - Campos:
      - id (Clave Primaria)
      - cantidad
      - precio_unitario
      - pedido_id (Clave Foránea a pedidos)
      - producto_id (Clave Foránea a productos)
      - CONSTRAINT detalles_pedidos_cantidad_check CHECK (cantidad >= 0) -- Restricción CHECK
      - CONSTRAINT detalles_pedidos_precio_unitario_check CHECK (precio_unitario >= 0) -- Restricción CHECK

**Modelo Físico** 💽 (Versión 2)

- **Definiciones SQL:**

```sql
-- Crear la tabla "clientes"
CREATE TABLE clientes (
    id serial PRIMARY KEY,
    nombre text,
    email text UNIQUE,
    direccion text
);

-- Crear la tabla "categorias"
CREATE TABLE categorias (
    id serial PRIMARY KEY,
    nombre text UNIQUE,
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
    cantidad integer CHECK (cantidad >= 0),
    precio_unitario numeric(10,2) CHECK (precio_unitario >= 0),
    pedido_id int REFERENCES pedidos(id),
    producto_id int REFERENCES productos(id)
);
