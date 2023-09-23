# crud
crud con django

Modelo de datos aplicacion1: 
https://dbdesigner.page.link/fdM51meLSBYEUrnR8

Instrucciones para correr el proyecto:

1. Navegar a la carpeta del proyecto

    ```bash
    cd crud
    ```

2. crear entorno virtual de python
    
    ```bash 
    python3 -m virtualenv virtual
    ```

3. activar entorno virtual

- para linux:
    ```bash
    source virtual/bin/activate
    ```
- para windows:

    ```bash
    virtual\Scripts\activate
    ```

4. instalar librerias de python en el entorno virtual

    ```bash
    pip install -r requirements.txt
    ```

5. Modificar parametros de coneccion a postgres en archivo settings.py

6. crear migraciones

    ```bash
    python manage.py makemigrations
    ```

7. aplicar migraciones

    ```bash
    python manage.py migrate
    ```
8. crear superusuario

    ```bash
    python manage.py createsuperuser
    ```
9. correr servidor

    ```bash
    python manage.py runserver
    ```

Para PgAdmin4:

1. Crear base de datos "aplicacion1"
2. Crear tablas con el siguiente script:

```sql
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
```