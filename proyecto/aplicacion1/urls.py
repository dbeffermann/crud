from django.urls import path
from . import views

urlpatterns = [
    # Otras rutas aquí...
    path('mostrar_ventas/', views.mostrar_ventas, name='mostrar_ventas'),
]
