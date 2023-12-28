FROM python:alpine

ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code/

RUN apk update && apk upgrade && \
    apk add libpq-dev python3-dev alpine-sdk

RUN pip install -r requirements.txt

COPY . /code/

CMD python3 manage.py makemigrations && \
    python3 manage.py migrate