FROM  python:3.7-alpine

ENV PYTHONUNBUFFERED 1


#RUN	pip install -U setuptools pip

COPY ./requirements.txt /requirements.txt

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app

COPY ./app /app

RUN adduser -D user
USER user
