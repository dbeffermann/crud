**Restricciones de Campos en PostgreSQL**

En PostgreSQL, un campo puede tener varias restricciones además de las restricciones de nulidad (`NOT NULL`) y clave primaria (`PRIMARY KEY`). A continuación, se describen algunas de las restricciones más comunes que se pueden aplicar a un campo:

1. **UNIQUE**: Esta restricción asegura que los valores en el campo sean únicos en todas las filas de la tabla. No puede haber dos filas con el mismo valor en un campo marcado como `UNIQUE`.

```sql
CREATE TABLE ejemplo (
   id SERIAL PRIMARY KEY,
   codigo INT UNIQUE,
   nombre VARCHAR(255)
);
```

2. **CHECK**: La restricción CHECK permite definir una condición que los valores en el campo deben cumplir. Si un valor no cumple con la condición especificada, la inserción o actualización se bloqueará.

```sql
CREATE TABLE ejemplo (
   id SERIAL PRIMARY KEY,
   codigo INT UNIQUE,
   nombre VARCHAR(255),
   cantidad INT CHECK (cantidad > 0)
);
```

3. **DEFAULT**: Esta restricción permite definir un valor predeterminado para el campo. Si no se especifica un valor para el campo en una inserción, se utilizará el valor predeterminado.

```sql
CREATE TABLE ejemplo (
   id SERIAL PRIMARY KEY,
   codigo INT UNIQUE,
   nombre VARCHAR(255),
   cantidad INT CHECK (cantidad > 0) DEFAULT 0
);
```