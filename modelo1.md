**Modelo Conceptual** 🌟

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

**Modelo Lógico** 📝

- **Tablas:**
  - Tabla `cliente`
    - Campos: 
      - id (Clave Primaria)
      - nombre
      - email
      - direccion
  - Tabla `categoria`
    - Campos:
      - id (Clave Primaria)
      - nombre
  - Tabla `producto`
    - Campos:
      - id (Clave Primaria)
      - nombre
      - categoria_id (Clave Foránea)
  - Tabla `pedido`
    - Campos:
      - id (Clave Primaria)
      - fecha_hora
      - cliente_id (Clave Foránea)
  - Tabla `detallepedido`
    - Campos:
      - id (Clave Primaria)
      - cantidad
      - precio_unitario
      - pedido_id (Clave Foránea)
      - producto_id (Clave Foránea)

**Modelo Físico** 💽

- **Definiciones SQL:**

```sql
-- Crear la tabla "clientes"
CREATE TABLE cliente (
    id serial PRIMARY KEY,
    nombre text,
    email text,
    direccion text
);

-- Crear la tabla "categorias"
CREATE TABLE categoria (
    id serial PRIMARY KEY,
    nombre text
);

-- Crear la tabla "productos"
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
    cantidad integer,
    precio_unitario numeric(10,2),
    pedido_id int REFERENCES pedido(id),
    producto_id int REFERENCES producto(id)
);

