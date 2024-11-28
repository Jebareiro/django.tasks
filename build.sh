#!/usr/bin/env bash
# Exit on error
set -o errexit

# Actualizar pip
python -m pip install --upgrade pip

# Instalar las dependencias
pip install -r requirements.txt

# Convertir los archivos estáticos
python manage.py collectstatic --no-input

# Aplicar las migraciones de base de datos
python manage.py migrate

# Iniciar la aplicación con gunicorn
gunicorn gestortareas.wsgi:application
