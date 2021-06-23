FROM python:3.9.5

ENV PYTHONDONTWRITEBYTECODE = 1 PYTHONUNBUFFERED = 1

RUN apt update && apt install -y nginx htop nano && pip3 install pipenv

WORKDIR /usr/src/app
ADD . .
RUN chmod +x entrypoint.sh

# устанавливаем зависимости бекэнда
WORKDIR /usr/src/app/backend
RUN pipenv install --deploy --system

# готовим nginx - добавляем свой конфиг
ADD /backend/nginx/nginx.conf /etc/nginx/conf.d

# запускаем
ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh" ]















