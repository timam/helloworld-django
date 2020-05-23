FROM python:3.6-slim

WORKDIR /app
RUN mkdir src

ADD requirements.txt /app

RUN apt-get update && apt-get install build-essential curl -y && apt-get install -y default-libmysqlclient-dev
RUN pip3 install -U pip
RUN pip3 install -r requirements.txt && \
    apt-get --purge autoremove build-essential -y

COPY src /app/src/
ENTRYPOINT ["python", "/app/src/parasite/manage.py","runserver"]
