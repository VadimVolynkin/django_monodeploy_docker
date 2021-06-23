# ===== конфиг для гуникорна в виде питонфайла ========================================================================
# запуск:
# в entrypoint gunicorn --config=/usr/src/app/backend/gunicorn/gunicorn.conf.py core.wsgi:application --reload 
# =====================================================================================================================

# bind = "0.0.0.0:8001"              # через tcp
bind = "unix:/run/gunicorn.sock"     # через unix socket
user = "root"
group = "root"
workers = 1
worker_class = 'sync'
worker_connections = 1000
timeout = 30
keepalive = 5

# pidfile = "/usr/src/app/backend/gunicorn/gunicorn.pid"


loglevel = "error"
# errorlog = '-'
errorlog = '/usr/src/app/backend/gunicorn/gunicorn_error.log'

# accesslog = '-'
accesslog = '/usr/src/app/backend/gunicorn/gunicorn_access.log'
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'