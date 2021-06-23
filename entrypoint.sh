#!/bin/bash

# ============================================================================
# Запуск NGINX ПРИ СТАРТЕ
# ============================================================================
service nginx start

# ============================================================================
# СТАТИКА И МИГРАЦИИ ПРИ СТАРТЕ
# ============================================================================

# ===== миграции базы
# python manage.py makemigrations --no-input
# python manage.py migrate --no-input


# ===== собираем статику -> /static/
# python manage.py collectstatic --no-input
 
# ============================================================================
# КАК БУДЕМ ЗАПУСКАТЬ
# ============================================================================

# = джанго runserver
# python manage.py runserver 0.0.0.0:8000                      

# = uwsgi
uwsgi --ini /usr/src/app/backend/uwsgi/emperor.ini

# = gunicorn
# gunicorn --config=/usr/src/app/backend/gunicorn/gunicorn.conf.py core.wsgi:application --reload 

