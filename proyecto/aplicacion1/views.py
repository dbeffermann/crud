from django.shortcuts import render
from django.db import connection

def mostrar_ventas(request):
    # Función para obtener ventas por mes
    def ventas_por_mes():
        with connection.cursor() as cursor:
            cursor.execute("""
                -- Tu consulta SQL para ventas por mes aquí
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
            """)
            result = cursor.fetchall()
        return result

    # Función para obtener ventas por producto
    def ventas_por_producto():
        with connection.cursor() as cursor:
            cursor.execute("""
                -- Tu consulta SQL para ventas por producto aquí
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
            """)
            result = cursor.fetchall()
        return result

    # Función para obtener ventas por categoría
    def ventas_por_categoria():
        with connection.cursor() as cursor:
            cursor.execute("""
                -- Tu consulta SQL para ventas por categoría aquí
                           
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
            """)
            result = cursor.fetchall()
        return result

    ventas_mes = ventas_por_mes()
    ventas_producto = ventas_por_producto()
    ventas_categoria = ventas_por_categoria()
    print(ventas_mes)

    return render(request, 'mostrar_ventas.html', {
        'ventas_mes': ventas_mes,
        'ventas_producto': ventas_producto,
        'ventas_categoria': ventas_categoria,
    })
