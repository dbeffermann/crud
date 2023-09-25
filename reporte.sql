--Ventas por Mes:
-- Esta consulta te proporcionará la cantidad total de ventas por mes.

SELECT
    EXTRACT(MONTH FROM fecha_hora) AS mes,
    EXTRACT(YEAR FROM fecha_hora) AS anio,
    SUM(aplicacion1_detallepedido.cantidad * aplicacion1_detallepedido.precio_unitario) AS total_ventas
FROM
    aplicacion1_pedido
INNER JOIN
    aplicacion1_detallepedido ON aplicacion1_pedido.id = aplicacion1_detallepedido.pedido_id
GROUP BY
    anio, mes
ORDER BY
    anio, mes;

-- Ventas por Producto:
-- Esta consulta te proporcionará la cantidad total de ventas por producto en orden descendente.

SELECT
    aplicacion1_producto.nombre AS producto,
    SUM(aplicacion1_detallepedido.cantidad) AS cantidad_vendida,
    SUM(aplicacion1_detallepedido.cantidad * aplicacion1_detallepedido.precio_unitario) AS total_ventas

FROM
    aplicacion1_detallepedido
INNER JOIN
    aplicacion1_producto ON aplicacion1_detallepedido.producto_id = aplicacion1_producto.id
GROUP BY
    producto
ORDER BY
    cantidad_vendida DESC;

-- Ventas por Categoría:
-- Esta consulta te proporcionará la cantidad total de ventas por categoría en orden descendente.

SELECT
    aplicacion1_categoria.nombre AS categoria,
    SUM(aplicacion1_detallepedido.cantidad) AS cantidad_vendida,
    SUM(aplicacion1_detallepedido.cantidad * aplicacion1_detallepedido.precio_unitario) AS total_ventas
FROM
    aplicacion1_detallepedido
INNER JOIN
    aplicacion1_producto ON aplicacion1_detallepedido.producto_id = aplicacion1_producto.id
INNER JOIN
    aplicacion1_categoria ON aplicacion1_producto.categoria_id = aplicacion1_categoria.id
GROUP BY
    categoria
ORDER BY
    cantidad_vendida DESC;
