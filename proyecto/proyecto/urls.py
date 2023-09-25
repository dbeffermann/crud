from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('aplicacion1/', include('aplicacion1.urls')),
]
