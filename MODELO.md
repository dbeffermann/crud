# Modelo de Datos para una Aplicación de Comercio Electrónico

## Tablas de la Base de Datos

### Clientes (clientes):

- Esta tabla almacena la información de los clientes que utilizan la aplicación.
- **Campos:**
  - `id`: Identificador único del cliente.
  - `nombre`: Nombre del cliente.
  - `email`: Dirección de correo electrónico del cliente.
  - `direccion`: Dirección de envío del cliente.
- La integridad de datos se mantiene a través del campo `id`, que es una clave primaria (`PRIMARY KEY`) que garantiza que cada cliente tenga un identificador único.

### Categorías (categorias):

- Esta tabla almacena las categorías de productos disponibles en la tienda.
- **Campos:**
  - `id`: Identificador único de la categoría.
  - `nombre`: Nombre de la categoría.
- La integridad de datos se mantiene a través del campo `id`, que es una clave primaria.

### Productos (productos):

- Esta tabla almacena los detalles de los productos disponibles para la venta.
- **Campos:**
  - `id`: Identificador único del producto.
  - `nombre`: Nombre del producto.
  - `categoria_id`: Clave foránea que hace referencia a la categoría a la que pertenece el producto (relación de uno a muchos).
- La integridad de datos se mantiene mediante la relación de clave foránea `categoria_id`, que garantiza que cada producto esté asociado a una categoría válida.

### Pedidos (pedidos):

- Esta tabla almacena información sobre los pedidos realizados por los clientes.
- **Campos:**
  - `id`: Identificador único del pedido.
  - `fecha_hora`: Fecha y hora en que se realizó el pedido.
  - `cliente_id`: Clave foránea que hace referencia al cliente que realizó el pedido (relación de uno a muchos).
- La integridad de datos se mantiene a través de la relación de clave foránea `cliente_id`, que garantiza que cada pedido esté asociado a un cliente válido.

### Detalles de Pedidos (detalles_pedidos):

- Esta tabla almacena los detalles de los productos incluidos en cada pedido.
- **Campos:**
  - `id`: Identificador único del detalle del pedido.
  - `cantidad`: Cantidad de productos pedidos.
  - `precio_unitario`: Precio unitario del producto en el momento del pedido.
  - `pedido_id`: Clave foránea que hace referencia al pedido al que pertenece este detalle (relación de uno a muchos).
  - `producto_id`: Clave foránea que hace referencia al producto incluido en este detalle (relación de uno a muchos).
- La integridad de datos se mantiene a través de las relaciones de clave foránea `pedido_id` y `producto_id`, que garantizan que cada detalle de pedido esté asociado a un pedido válido y a un producto válido.

