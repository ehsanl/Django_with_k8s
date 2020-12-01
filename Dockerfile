FROM python:3.6-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip
COPY requirements.txt /code/

RUN pip install -r requirements.txt

#CMD django-admin startproject hello_world_django
#CMD cd hello_world_django
#CMD python manage.py runserver 0.0.0.0:8000
