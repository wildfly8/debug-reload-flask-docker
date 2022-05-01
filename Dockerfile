FROM python:3.8-slim-buster as base
LABEL maintainer "wildfly8"
RUN apt-get update
RUN pip install --upgrade pip
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
ENV FLASK_ENV="docker"
ENV FLASK_APP=app.py
EXPOSE 5000
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# FROM base as debug
# RUN pip install debugpy

FROM base as prod
# Production image
RUN pip install gunicorn
# COPY . .
# CMD ["gunicorn", "--reload", "--bind", "0.0.0.0:5000", "app:app"]
