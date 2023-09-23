from django.contrib import admin

# Register your models here.
from .models import Cliente, Categoria, Producto, Pedido, DetallePedido

admin.site.register(Cliente)
admin.site.register(Categoria)
admin.site.register(Producto)
admin.site.register(Pedido)
admin.site.register(DetallePedido)

