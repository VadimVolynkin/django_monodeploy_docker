FROM python:3.9.5-buster

ENV PYTHONDONTWRITEBYTECODE = 1 PYTHONUNBUFFERED = 1

RUN apt update && apt install -y --no-install-recommends nginx htop nano && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install pipenv 

# готовим nginx - добавляем свой конфиг
ADD /backend/nginx/nginx.conf /etc/nginx/conf.d    

# устанавливаем зависимости бекэнда
WORKDIR /usr/src/app/backend   
ADD /backend/Pipfile* ./
RUN pipenv install --deploy --system
    
# copy all
WORKDIR /usr/src/app
ADD . .

# запускаем
RUN chmod +x entrypoint.sh
ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh" ]















