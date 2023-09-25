--Ventas por Mes:
-- Esta consulta te proporcionará la cantidad total de ventas por mes.

SELECT
    EXTRACT(MONTH FROM fecha_hora) AS mes,
    EXTRACT(YEAR FROM fecha_hora) AS anio,
    SUM(detallepedido.cantidad * detallepedido.precio_unitario) AS total_ventas
FROM
    pedido
INNER JOIN
    detallepedido ON pedido.id = detallepedido.pedido_id
GROUP BY
    anio, mes
ORDER BY
    anio, mes;

-- Ventas por Producto:
-- Esta consulta te proporcionará la cantidad total de ventas por producto en orden descendente.

SELECT
    producto.nombre AS producto,
    SUM(detallepedido.cantidad) AS cantidad_vendida,
    SUM(detallepedido.cantidad * detallepedido.precio_unitario) AS total_ventas

FROM
    detallepedido
INNER JOIN
    producto ON detallepedido.producto_id = producto.id
GROUP BY
    producto
ORDER BY
    cantidad_vendida DESC;

-- Ventas por Categoría:
-- Esta consulta te proporcionará la cantidad total de ventas por categoría en orden descendente.

SELECT
    categoria.nombre AS categoria,
    SUM(detallepedido.cantidad) AS cantidad_vendida,
    SUM(detallepedido.cantidad * detallepedido.precio_unitario) AS total_ventas
FROM
    detallepedido
INNER JOIN
    producto ON detallepedido.producto_id = producto.id
INNER JOIN
    categoria ON producto.categoria_id = categoria.id
GROUP BY
    categoria
ORDER BY
    cantidad_vendida DESC;
