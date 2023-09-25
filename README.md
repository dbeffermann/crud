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

    ```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': 'aplicacion1', # la base de datos que creaste
            'USER': 'postgres', # el usuario que hayas creado
            'PASSWORD': 'postgres', # la contraseña que hayas creado
            'HOST': 'localhost', # la dirección IP de tu servidor PostgreSQL
            'PORT': '5433', # El puerto por defecto de PostgreSQL es 5432
        }
    }
    ```

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
10. ingresar a la url http://localhost:8000/admin/ y loguearse con el superusuario creado en el paso 8